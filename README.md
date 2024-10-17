# Sample Neo4j Container

This is a sample Neo4j container that can be used to test the Neo4j database.

## Usage

To start the container, run the following command:

```bash
docker-compose up -d
```

To stop the container, run the following command:

```bash
docker-compose down
```

To access the Neo4j browser, open a web browser and navigate to `http://localhost:7474`.

The default username and password are `neo4j` and `test12345`, respectively.

## Cypher Shell

To install the Cypher shell on Mac OS, run the following command:

```bash
brew install cypher-shell
```

To access the Cypher shell, run the following command:

```bash
cypher-shell -u neo4j -p test12345
# or
source .env # holds the username and password
cypher-shell
```

## Loading Sample Data

To load sample data into the Neo4j database, run the following command:

```bash
cat cyphers/init.cql | cypher-shell
```

To query the sample data, run the following command:

```bash
cypher-shell "match(n) return n;"
```

## Sample Queries

```cypher
// Find all nodes
MATCH (n) RETURN n;
```

```cypher
// Find all nodes with a specific label
MATCH (n:Actor) RETURN n LIMIT 25;
```

```txt
+--------------------------------------------------------------+
| n                                                            |
+--------------------------------------------------------------+
| (:Actor {name: "Leonardo DiCaprio", birthdate: 1974-11-11})  |
| (:Actor {name: "Kate Winslet", birthdate: 1975-10-05})       |
| (:Actor {name: "Tom Hanks", birthdate: 1956-07-09})          |
| (:Actor {name: "Morgan Freeman", birthdate: 1937-06-01})     |
| (:Actor {name: "Scarlett Johansson", birthdate: 1984-11-22}) |
| (:Actor {name: "Brad Pitt", birthdate: 1963-12-18})          |
+--------------------------------------------------------------+

6 rows
```

```cypher
MATCH (n:Director) RETURN n LIMIT 25;
```

````txt
+----------------------------------------------------------------+
| n                                                              |
+----------------------------------------------------------------+
| (:Director {name: "Christopher Nolan", birthdate: 1970-07-30}) |
| (:Director {name: "Steven Spielberg", birthdate: 1946-12-18})  |
| (:Director {name: "James Cameron", birthdate: 1954-08-16})     |
| (:Director {name: "Quentin Tarantino", birthdate: 1963-03-27}) |
| (:Director {name: "Frank Darabont", birthdate: 1959-01-28})    |
+----------------------------------------------------------------+

5 rows
```cypher

```cypher
MATCH (n:Genre) RETURN n LIMIT 25;
````

```txt
+-----------------------------+
| n                           |
+-----------------------------+
| (:Genre {name: "Action"})   |
| (:Genre {name: "Comedy"})   |
| (:Genre {name: "Drama"})    |
| (:Genre {name: "Sci-Fi"})   |
| (:Genre {name: "Thriller"}) |
| (:Genre {name: "Romance"})  |
| (:Genre {name: "Crime"})    |
+-----------------------------+
```

```cypher
MATCH (n:Movie) RETURN n LIMIT 25;
```

```txt
+------------------------------------------------------------------+
| n                                                                |
+------------------------------------------------------------------+
| (:Movie {release_year: 2010, title: "Inception"})                |
| (:Movie {release_year: 1997, title: "Titanic"})                  |
| (:Movie {release_year: 1994, title: "The Shawshank Redemption"}) |
| (:Movie {release_year: 2008, title: "The Dark Knight"})          |
| (:Movie {release_year: 1994, title: "Pulp Fiction"})             |
| (:Movie {release_year: 2014, title: "Interstellar"})             |
+------------------------------------------------------------------+

6 rows
```

```cypher
// Find all relationships between nodes with a specific label
MATCH (n:Actor)-[:ACTED_IN]->(m:Movie) RETURN n, m LIMIT 25;
```

```txt
+---------------------------------------------------------------------------------------------------------------------------------+
| n                                                            | m                                                                |
+---------------------------------------------------------------------------------------------------------------------------------+
| (:Actor {name: "Leonardo DiCaprio", birthdate: 1974-11-11})  | (:Movie {release_year: 2014, title: "Interstellar"})             |
| (:Actor {name: "Leonardo DiCaprio", birthdate: 1974-11-11})  | (:Movie {release_year: 1997, title: "Titanic"})                  |
| (:Actor {name: "Leonardo DiCaprio", birthdate: 1974-11-11})  | (:Movie {release_year: 2010, title: "Inception"})                |
| (:Actor {name: "Kate Winslet", birthdate: 1975-10-05})       | (:Movie {release_year: 1997, title: "Titanic"})                  |
| (:Actor {name: "Tom Hanks", birthdate: 1956-07-09})          | (:Movie {release_year: 1994, title: "The Shawshank Redemption"}) |
| (:Actor {name: "Morgan Freeman", birthdate: 1937-06-01})     | (:Movie {release_year: 1994, title: "The Shawshank Redemption"}) |
| (:Actor {name: "Scarlett Johansson", birthdate: 1984-11-22}) | (:Movie {release_year: 2008, title: "The Dark Knight"})          |
| (:Actor {name: "Brad Pitt", birthdate: 1963-12-18})          | (:Movie {release_year: 1994, title: "Pulp Fiction"})             |
+---------------------------------------------------------------------------------------------------------------------------------+

8 rows
```

```cypher
MATCH (n:Director)-[:DIRECTED]->(m:Movie) RETURN n, m LIMIT 25;
```

```txt
+-----------------------------------------------------------------------------------------------------------------------------------+
| n                                                              | m                                                                |
+-----------------------------------------------------------------------------------------------------------------------------------+
| (:Director {name: "Christopher Nolan", birthdate: 1970-07-30}) | (:Movie {release_year: 2010, title: "Inception"})                |
| (:Director {name: "Christopher Nolan", birthdate: 1970-07-30}) | (:Movie {release_year: 2008, title: "The Dark Knight"})          |
| (:Director {name: "James Cameron", birthdate: 1954-08-16})     | (:Movie {release_year: 1997, title: "Titanic"})                  |
| (:Director {name: "Frank Darabont", birthdate: 1959-01-28})    | (:Movie {release_year: 1994, title: "The Shawshank Redemption"}) |
| (:Director {name: "Quentin Tarantino", birthdate: 1963-03-27}) | (:Movie {release_year: 1994, title: "Pulp Fiction"})             |
| (:Director {name: "Christopher Nolan", birthdate: 1970-07-30}) | (:Movie {release_year: 2014, title: "Interstellar"})             |
+-----------------------------------------------------------------------------------------------------------------------------------+

6 rows
```

```cypher
// Find all relationships between nodes with a specific label
MATCH p=()-[r:BELONGS_TO]->() RETURN p LIMIT 25;
```

```txt
+----------------------------------------------------------------------------------------------------------+
| p                                                                                                        |
+----------------------------------------------------------------------------------------------------------+
| (:Movie {release_year: 2010, title: "Inception"})-[:BELONGS_TO]->(:Genre {name: "Sci-Fi"})               |
| (:Movie {release_year: 2010, title: "Inception"})-[:BELONGS_TO]->(:Genre {name: "Action"})               |
| (:Movie {release_year: 1997, title: "Titanic"})-[:BELONGS_TO]->(:Genre {name: "Drama"})                  |
| (:Movie {release_year: 1997, title: "Titanic"})-[:BELONGS_TO]->(:Genre {name: "Romance"})                |
| (:Movie {release_year: 1994, title: "The Shawshank Redemption"})-[:BELONGS_TO]->(:Genre {name: "Drama"}) |
| (:Movie {release_year: 2008, title: "The Dark Knight"})-[:BELONGS_TO]->(:Genre {name: "Action"})         |
| (:Movie {release_year: 2008, title: "The Dark Knight"})-[:BELONGS_TO]->(:Genre {name: "Thriller"})       |
| (:Movie {release_year: 1994, title: "Pulp Fiction"})-[:BELONGS_TO]->(:Genre {name: "Crime"})             |
| (:Movie {release_year: 2014, title: "Interstellar"})-[:BELONGS_TO]->(:Genre {name: "Sci-Fi"})            |
+----------------------------------------------------------------------------------------------------------+

9 rows
```
