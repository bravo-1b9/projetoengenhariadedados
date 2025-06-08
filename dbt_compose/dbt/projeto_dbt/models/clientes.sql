-- O que este poderoso código Gold faz?
-- Ele usa CTEs (Common Table Expressions, ou with ... as (...)) para organizar a lógica.
-- Primeiro, ele junta pedidos e pagamentos.
-- Depois, na CTE metricas_cliente, ele calcula para cada cliente:
-- A data do primeiro pedido.
-- A data do último pedido.
-- O número total de pedidos.
-- O valor total que o cliente já gastou (Lifetime Value).
-- Por fim, ele junta essas métricas com as informações do cliente para criar uma tabela final clientes que é extremamente rica para análise de negócio.

with clientes as (
    select * from {{ ref('stg_clientes') }}
),

pedidos as (
    select * from {{ ref('stg_pedidos') }}
),

pagamentos as (
    select * from {{ ref('stg_pagamentos') }}
),

pedidos_pagamentos as (
    select
        p.id_pedido,
        p.id_cliente,
        p.data_pedido,
        pag.valor_pagamento
    from pedidos p
    left join pagamentos pag on p.id_pedido = pag.id_pedido
),

metricas_cliente as (
    select
        id_cliente,
        min(data_pedido) as primeira_data_pedido,
        max(data_pedido) as ultima_data_pedido,
        count(id_pedido) as numero_de_pedidos,
        sum(valor_pagamento) as valor_total_gasto -- Lifetime Value (LTV)
    from pedidos_pagamentos
    group by 1
)

select
    c.id_cliente,
    c.nome_completo,
    m.primeira_data_pedido,
    m.ultima_data_pedido,
    m.numero_de_pedidos,
    coalesce(m.valor_total_gasto, 0) as valor_total_gasto
from clientes c
left join metricas_cliente m on c.id_cliente = m.id_cliente
