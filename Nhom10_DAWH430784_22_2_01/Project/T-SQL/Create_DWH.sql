create database video_game_DW1


CREATE TABLE DimRegion
(
	id int NOT NULL,
	region_name nvarchar(150) NOT NULL,
	CONSTRAINT PKDimRegion PRIMARY KEY (id)  
)


CREATE TABLE DimGenre
(
	id int NOT NULL,
	genre_name nvarchar(150) NOT NULL,
	CONSTRAINT PKDimGenre PRIMARY KEY (id)
)


CREATE TABLE DimPublisher
(
	id int NOT NULL,
	publisher_name nvarchar(150) NOT NULL,
	CONSTRAINT PKDimPublisher PRIMARY KEY (id)
)

CREATE TABLE DimPlatform
(
	id int NOT NULL,
	platform_name nvarchar(150) NOT NULL,
	CONSTRAINT PKDimPlatform PRIMARY KEY (id)
)


CREATE TABLE DimGame
(
	id int NOT NULL,
	genre_id int NOT NULL,
	game_name nvarchar(150) NOT NULL,
	CONSTRAINT PKDimGame PRIMARY KEY (id),
)

CREATE TABLE DimYear
(
	id int ,
	release_year int NOT NULL
	CONSTRAINT PKDimYear PRIMARY KEY (id)
)

CREATE TABLE FactGameSales
(
	game_id int NOT NULL,
	publisher_id int NOT NULL,
	platform_id int NOT NULL,
	genre_id int NOT NULL,
	region_id int NOT NULL,
	year_id int NOT NULL,
	sales float,

)


alter table FactGameSales ADD CONSTRAINT PKFactGameSales PRIMARY KEY (game_id,publisher_id,platform_id,genre_id,region_id,year_id)

--publisher_id,platform_id,genre_id,region_id,year_id
alter table FactGameSales ADD CONSTRAINT FKFactGameSales_game_id FOREIGN KEY (game_id) REFERENCES DimGame;
alter table FactGameSales ADD CONSTRAINT FKFactGameSales_publisher_id FOREIGN KEY (publisher_id) REFERENCES DimPublisher;
alter table FactGameSales ADD CONSTRAINT FKFactGameSales_platform_id FOREIGN KEY (platform_id) REFERENCES DimPlatform;
alter table FactGameSales ADD CONSTRAINT FKFactGameSales_genre_id FOREIGN KEY (genre_id) REFERENCES DimGenre;
alter table FactGameSales ADD CONSTRAINT FKFactGameSales_region_id FOREIGN KEY (region_id) REFERENCES DimRegion;
alter table FactGameSales ADD CONSTRAINT FKFactGameSales_year_id FOREIGN KEY (year_id) REFERENCES DimYear;




/*
SELECT DISTINCT 
                  video_games.game_publisher.game_id, video_games.game_publisher.publisher_id, video_games.game_platform.platform_id,video_games.game.genre_id, video_games.region_sales.region_id,video_games."year".id, sum(video_games.region_sales.num_sales) as num_sale
                  
FROM     video_games.game, video_games.game_publisher, video_games.game_platform, video_games."year", video_games.region_sales
WHERE  video_games.game.id = video_games.game_publisher.game_id AND video_games.game_publisher.id = video_games.game_platform.game_publisher_id AND 
                  video_games.game_platform.release_year = video_games."year".release_year AND video_games.game_platform.id = video_games.region_sales.game_platform_id
Group by video_games.game_publisher.game_id, video_games.game_publisher.publisher_id, video_games.game_platform.platform_id,video_games.game.genre_id, video_games.region_sales.region_id,video_games."year".id 
ORDER BY video_games.game_publisher.game_id
*/
