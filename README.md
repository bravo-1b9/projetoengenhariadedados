# Atividade para avaliação - Engenharia de Dados - 2025-1

## Alunos do Grupo
- Domingos Savio Pereira da Costa
- Jean Marcos Barbosa de Souza
- João Paulo Del Vecchio Lima

## Modelos ##
### Camada Bronze ###
Aqui, os dados do exemplo são carregados no nosso Data Warehouse exatamente como vieram da fonte, sem nenhuma modificação. 

### Camada Silver ###
Começamos a agregar valor. O objetivo aqui foi limpar, padronizar e modelar os dados brutos, tornando-os mais confiáveis e fáceis de usar.
- stg_clientes
- stg_pagamentos
- stg_pedidos

### Camada Gold ###
Aqui, unimos os dados limpos da camada Silver para criar modelos de dados agregados que respondem diretamente a perguntas de negócio.
- clientes
  - ex.: LTV do cliente
- pedidos
  - ex: qtd de pedidos por tipo de pagamento
- receitas
  - ex.: receita dos pedidos agregada por mês e ano
- devoluções
  - ex.: nro de pedidos devolvidos e quanto isto representa em receita perdida
## Macros ##
- Extração de ano a partir de campos de data (usado nos modelos **receitas** e **devoluções**)
- Extração de mês a partir de campos de data (usado nos modelos **receitas** e **devoluções**)






