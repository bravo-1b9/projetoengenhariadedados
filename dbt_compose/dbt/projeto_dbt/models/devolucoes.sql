with pedidos as (

    select * from {{ ref('pedidos') }}

),

final as (

    select      
        {{  ano("pedidos.data_pedido") }} as ano,
        {{  mes("pedidos.data_pedido") }} as mes,
        count(pedidos.id_pedido) as devolucoes,
        sum(pedidos.valor) as valor_devolvido        
    from pedidos
    where pedidos.status = 'returned'
    group by 1, 2

)

select * from final
