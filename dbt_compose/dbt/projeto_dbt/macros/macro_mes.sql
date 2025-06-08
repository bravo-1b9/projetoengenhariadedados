{#
    Macro para calcular o mês a partir de uma data.
    Esta macro recebe uma data como entrada e retorna o mês correspondente.
#}
{% macro mes(data) %}
     EXTRACT(MONTH FROM {{data}}) 
{% endmacro %}