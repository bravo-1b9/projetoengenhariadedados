with pedidos as (

    select * from {{ ref('pedidos') }}

),

final as (
    select
        {{  ano("pedidos.data_pedido") }} as ano,
        {{  mes("pedidos.data_pedido") }} as mes,
        sum(pedidos.valor) as receita        
    from pedidos
    where pedidos.status = 'completed'
    group by 1, 2

)

select * from final
