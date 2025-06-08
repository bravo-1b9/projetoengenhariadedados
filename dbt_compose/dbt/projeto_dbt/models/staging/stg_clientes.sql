select
    id as id_cliente,
    first_name as primeiro_nome,
    last_name as sobrenome,
    -- Concatenando nome e sobrenome para criar o nome completo
    first_name || ' ' || last_name as nome_completo

from {{ ref('raw_clientes') }}