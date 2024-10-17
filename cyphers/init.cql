// init.cypher

// 1. Create Genres
CREATE (:Genre {name: 'Action'});
CREATE (:Genre {name: 'Comedy'});
CREATE (:Genre {name: 'Drama'});
CREATE (:Genre {name: 'Sci-Fi'});
CREATE (:Genre {name: 'Thriller'});
CREATE (:Genre {name: 'Romance'});
CREATE (:Genre {name: 'Crime'});

// 2. Create Actors
CREATE (:Actor {name: 'Leonardo DiCaprio', birthdate: date('1974-11-11')});
CREATE (:Actor {name: 'Kate Winslet', birthdate: date('1975-10-05')});
CREATE (:Actor {name: 'Tom Hanks', birthdate: date('1956-07-09')});
CREATE (:Actor {name: 'Morgan Freeman', birthdate: date('1937-06-01')});
CREATE (:Actor {name: 'Scarlett Johansson', birthdate: date('1984-11-22')});
CREATE (:Actor {name: 'Brad Pitt', birthdate: date('1963-12-18')});

// 3. Create Directors
CREATE (:Director {name: 'Christopher Nolan', birthdate: date('1970-07-30')});
CREATE (:Director {name: 'Steven Spielberg', birthdate: date('1946-12-18')});
CREATE (:Director {name: 'James Cameron', birthdate: date('1954-08-16')});
CREATE (:Director {name: 'Quentin Tarantino', birthdate: date('1963-03-27')});
CREATE (:Director {name: 'Frank Darabont', birthdate: date('1959-01-28')});

// 4. Create Movies
CREATE (:Movie {title: 'Inception', release_year: 2010});
CREATE (:Movie {title: 'Titanic', release_year: 1997});
CREATE (:Movie {title: 'The Shawshank Redemption', release_year: 1994});
CREATE (:Movie {title: 'The Dark Knight', release_year: 2008});
CREATE (:Movie {title: 'Pulp Fiction', release_year: 1994});
CREATE (:Movie {title: 'Interstellar', release_year: 2014});

// 5. Create ACTED_IN Relationships
MATCH (a:Actor {name: 'Leonardo DiCaprio'}), (m:Movie {title: 'Inception'})
CREATE (a)-[:ACTED_IN {role: 'Cobb'}]->(m);

MATCH (a:Actor {name: 'Leonardo DiCaprio'}), (m:Movie {title: 'Titanic'})
CREATE (a)-[:ACTED_IN {role: 'Jack Dawson'}]->(m);

MATCH (a:Actor {name: 'Kate Winslet'}), (m:Movie {title: 'Titanic'})
CREATE (a)-[:ACTED_IN {role: 'Rose DeWitt Bukater'}]->(m);

MATCH (a:Actor {name: 'Tom Hanks'}), (m:Movie {title: 'The Shawshank Redemption'})
CREATE (a)-[:ACTED_IN {role: 'Andy Dufresne'}]->(m);

MATCH (a:Actor {name: 'Morgan Freeman'}), (m:Movie {title: 'The Shawshank Redemption'})
CREATE (a)-[:ACTED_IN {role: 'Ellis Boyd "Red" Redding'}]->(m);

MATCH (a:Actor {name: 'Scarlett Johansson'}), (m:Movie {title: 'The Dark Knight'})
CREATE (a)-[:ACTED_IN {role: 'Natasha Romanoff'}]->(m);

MATCH (a:Actor {name: 'Brad Pitt'}), (m:Movie {title: 'Pulp Fiction'})
CREATE (a)-[:ACTED_IN {role: 'Butch Coolidge'}]->(m);

MATCH (a:Actor {name: 'Leonardo DiCaprio'}), (m:Movie {title: 'Interstellar'})
CREATE (a)-[:ACTED_IN {role: 'Cooper'}]->(m);

// 6. Create DIRECTED Relationships
MATCH (d:Director {name: 'Christopher Nolan'}), (m:Movie {title: 'Inception'})
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name: 'Christopher Nolan'}), (m:Movie {title: 'The Dark Knight'})
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name: 'James Cameron'}), (m:Movie {title: 'Titanic'})
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name: 'Frank Darabont'}), (m:Movie {title: 'The Shawshank Redemption'})
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name: 'Quentin Tarantino'}), (m:Movie {title: 'Pulp Fiction'})
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name: 'Christopher Nolan'}), (m:Movie {title: 'Interstellar'})
CREATE (d)-[:DIRECTED]->(m);

// 7. Create BELONGS_TO Relationships
MATCH (m:Movie {title: 'Inception'}), (g:Genre {name: 'Sci-Fi'})
CREATE (m)-[:BELONGS_TO]->(g);

MATCH (m:Movie {title: 'Inception'}), (g:Genre {name: 'Action'})
CREATE (m)-[:BELONGS_TO]->(g);

MATCH (m:Movie {title: 'Titanic'}), (g:Genre {name: 'Drama'})
CREATE (m)-[:BELONGS_TO]->(g);

MATCH (m:Movie {title: 'Titanic'}), (g:Genre {name: 'Romance'})
CREATE (m)-[:BELONGS_TO]->(g);

MATCH (m:Movie {title: 'The Shawshank Redemption'}), (g:Genre {name: 'Drama'})
CREATE (m)-[:BELONGS_TO]->(g);

MATCH (m:Movie {title: 'The Dark Knight'}), (g:Genre {name: 'Action'})
CREATE (m)-[:BELONGS_TO]->(g);

MATCH (m:Movie {title: 'The Dark Knight'}), (g:Genre {name: 'Thriller'})
CREATE (m)-[:BELONGS_TO]->(g);

MATCH (m:Movie {title: 'Pulp Fiction'}), (g:Genre {name: 'Crime'})
CREATE (m)-[:BELONGS_TO]->(g);

MATCH (m:Movie {title: 'Interstellar'}), (g:Genre {name: 'Sci-Fi'})
CREATE (m)-[:BELONGS_TO]->(g);
