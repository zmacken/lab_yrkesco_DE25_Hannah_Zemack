# lab_yrkesco_DE25_Hannah_Zemack
# Databasmodellering och Implementation  
Av: Hannah Zemack, DE25

## Syfte
Detta projekt är en komplett databaslösning för yrkeshögskolan YrkesCo.  
Målet är att ersätta dagens fragmenterade Excel-miljö med en säker, skalbar och normaliserad databas.

## Installation och körning

### Använd commandon i ordningen nedan:
Navigera till mappen postgres och kör:

docker-compose up -d

Det startar en PostgreSQL-databas på port 5432.

docker exec -it postgres bash 

cd var/lib/postgres/18/docker

psql -U postgres -d myh_db

### För att kunna köra sql gör detta först:

(om kört koden förut och uppdaterat något) \i sql/clearall.sql

\i sql/create_tables.sql

\i sql/insert_data.sql

## Testdata

Fakedatan är genererad med chatGPT


