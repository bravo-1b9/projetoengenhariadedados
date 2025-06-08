{#
    Macro para calcular o ano a partir de uma data.
    Esta macro recebe uma data como entrada e retorna o ano correspondente.
#}
{% macro ano(data) %}
    EXTRACT(YEAR FROM {{data}})
{% endmacro %}