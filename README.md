# 📦 Data Mart - Índice de Satisfação da Entrega de Produtos (Modelo Snowflake)

<br><br>
📌 **Descrição do Projeto**
<br><br>
Este projeto apresenta um modelo dimensional Snowflake desenvolvido para o Data Mart de Índice de Satisfação da Entrega de Produtos da empresa fictícia Melhores Compras. 

A iniciativa visa permitir a análise de desempenho da logística de entregas com base nas avaliações dos clientes, otimizando a qualidade da entrega, pontualidade e cordialidade dos entregadores.


O modelo foi construído no Oracle Data Modeler, a partir de uma tabela achatada (flattened table) fornecida pela empresa, contendo informações sobre pedidos, clientes, localizações e avaliações. 

A modelagem Snowflake foi adotada para reduzir a redundância e garantir maior eficiência nas consultas analíticas.

<br><br>
🎯 **Objetivo do Projeto**
<br><br>
Este projeto visa responder perguntas estratégicas dos executivos da empresa, tais como:


Qual o tempo médio das entregas realizadas por cada Centro de Distribuição?

Quais os Centros de Distribuição melhor avaliados pelos clientes?

Como as notas de avaliação variam ao longo do tempo e por localização?

Qual a relação entre tempo de entrega e satisfação do cliente?

<br><br>
🏗️ **Modelagem Dimensional - Snowflake**
<br><br>
O modelo de dados foi estruturado utilizando a técnica de modelagem Snowflake, onde:

As dimensões foram normalizadas para evitar redundâncias;

Hierarquias foram respeitadas para permitir análises em diferentes níveis (ex: Produto → Subcategoria → Categoria);

As datas foram tratadas como dimensões de múltiplos papéis (Role-Playing Dimensions), separando Data do Pedido, Data Prevista de Entrega e Data Real de Entrega.

<br><br>
📜 **Estrutura do Projeto**
<br><br>
O repositório contém os seguintes arquivos:

📄 Modelo Snowflake.pdf → Diagrama do modelo dimensional, gerado no Oracle Data Modeler.

🗄️ cria.sql → Script de criação do banco de dados e tabelas dimensionais.

❌ apaga.sql → Script de remoção das tabelas.

📖 README.md → Este arquivo, com a explicação do projeto.

<br><br>
🚀 **Como Executar**
<br><br>
1️⃣ Ambiente Recomendado

O modelo foi testado no Oracle Autonomous Database (OCI), mas pode ser executado em qualquer SGBD compatível com SQL padrão, como Oracle, PostgreSQL ou MySQL.

2️⃣ Passos para Execução

Criar o banco de dados no Oracle Autonomous Database (ou em um SGBD de sua escolha).

Executar o script cria.sql para criar as tabelas dimensionais e a tabela fato.

Popular as tabelas com dados fictícios ou reais para simular a análise de satisfação.

Rodar consultas analíticas para verificar insights sobre a qualidade das entregas.
