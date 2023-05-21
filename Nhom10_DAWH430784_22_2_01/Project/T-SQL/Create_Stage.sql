CREATE DATABASE videoG;

CREATE TABLE region
(
	id int IDENTITY(1,1),
	region_name nvarchar(150) NOT NULL,
	CONSTRAINT PKregion PRIMARY KEY (id)  
)

CREATE TABLE genre
(
	id int IDENTITY(1,1),
	genre_name varchar(150) NOT NULL,
	CONSTRAINT PKgenre PRIMARY KEY (id)
)

CREATE TABLE publisher
(
	id int IDENTITY(1,1),
	publisher_name varchar(150) NOT NULL,
	CONSTRAINT PKpublisher PRIMARY KEY (id)
)

CREATE TABLE platform
(
	id int IDENTITY(1,1),
	platform_name varchar(150) NOT NULL,
	CONSTRAINT PKplatform PRIMARY KEY (id)
)

CREATE TABLE game
(
	id int IDENTITY(1,1),
	genre_id int NOT NULL,
	game_name varchar(150) NOT NULL,
	CONSTRAINT PKgame PRIMARY KEY (id),
)

CREATE TABLE game_publisher
(
	id int IDENTITY(1,1),
	game_id int NOT NULL,
	publisher_id int NOT NULL,
	CONSTRAINT PKgame_publisher PRIMARY KEY (id),
)

CREATE TABLE game_platform
(
	id int IDENTITY(1,1),
	game_publisher_id int NOT NULL,
	platform_id int NOT NULL,
	release_year int NOT NULL,
	CONSTRAINT PKgame_platform PRIMARY KEY (id),
)

CREATE TABLE region_sale
(
	region_id int NOT NULL,
	game_platform_id int NOT NULL,
	num_sales Decimal(5,2) NOT NULL,
)

CREATE TABLE video_games.year
(
	id int IDENTITY(1,1),
	release_year int NOT NULL,
	CONSTRAINT PKyear PRIMARY KEY (id),
)


insert into video_games.year(release_year) 
select distinct release_year from video_games.game_platform order by release_year ASC;


insert into year(release_year)
select  year from vgsales_processed

select