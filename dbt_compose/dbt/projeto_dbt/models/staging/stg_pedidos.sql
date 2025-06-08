select
    -- Colunas de IDs
    id as id_pedido,
    user_id as id_cliente,

    -- Colunas de dados
    order_date as data_pedido,
    status as status_pedido

from {{ ref('raw_pedidos') }}