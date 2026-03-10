// ============================================================
// STREAMING SYSTEM - CYPHER SCRIPT
// Graph model: User, Movie, Series, Actor, Director, Genre
// ============================================================


// ------------------------------------------------------------
// 1. CONSTRAINTS
// ------------------------------------------------------------

CREATE CONSTRAINT constraint_user_id IF NOT EXISTS
FOR (u:User) REQUIRE u.id IS UNIQUE;

CREATE CONSTRAINT constraint_movie_id IF NOT EXISTS
FOR (m:Movie) REQUIRE m.id IS UNIQUE;

CREATE CONSTRAINT constraint_series_id IF NOT EXISTS
FOR (s:Series) REQUIRE s.id IS UNIQUE;

CREATE CONSTRAINT constraint_actor_id IF NOT EXISTS
FOR (a:Actor) REQUIRE a.id IS UNIQUE;

CREATE CONSTRAINT constraint_director_id IF NOT EXISTS
FOR (d:Director) REQUIRE d.id IS UNIQUE;

CREATE CONSTRAINT constraint_genre_id IF NOT EXISTS
FOR (g:Genre) REQUIRE g.id IS UNIQUE;


// ------------------------------------------------------------
// 2. GENRES
// ------------------------------------------------------------

MERGE (g1:Genre  {id: 'genre-1',  name: 'Action'});
MERGE (g2:Genre  {id: 'genre-2',  name: 'Drama'});
MERGE (g3:Genre  {id: 'genre-3',  name: 'Comedy'});
MERGE (g4:Genre  {id: 'genre-4',  name: 'Thriller'});
MERGE (g5:Genre  {id: 'genre-5',  name: 'Sci-Fi'});
MERGE (g6:Genre  {id: 'genre-6',  name: 'Horror'});
MERGE (g7:Genre  {id: 'genre-7',  name: 'Romance'});
MERGE (g8:Genre  {id: 'genre-8',  name: 'Documentary'});


// ------------------------------------------------------------
// 3. DIRECTORS
// ------------------------------------------------------------

MERGE (d1:Director {id: 'dir-1', name: 'Christopher Nolan',   nationality: 'British'});
MERGE (d2:Director {id: 'dir-2', name: 'Martin Scorsese',     nationality: 'American'});
MERGE (d3:Director {id: 'dir-3', name: 'Greta Gerwig',        nationality: 'American'});
MERGE (d4:Director {id: 'dir-4', name: 'Bong Joon-ho',        nationality: 'South Korean'});
MERGE (d5:Director {id: 'dir-5', name: 'Denis Villeneuve',    nationality: 'Canadian'});
MERGE (d6:Director {id: 'dir-6', name: 'Ava DuVernay',        nationality: 'American'});
MERGE (d7:Director {id: 'dir-7', name: 'Alfonso Cuarón',      nationality: 'Mexican'});


// ------------------------------------------------------------
// 4. ACTORS
// ------------------------------------------------------------

MERGE (a1:Actor  {id: 'act-1',  name: 'Leonardo DiCaprio', birthYear: 1974});
MERGE (a2:Actor  {id: 'act-2',  name: 'Cate Blanchett',    birthYear: 1969});
MERGE (a3:Actor  {id: 'act-3',  name: 'Timothée Chalamet', birthYear: 1995});
MERGE (a4:Actor  {id: 'act-4',  name: 'Zendaya',           birthYear: 2002});
MERGE (a5:Actor  {id: 'act-5',  name: 'Margot Robbie',     birthYear: 1990});
MERGE (a6:Actor  {id: 'act-6',  name: 'Adam Driver',       birthYear: 1983});
MERGE (a7:Actor  {id: 'act-7',  name: 'Viola Davis',       birthYear: 1965});
MERGE (a8:Actor  {id: 'act-8',  name: 'Pedro Pascal',      birthYear: 1975});
MERGE (a9:Actor  {id: 'act-9',  name: 'Anya Taylor-Joy',   birthYear: 1996});
MERGE (a10:Actor {id: 'act-10', name: 'Ryan Gosling',      birthYear: 1980});


// ------------------------------------------------------------
// 5. MOVIES
// ------------------------------------------------------------

MERGE (m1:Movie  {id: 'mov-1',  title: 'Inception',          year: 2010, duration: 148});
MERGE (m2:Movie  {id: 'mov-2',  title: 'The Departed',       year: 2006, duration: 151});
MERGE (m3:Movie  {id: 'mov-3',  title: 'Barbie',             year: 2023, duration: 114});
MERGE (m4:Movie  {id: 'mov-4',  title: 'Parasite',           year: 2019, duration: 132});
MERGE (m5:Movie  {id: 'mov-5',  title: 'Dune',               year: 2021, duration: 155});
MERGE (m6:Movie  {id: 'mov-6',  title: 'Interstellar',       year: 2014, duration: 169});
MERGE (m7:Movie  {id: 'mov-7',  title: 'Killers of Flower Moon', year: 2023, duration: 206});
MERGE (m8:Movie  {id: 'mov-8',  title: 'Marriage Story',     year: 2019, duration: 137});
MERGE (m9:Movie  {id: 'mov-9',  title: 'Roma',               year: 2018, duration: 135});
MERGE (m10:Movie {id: 'mov-10', title: 'The Revenant',       year: 2015, duration: 156});


// ------------------------------------------------------------
// 6. SERIES
// ------------------------------------------------------------

MERGE (s1:Series  {id: 'ser-1',  title: 'The Mandalorian',    seasons: 3, year: 2019});
MERGE (s2:Series  {id: 'ser-2',  title: 'The Last of Us',     seasons: 1, year: 2023});
MERGE (s3:Series  {id: 'ser-3',  title: 'Euphoria',           seasons: 2, year: 2019});
MERGE (s4:Series  {id: 'ser-4',  title: 'The Queens Gambit',  seasons: 1, year: 2020});
MERGE (s5:Series  {id: 'ser-5',  title: 'Succession',         seasons: 4, year: 2018});
MERGE (s6:Series  {id: 'ser-6',  title: 'Severance',          seasons: 2, year: 2022});
MERGE (s7:Series  {id: 'ser-7',  title: 'Wednesday',          seasons: 1, year: 2022});
MERGE (s8:Series  {id: 'ser-8',  title: 'The Bear',           seasons: 3, year: 2022});
MERGE (s9:Series  {id: 'ser-9',  title: 'Dark',               seasons: 3, year: 2017});
MERGE (s10:Series {id: 'ser-10', title: 'Shogun',             seasons: 1, year: 2024});


// ------------------------------------------------------------
// 7. USERS
// ------------------------------------------------------------

MERGE (u1:User  {id: 'usr-1',  name: 'Alice Mendes',   email: 'alice@email.com',   plan: 'Premium'});
MERGE (u2:User  {id: 'usr-2',  name: 'Bruno Lima',     email: 'bruno@email.com',   plan: 'Basic'});
MERGE (u3:User  {id: 'usr-3',  name: 'Carla Souza',    email: 'carla@email.com',   plan: 'Premium'});
MERGE (u4:User  {id: 'usr-4',  name: 'Daniel Costa',   email: 'daniel@email.com',  plan: 'Standard'});
MERGE (u5:User  {id: 'usr-5',  name: 'Elena Ferreira', email: 'elena@email.com',   plan: 'Premium'});
MERGE (u6:User  {id: 'usr-6',  name: 'Felipe Rocha',   email: 'felipe@email.com',  plan: 'Basic'});
MERGE (u7:User  {id: 'usr-7',  name: 'Gabriela Nunes', email: 'gabi@email.com',    plan: 'Standard'});
MERGE (u8:User  {id: 'usr-8',  name: 'Henrique Pires', email: 'henrique@email.com',plan: 'Premium'});
MERGE (u9:User  {id: 'usr-9',  name: 'Isabela Dias',   email: 'isa@email.com',     plan: 'Basic'});
MERGE (u10:User {id: 'usr-10', name: 'João Alves',     email: 'joao@email.com',    plan: 'Standard'});


// ------------------------------------------------------------
// 8. RELATIONSHIPS: Movie -[:IN_GENRE]-> Genre
// ------------------------------------------------------------

MATCH (m:Movie {id:'mov-1'}),  (g:Genre {id:'genre-5'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id:'mov-1'}),  (g:Genre {id:'genre-4'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id:'mov-2'}),  (g:Genre {id:'genre-2'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id:'mov-2'}),  (g:Genre {id:'genre-4'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id:'mov-3'}),  (g:Genre {id:'genre-3'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id:'mov-4'}),  (g:Genre {id:'genre-4'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id:'mov-4'}),  (g:Genre {id:'genre-2'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id:'mov-5'}),  (g:Genre {id:'genre-5'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id:'mov-5'}),  (g:Genre {id:'genre-1'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id:'mov-6'}),  (g:Genre {id:'genre-5'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id:'mov-7'}),  (g:Genre {id:'genre-2'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id:'mov-8'}),  (g:Genre {id:'genre-2'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id:'mov-8'}),  (g:Genre {id:'genre-7'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id:'mov-9'}),  (g:Genre {id:'genre-2'}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {id:'mov-10'}), (g:Genre {id:'genre-1'}) MERGE (m)-[:IN_GENRE]->(g);


// ------------------------------------------------------------
// 9. RELATIONSHIPS: Series -[:IN_GENRE]-> Genre
// ------------------------------------------------------------

MATCH (s:Series {id:'ser-1'}),  (g:Genre {id:'genre-1'}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {id:'ser-2'}),  (g:Genre {id:'genre-6'}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {id:'ser-2'}),  (g:Genre {id:'genre-2'}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {id:'ser-3'}),  (g:Genre {id:'genre-2'}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {id:'ser-4'}),  (g:Genre {id:'genre-2'}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {id:'ser-5'}),  (g:Genre {id:'genre-2'}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {id:'ser-6'}),  (g:Genre {id:'genre-4'}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {id:'ser-6'}),  (g:Genre {id:'genre-5'}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {id:'ser-7'}),  (g:Genre {id:'genre-3'}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {id:'ser-8'}),  (g:Genre {id:'genre-2'}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {id:'ser-9'}),  (g:Genre {id:'genre-5'}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {id:'ser-9'}),  (g:Genre {id:'genre-4'}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {id:'ser-10'}), (g:Genre {id:'genre-1'}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {id:'ser-10'}), (g:Genre {id:'genre-2'}) MERGE (s)-[:IN_GENRE]->(g);


// ------------------------------------------------------------
// 10. RELATIONSHIPS: Actor -[:ACTED_IN]-> Movie
// ------------------------------------------------------------

MATCH (a:Actor {id:'act-1'}),  (m:Movie {id:'mov-1'})  MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id:'act-1'}),  (m:Movie {id:'mov-6'})  MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id:'act-1'}),  (m:Movie {id:'mov-7'})  MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id:'act-1'}),  (m:Movie {id:'mov-10'}) MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id:'act-2'}),  (m:Movie {id:'mov-9'})  MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id:'act-3'}),  (m:Movie {id:'mov-5'})  MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id:'act-4'}),  (m:Movie {id:'mov-5'})  MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id:'act-5'}),  (m:Movie {id:'mov-3'})  MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id:'act-6'}),  (m:Movie {id:'mov-8'})  MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id:'act-7'}),  (m:Movie {id:'mov-7'})  MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id:'act-8'}),  (m:Movie {id:'mov-5'})  MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id:'act-9'}),  (m:Movie {id:'mov-2'})  MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id:'act-10'}), (m:Movie {id:'mov-3'})  MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {id:'act-10'}), (m:Movie {id:'mov-10'}) MERGE (a)-[:ACTED_IN]->(m);


// ------------------------------------------------------------
// 11. RELATIONSHIPS: Actor -[:ACTED_IN]-> Series
// ------------------------------------------------------------

MATCH (a:Actor {id:'act-8'}),  (s:Series {id:'ser-1'})  MERGE (a)-[:ACTED_IN]->(s);
MATCH (a:Actor {id:'act-4'}),  (s:Series {id:'ser-3'})  MERGE (a)-[:ACTED_IN]->(s);
MATCH (a:Actor {id:'act-9'}),  (s:Series {id:'ser-4'})  MERGE (a)-[:ACTED_IN]->(s);
MATCH (a:Actor {id:'act-6'}),  (s:Series {id:'ser-6'})  MERGE (a)-[:ACTED_IN]->(s);
MATCH (a:Actor {id:'act-7'}),  (s:Series {id:'ser-5'})  MERGE (a)-[:ACTED_IN]->(s);
MATCH (a:Actor {id:'act-3'}),  (s:Series {id:'ser-10'}) MERGE (a)-[:ACTED_IN]->(s);
MATCH (a:Actor {id:'act-5'}),  (s:Series {id:'ser-7'})  MERGE (a)-[:ACTED_IN]->(s);
MATCH (a:Actor {id:'act-2'}),  (s:Series {id:'ser-9'})  MERGE (a)-[:ACTED_IN]->(s);


// ------------------------------------------------------------
// 12. RELATIONSHIPS: Director -[:DIRECTED]-> Movie
// ------------------------------------------------------------

MATCH (d:Director {id:'dir-1'}), (m:Movie {id:'mov-1'})  MERGE (d)-[:DIRECTED]->(m);
MATCH (d:Director {id:'dir-1'}), (m:Movie {id:'mov-6'})  MERGE (d)-[:DIRECTED]->(m);
MATCH (d:Director {id:'dir-2'}), (m:Movie {id:'mov-2'})  MERGE (d)-[:DIRECTED]->(m);
MATCH (d:Director {id:'dir-2'}), (m:Movie {id:'mov-7'})  MERGE (d)-[:DIRECTED]->(m);
MATCH (d:Director {id:'dir-3'}), (m:Movie {id:'mov-3'})  MERGE (d)-[:DIRECTED]->(m);
MATCH (d:Director {id:'dir-4'}), (m:Movie {id:'mov-4'})  MERGE (d)-[:DIRECTED]->(m);
MATCH (d:Director {id:'dir-5'}), (m:Movie {id:'mov-5'})  MERGE (d)-[:DIRECTED]->(m);
MATCH (d:Director {id:'dir-6'}), (m:Movie {id:'mov-8'})  MERGE (d)-[:DIRECTED]->(m);
MATCH (d:Director {id:'dir-7'}), (m:Movie {id:'mov-9'})  MERGE (d)-[:DIRECTED]->(m);
MATCH (d:Director {id:'dir-1'}), (m:Movie {id:'mov-10'}) MERGE (d)-[:DIRECTED]->(m);


// ------------------------------------------------------------
// 13. RELATIONSHIPS: Director -[:DIRECTED]-> Series
// ------------------------------------------------------------

MATCH (d:Director {id:'dir-5'}), (s:Series {id:'ser-9'})  MERGE (d)-[:DIRECTED]->(s);
MATCH (d:Director {id:'dir-6'}), (s:Series {id:'ser-10'}) MERGE (d)-[:DIRECTED]->(s);
MATCH (d:Director {id:'dir-7'}), (s:Series {id:'ser-6'})  MERGE (d)-[:DIRECTED]->(s);
MATCH (d:Director {id:'dir-3'}), (s:Series {id:'ser-4'})  MERGE (d)-[:DIRECTED]->(s);
MATCH (d:Director {id:'dir-2'}), (s:Series {id:'ser-5'})  MERGE (d)-[:DIRECTED]->(s);


// ------------------------------------------------------------
// 14. RELATIONSHIPS: User -[:Watched]-> Movie
// ------------------------------------------------------------

MATCH (u:User {id:'usr-1'}),  (m:Movie {id:'mov-1'})  MERGE (u)-[:Watched {watchedAt: date('2024-01-10'), rating: 9}]->(m);
MATCH (u:User {id:'usr-1'}),  (m:Movie {id:'mov-5'})  MERGE (u)-[:Watched {watchedAt: date('2024-02-15'), rating: 8}]->(m);
MATCH (u:User {id:'usr-2'}),  (m:Movie {id:'mov-2'})  MERGE (u)-[:Watched {watchedAt: date('2024-01-22'), rating: 10}]->(m);
MATCH (u:User {id:'usr-2'}),  (m:Movie {id:'mov-4'})  MERGE (u)-[:Watched {watchedAt: date('2024-03-05'), rating: 9}]->(m);
MATCH (u:User {id:'usr-3'}),  (m:Movie {id:'mov-3'})  MERGE (u)-[:Watched {watchedAt: date('2024-01-30'), rating: 7}]->(m);
MATCH (u:User {id:'usr-3'}),  (m:Movie {id:'mov-6'})  MERGE (u)-[:Watched {watchedAt: date('2024-02-28'), rating: 10}]->(m);
MATCH (u:User {id:'usr-4'}),  (m:Movie {id:'mov-7'})  MERGE (u)-[:Watched {watchedAt: date('2024-03-10'), rating: 8}]->(m);
MATCH (u:User {id:'usr-5'}),  (m:Movie {id:'mov-8'})  MERGE (u)-[:Watched {watchedAt: date('2024-01-05'), rating: 9}]->(m);
MATCH (u:User {id:'usr-5'}),  (m:Movie {id:'mov-10'}) MERGE (u)-[:Watched {watchedAt: date('2024-03-20'), rating: 9}]->(m);
MATCH (u:User {id:'usr-6'}),  (m:Movie {id:'mov-9'})  MERGE (u)-[:Watched {watchedAt: date('2024-02-10'), rating: 8}]->(m);
MATCH (u:User {id:'usr-7'}),  (m:Movie {id:'mov-1'})  MERGE (u)-[:Watched {watchedAt: date('2024-01-18'), rating: 7}]->(m);
MATCH (u:User {id:'usr-7'}),  (m:Movie {id:'mov-3'})  MERGE (u)-[:Watched {watchedAt: date('2024-03-01'), rating: 6}]->(m);
MATCH (u:User {id:'usr-8'}),  (m:Movie {id:'mov-5'})  MERGE (u)-[:Watched {watchedAt: date('2024-02-20'), rating: 9}]->(m);
MATCH (u:User {id:'usr-8'}),  (m:Movie {id:'mov-6'})  MERGE (u)-[:Watched {watchedAt: date('2024-03-15'), rating: 10}]->(m);
MATCH (u:User {id:'usr-9'}),  (m:Movie {id:'mov-4'})  MERGE (u)-[:Watched {watchedAt: date('2024-01-25'), rating: 8}]->(m);
MATCH (u:User {id:'usr-10'}), (m:Movie {id:'mov-2'})  MERGE (u)-[:Watched {watchedAt: date('2024-03-08'), rating: 7}]->(m);
MATCH (u:User {id:'usr-10'}), (m:Movie {id:'mov-7'})  MERGE (u)-[:Watched {watchedAt: date('2024-03-22'), rating: 8}]->(m);


// ------------------------------------------------------------
// 15. RELATIONSHIPS: User -[:Watched]-> Series
// ------------------------------------------------------------

MATCH (u:User {id:'usr-1'}),  (s:Series {id:'ser-1'})  MERGE (u)-[:Watched {watchedAt: date('2024-01-12'), rating: 9}]->(s);
MATCH (u:User {id:'usr-1'}),  (s:Series {id:'ser-4'})  MERGE (u)-[:Watched {watchedAt: date('2024-02-18'), rating: 10}]->(s);
MATCH (u:User {id:'usr-2'}),  (s:Series {id:'ser-3'})  MERGE (u)-[:Watched {watchedAt: date('2024-01-28'), rating: 7}]->(s);
MATCH (u:User {id:'usr-3'}),  (s:Series {id:'ser-5'})  MERGE (u)-[:Watched {watchedAt: date('2024-02-05'), rating: 9}]->(s);
MATCH (u:User {id:'usr-4'}),  (s:Series {id:'ser-6'})  MERGE (u)-[:Watched {watchedAt: date('2024-03-12'), rating: 8}]->(s);
MATCH (u:User {id:'usr-4'}),  (s:Series {id:'ser-9'})  MERGE (u)-[:Watched {watchedAt: date('2024-02-22'), rating: 10}]->(s);
MATCH (u:User {id:'usr-5'}),  (s:Series {id:'ser-2'})  MERGE (u)-[:Watched {watchedAt: date('2024-01-08'), rating: 9}]->(s);
MATCH (u:User {id:'usr-6'}),  (s:Series {id:'ser-7'})  MERGE (u)-[:Watched {watchedAt: date('2024-03-03'), rating: 7}]->(s);
MATCH (u:User {id:'usr-7'}),  (s:Series {id:'ser-8'})  MERGE (u)-[:Watched {watchedAt: date('2024-02-14'), rating: 8}]->(s);
MATCH (u:User {id:'usr-8'}),  (s:Series {id:'ser-10'}) MERGE (u)-[:Watched {watchedAt: date('2024-03-18'), rating: 9}]->(s);
MATCH (u:User {id:'usr-9'}),  (s:Series {id:'ser-1'})  MERGE (u)-[:Watched {watchedAt: date('2024-01-20'), rating: 8}]->(s);
MATCH (u:User {id:'usr-9'}),  (s:Series {id:'ser-6'})  MERGE (u)-[:Watched {watchedAt: date('2024-03-25'), rating: 9}]->(s);
MATCH (u:User {id:'usr-10'}), (s:Series {id:'ser-3'})  MERGE (u)-[:Watched {watchedAt: date('2024-02-08'), rating: 6}]->(s);
MATCH (u:User {id:'usr-10'}), (s:Series {id:'ser-5'})  MERGE (u)-[:Watched {watchedAt: date('2024-03-28'), rating: 8}]->(s);
