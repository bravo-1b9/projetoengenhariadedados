select
    -- Colunas de IDs
    id as id_pagamento,  -- Renomeando para maior clareza
    order_id as id_pedido,

    -- Colunas de dados
    payment_method as metodo_de_pagamento,

    -- Transformação do valor para formato monetário (ex: 1000 -> 10.00)
    -- Dividimos por 100 e garantimos que o resultado seja um número decimal.
    amount / 100.0 as valor_pagamento

from {{ ref('raw_pagamentos') }}