🎬 StreamGraph — Modelagem de Sistema de Streaming com Neo4j

Banco de Dados de Grafos aplicado a um sistema de streaming
Modelagem, população e consultas analíticas com Neo4j + Cypher


📋 Índice

Contexto do Problema
Por que Grafos?
Modelo do Grafo
Tecnologias
Como Executar
Queries de Negócio
Troubleshooting — As Cicatrizes do Projeto
Aprendizados


🎯 Contexto do Problema
Plataformas de streaming como Netflix, HBO Max e Disney+ gerenciam um ecossistema complexo de relacionamentos entre usuários, conteúdos, artistas e categorias. As perguntas que movem o negócio são essencialmente perguntas sobre conexões:

Quais usuários têm padrão de consumo parecido?
Quais atores aparecem em mais títulos do catálogo?
Por qual série um usuário chegou a gostar de determinado gênero?

Em bancos de dados relacionais tradicionais, responder essas perguntas exige múltiplos JOINs em tabelas intermediárias, o que aumenta a complexidade da query e o custo de performance conforme os dados crescem.
Este projeto modela esse domínio como um grafo de propriedades no Neo4j, tornando as consultas relacionais diretas, legíveis e performáticas.

🔍 Por que Grafos?
O problema com o modelo relacional
Para responder "quais usuários assistiram os mesmos filmes?" em SQL, precisamos de algo assim:
sqlSELECT u1.name, u2.name, COUNT(*) AS filmes_em_comum
FROM watched w1
JOIN watched w2 ON w1.movie_id = w2.movie_id AND w1.user_id < w2.user_id
JOIN users u1 ON w1.user_id = u1.id
JOIN users u2 ON w2.user_id = u2.id
GROUP BY u1.name, u2.name
ORDER BY filmes_em_comum DESC;
A mesma pergunta em Cypher (Neo4j)
cypherMATCH (u1:User)-[:Watched]->(m:Movie)<-[:Watched]-(u2:User)
WHERE u1.id < u2.id
RETURN u1.name, u2.name, count(m) AS FilmesEmComum
ORDER BY FilmesEmComum DESC
A query Cypher lê exatamente como o problema é descrito: "encontre usuários que assistiram ao mesmo filme". Não há tabelas de junção, não há aliases confusos — o grafo é o modelo.
Vantagens para este domínio
CritérioRelacionalGrafosConsultas de relacionamentoMúltiplos JOINsTravessia diretaLegibilidade da queryComplexaPróxima da linguagem naturalAdição de novos relacionamentosNovas tabelas/colunasNova aresta, sem migraçãoAlgoritmos de recomendaçãoDifícilNativos (PageRank, similaridade)Visualização dos dadosTabelasGrafo interativo

🗂 Modelo do Grafo
         (Actor)
            |
        ACTED_IN
       ↙        ↘
(Genre) ← IN_GENRE ← (Movie) ← Watched ← (User) → Watched → (Series) → IN_GENRE → (Genre)
                      (Movie) ← DIRECTED ← (Director) → DIRECTED → (Series)
Nós (Labels)
LabelPropriedadesUserid, name, email, planMovieid, title, year, durationSeriesid, title, year, seasonsActorid, name, birthYearDirectorid, name, nationalityGenreid, name
Relacionamentos
RelacionamentoDireçãoPropriedadesWatchedUser → Movie / SerieswatchedAt (date), rating (1–10)ACTED_INActor → Movie / Series—DIRECTEDDirector → Movie / Series—IN_GENREMovie / Series → Genre—

🛠 Tecnologias

Neo4j 5.x — banco de dados de grafos
Cypher — linguagem de consulta declarativa para grafos
Neo4j Browser — interface web para execução de queries e visualização
Neo4j Bloom (opcional) — visualização avançada de grafos


🚀 Como Executar
Pré-requisitos

Neo4j Desktop instalado → download
ou Neo4j AuraDB (cloud gratuito) → aura.neo4j.io

Passo a passo
1. Criar o banco de dados
No Neo4j Desktop, crie um novo projeto e inicie um banco local (Neo4j 5.x).
2. Abrir o Browser
Clique em "Open" → "Neo4j Browser". Faça login com as credenciais do banco (padrão: neo4j / senha que você definiu).
3. Executar o script
Copie o conteúdo do arquivo streaming_graph.cypher e cole no campo de texto do Browser. Execute com Ctrl+Enter.

⚠️ Atenção: Execute o script completo de uma vez. O arquivo usa MERGE em vez de CREATE, portanto é seguro re-executar sem duplicar dados.

4. Verificar a carga
cypher// Contar os nós por label
MATCH (n)
RETURN labels(n) AS Label, count(n) AS Total
ORDER BY Total DESC
Resultado esperado:
LabelTotalMovie10Series10User10Actor10Director7Genre8
5. Visualizar o grafo completo
cypherMATCH (n)-[r]->(m)
RETURN n, r, m
LIMIT 100

📊 Queries de Negócio
Q1 — Filmes mais assistidos
cypherMATCH (u:User)-[w:Watched]->(m:Movie)
RETURN m.title AS Filme,
       count(u) AS TotalVisualizacoes,
       round(avg(w.rating), 2) AS NotaMedia
ORDER BY TotalVisualizacoes DESC
LIMIT 5
Insight: Identifica títulos populares para priorizar licenciamento e campanhas de marketing.

Q2 — Usuários com gostos similares (base para recomendação)
cypherMATCH (u1:User)-[:Watched]->(m:Movie)<-[:Watched]-(u2:User)
WHERE u1.id < u2.id
RETURN u1.name AS Usuario1,
       u2.name AS Usuario2,
       count(m) AS FilmesEmComum,
       collect(m.title) AS Titulos
ORDER BY FilmesEmComum DESC
LIMIT 10
Insight: Pares de usuários com alta similaridade são a semente de um motor de recomendação colaborativo.

Q3 — Atores que dominam o catálogo (visualização em grafo)
cypherMATCH (a:Actor)-[:ACTED_IN]->(c)
WHERE c:Movie OR c:Series
WITH a, collect(c) AS conteudos
WHERE size(conteudos) >= 2
UNWIND conteudos AS c
RETURN a, c

💡 Use esta versão para ver o grafo visual no Browser. Para a tabela de ranking, use count(c) e collect(c.title).


Q4 — Gêneros mais consumidos
cypherMATCH (u:User)-[:Watched]->(c)-[:IN_GENRE]->(g:Genre)
WHERE c:Movie OR c:Series
RETURN g.name AS Genero,
       count(u) AS TotalVisualizacoes
ORDER BY TotalVisualizacoes DESC

Q5 — Séries mais bem avaliadas
cypherMATCH (u:User)-[w:Watched]->(s:Series)
RETURN s.title AS Serie,
       s.seasons AS Temporadas,
       round(avg(w.rating), 2) AS NotaMedia,
       count(u) AS NumAvaliacoes
ORDER BY NotaMedia DESC, NumAvaliacoes DESC

Q6 — Jornada de descoberta: usuário → série → gênero
cypherMATCH path = (u:User {name: 'Alice Mendes'})
             -[:Watched]->(s:Series)
             -[:IN_GENRE]->(g:Genre)
RETURN u.name AS Usuario,
       s.title AS Serie,
       g.name AS Genero

Q7 — Usuários Premium sem séries recentes (risco de churn)
cypherMATCH (u:User {plan: 'Premium'})
WHERE NOT EXISTS {
  MATCH (u)-[:Watched]->(s:Series)
  WHERE s.year >= 2023
}
RETURN u.name AS Usuario, u.email AS Email, u.plan AS Plano

Q8 — Diretor com maior diversidade de gêneros
cypherMATCH (d:Director)-[:DIRECTED]->(c)-[:IN_GENRE]->(g:Genre)
WHERE c:Movie OR c:Series
RETURN d.name AS Diretor,
       count(DISTINCT g) AS GenerosDiferentes,
       collect(DISTINCT g.name) AS Generos
ORDER BY GenerosDiferentes DESC

🩹 Troubleshooting — As Cicatrizes do Projeto
❌ Problema 1: avg(u.rating) retornava null
Sintoma: A query Q1 retornava a coluna NotaMedia com valor nulo para todos os filmes.
Causa raiz: O rating é uma propriedade do relacionamento Watched, não do nó User. A query estava tentando acessar u.rating (propriedade do nó), que não existe.
Solução: Capturar o relacionamento com um alias [w:Watched] e referenciar w.rating:
cypher-- ❌ Errado
MATCH (u:User)-[:Watched]->(m:Movie)
RETURN avg(u.rating)  -- u é o nó User, não tem rating

-- ✅ Correto
MATCH (u:User)-[w:Watched]->(m:Movie)
RETURN avg(w.rating)  -- w é o relacionamento, que tem rating
Aprendizado: Em grafos, propriedades podem viver tanto em nós quanto em relacionamentos. Sempre verificar onde o dado está modelado antes de escrever a query. O diagrama do modelo é o mapa — consulte-o antes de codar.

❌ Problema 2: Query de atores não gerava visualização em grafo
Sintoma: Ao tentar clicar no ícone de grafo no Neo4j Browser após executar a Q3 com count() e collect(), o ícone ficava desabilitado.
Causa raiz: O Browser só consegue montar a visualização em grafo quando a query retorna nós e relacionamentos diretamente. Queries que retornam agregações (count, collect, avg) produzem apenas dados tabulares — não há estrutura de grafo para renderizar.
Solução: Criar duas versões da query: uma para análise tabular (com agregações) e outra para visualização (retornando nós):
cypher-- Para tabela (ranking)
MATCH (a:Actor)-[:ACTED_IN]->(c)
WHERE c:Movie OR c:Series
RETURN a.name, count(c) AS Total
ORDER BY Total DESC

-- Para grafo visual
MATCH (a:Actor)-[:ACTED_IN]->(c)
WHERE c:Movie OR c:Series
WITH a, collect(c) AS conteudos
WHERE size(conteudos) >= 2
UNWIND conteudos AS c
RETURN a, c
Aprendizado: Separar a intenção da query — análise vs. visualização — e escrever versões diferentes para cada objetivo. O Neo4j Browser é uma ferramenta de exploração, não de BI; para dashboards, usar ferramentas como Grafana + neo4j-connector ou o próprio Bloom.

❌ Problema 3: Títulos dos filmes apareceram em português no banco
Sintoma: O script foi escrito com títulos em inglês (ex: Inception, The Departed), mas os dados apareceram com títulos em português (ex: "A Origem", "Os Infiltrados") no Neo4j Browser.
Causa raiz: O Neo4j Desktop em português (Brasil) não traduz os dados — mas as queries retornam exatamente o que foi inserido. O banco foi populado com os títulos corretos; o que mudou foi que o Neo4j Browser estava configurado para exibir a interface em PT-BR, e os labels da UI (como "Mesa" em vez de "Table") causaram confusão inicial.
Investigação: Executar MATCH (m:Movie) RETURN m.title LIMIT 5 para confirmar os valores reais armazenados — os títulos estavam em português porque o script foi adaptado antes da execução.
Solução: Não houve bug real. Mas o aprendizado foi importante: sempre verificar os dados brutos no banco antes de assumir que há erro na query.
cypher-- Sempre inspecionar os dados antes de debugar a query
MATCH (m:Movie) RETURN m LIMIT 3

❌ Problema 4: MERGE nas constraints falhava sem IF NOT EXISTS
Sintoma: Ao tentar re-executar o script de criação de constraints, o Neo4j retornava erro de constraint já existente.
Causa raiz: O comando CREATE CONSTRAINT sem a cláusula IF NOT EXISTS falha se a constraint já existir — diferente do MERGE de dados, que é idempotente por natureza.
Solução: Adicionar IF NOT EXISTS em todas as constraints:
cypher-- ❌ Falha na segunda execução
CREATE CONSTRAINT FOR (u:User) REQUIRE u.id IS UNIQUE;

-- ✅ Idempotente
CREATE CONSTRAINT constraint_user_id IF NOT EXISTS
FOR (u:User) REQUIRE u.id IS UNIQUE;
Aprendizado: Scripts de banco de dados precisam ser idempotentes — seguros para executar múltiplas vezes sem efeitos colaterais. Isso é especialmente importante em ambientes de desenvolvimento onde o script é rodado várias vezes durante a iteração.

🎓 Aprendizados
Sobre modelagem em grafos:

A modelagem em grafo força você a pensar em relacionamentos como cidadãos de primeira classe — eles têm propriedades, direção e semântica própria.
Diferente do modelo relacional, onde a estrutura é estática (tabelas e colunas), o grafo cresce organicamente: adicionar um novo tipo de relacionamento não quebra queries existentes.

Sobre Cypher:

Cypher é declarativo e expressivo — a query "parece" com o padrão que você está buscando no grafo.
A diferença entre retornar nós (RETURN a, c) e retornar agregações (RETURN count(c)) define se o resultado pode ser visualizado como grafo ou não.
Propriedades em relacionamentos são subutilizadas por quem vem do modelo relacional, mas são extremamente poderosas (ex: rating e watchedAt em Watched).

Sobre o processo:

Documentar o modelo antes de escrever as queries evita retrabalho — o diagrama é o contrato.
Bugs de "propriedade não encontrada" quase sempre são erros de onde o dado está modelado (nó vs. relacionamento), não erros de sintaxe.


📁 Estrutura do Repositório
📦 streamgraph-neo4j/
├── 📄 README.md                          # Este arquivo
├── 📄 streaming_graph.cypher             # Script completo: constraints + dados + relacionamentos
├── 📄 queries_negocio.cypher             # Queries de negócio comentadas
└── 📁 docs/
    └── 📄 modelo_grafo.png               # Diagrama visual do modelo
