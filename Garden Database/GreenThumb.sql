/*********************************************************************************
* Title: The Green Thumb                                                         *
*                                                                                *
* Creator: Ivana Louis                                                           *
*                                                                                *
* The Purpose of this project is to create a database that holds data pertaining *
* to gardening and different garden plants. To be more specific, this database   *
* will hold information based on vegetable gardening. This database will make it *
* easier for a gardener to start and continue caring for their home gardens.     *
* Gardeners ranging from beginning to advanced will be able to use this database *
* to help them plan and take care of their plants.                               *
*********************************************************************************/

-- Drop existing tables.  Executing with EXECUTE IMMEDIATE to suppress error 
-- messages if objects does not exist.
--BEGIN EXECUTE IMMEDIATE 'DROP TABLE GARDENUSER'; EXCEPTION WHEN OTHERS THEN NULL; END;
--BEGIN EXECUTE IMMEDIATE 'DROP TABLE GARDLOCATION'; EXCEPTION WHEN OTHERS THEN NULL; END;
--BEGIN EXECUTE IMMEDIATE 'DROP TABLE PLANTFAM'; EXCEPTION WHEN OTHERS THEN NULL; END;
--BEGIN EXECUTE IMMEDIATE 'DROP TABLE VEGETABLE'; EXCEPTION WHEN OTHERS THEN NULL; END;
--BEGIN EXECUTE IMMEDIATE 'DROP TABLE CRITTERS'; EXCEPTION WHEN OTHERS THEN NULL; END;
--BEGIN EXECUTE IMMEDIATE 'DROP TABLE COMDISEASE'; EXCEPTION WHEN OTHERS THEN NULL; END;

DROP TABLE GARDENUSER;
DROP TABLE GARDLOCATION;
DROP TABLE VEGETABLE;
DROP TABLE CRITTERS;
DROP TABLE COMDISEASE;
DROP TABLE PLANTFAM;
-- Create GARDLOCATION table.
-- Stores info pertaining to that specific location. 
-- Plants grow differently based on locations.

CREATE TABLE GARDLOCATION (
CityID          Number PRIMARY KEY,
City            VARCHAR2(100),
LastFrost       DATE,
FirstFrost      DATE,
GrowingSeason   NUMBER
);

INSERT INTO GARDLOCATION VALUES (1, 'Alexandria', To_Date('APR-28', 'MON-DD'),To_Date('OCT-12', 'MON-DD'), 166);
INSERT INTO GARDLOCATION VALUES (2, 'Anderson', To_Date('APR-28', 'MON-DD'),To_Date('OCT-12', 'MON-DD'), 166);
INSERT INTO GARDLOCATION VALUES (3, 'Angola', To_Date('MAY-08', 'MON-DD'),To_Date('OCT-03', 'MON-DD'), 147);
INSERT INTO GARDLOCATION VALUES (4, 'Auburn', To_Date('MAY-04', 'MON-DD'),To_Date('OCT-06', 'MON-DD'), 154);
INSERT INTO GARDLOCATION VALUES (5, 'Avon', To_Date('APR-18', 'MON-DD'),To_Date('OCT-20', 'MON-DD'), 184);
INSERT INTO GARDLOCATION VALUES (6, 'Bedford', To_Date('APR-28', 'MON-DD'),To_Date('OCT-10', 'MON-DD'), 164);
INSERT INTO GARDLOCATION VALUES (7, 'Beech Grove', To_Date('APR-25', 'MON-DD'),To_Date('OCT-14', 'MON-DD'), 171);
INSERT INTO GARDLOCATION VALUES (8, 'Bloomington', To_Date('APR-23', 'MON-DD'),To_Date('OCT-17', 'MON-DD'), 176);
INSERT INTO GARDLOCATION VALUES (9, 'Bluffton', To_Date('APR-28', 'MON-DD'),To_Date('OCT-11', 'MON-DD'), 165);
INSERT INTO GARDLOCATION VALUES (10, 'Boonville', To_Date('APR-18', 'MON-DD'),To_Date('OCT-18', 'MON-DD'), 182);
INSERT INTO GARDLOCATION VALUES (11, 'Brazil', To_Date('APR-24', 'MON-DD'),To_Date('OCT-09', 'MON-DD'), 167);
INSERT INTO GARDLOCATION VALUES (12, 'Brownsburg', To_Date('APR-18', 'MON-DD'),To_Date('OCT-20', 'MON-DD'), 184);
INSERT INTO GARDLOCATION VALUES (13, 'Carmel', To_Date('APR-25', 'MON-DD'),To_Date('OCT-10', 'MON-DD'), 167);
INSERT INTO GARDLOCATION VALUES (14, 'Cedar Lake', To_Date('MAY-03', 'MON-DD'),To_Date('OCT-06', 'MON-DD'), 155);
INSERT INTO GARDLOCATION VALUES (15, 'Chesterton', To_Date('APR-28', 'MON-DD'),To_Date('OCT-19', 'MON-DD'), 173);
INSERT INTO GARDLOCATION VALUES (16, 'Clarksville', To_Date('APR-10', 'MON-DD'),To_Date('OCT-30', 'MON-DD'), 202);
INSERT INTO GARDLOCATION VALUES (17, 'Columbia City', To_Date('MAY-04', 'MON-DD'),To_Date('OCT-05', 'MON-DD'), 153);
INSERT INTO GARDLOCATION VALUES (18, 'Columbus', To_Date('APR-19', 'MON-DD'),To_Date('OCT-18', 'MON-DD'), 181);
INSERT INTO GARDLOCATION VALUES (19, 'Connersville', To_Date('MAY-03', 'MON-DD'),To_Date('OCT-03', 'MON-DD'), 152);
INSERT INTO GARDLOCATION VALUES (20, 'Crawfordsville', To_Date('MAY-02', 'MON-DD'),To_Date('OCT-03', 'MON-DD'), 153);
INSERT INTO GARDLOCATION VALUES (21, 'Crown Point', To_Date('MAY-05', 'MON-DD'),To_Date('OCT-11', 'MON-DD'), 158);
INSERT INTO GARDLOCATION VALUES (22, 'Danville', To_Date('APR-30', 'MON-DD'),To_Date('OCT-08', 'MON-DD'), 160);
INSERT INTO GARDLOCATION VALUES (23, 'Decatur', To_Date('APR-28', 'MON-DD'),To_Date('OCT-11', 'MON-DD'), 165);
INSERT INTO GARDLOCATION VALUES (24, 'Dyer', To_Date('APR-27', 'MON-DD'),To_Date('OCT-14', 'MON-DD'), 169);
INSERT INTO GARDLOCATION VALUES (25, 'East Chicago', To_Date('MAY-05', 'MON-DD'),To_Date('OCT-11', 'MON-DD'), 158);
INSERT INTO GARDLOCATION VALUES (26, 'Elkhart', To_Date('MAY-03', 'MON-DD'),To_Date('OCT-09', 'MON-DD'), 158);
INSERT INTO GARDLOCATION VALUES (27, 'Elwood', To_Date('APR-30', 'MON-DD'),To_Date('OCT-08', 'MON-DD'), 160);
INSERT INTO GARDLOCATION VALUES (28, 'Evansville', To_Date('APR-08', 'MON-DD'),To_Date('OCT-31', 'MON-DD'), 205);
INSERT INTO GARDLOCATION VALUES (29, 'Fishers', To_Date('APR-25', 'MON-DD'),To_Date('OCT-10', 'MON-DD'), 167);
INSERT INTO GARDLOCATION VALUES (30, 'Fort Wayne', To_Date('MAY-01', 'MON-DD'),To_Date('OCT-09', 'MON-DD'), 160);
INSERT INTO GARDLOCATION VALUES (31, 'Frankfort', To_Date('APR-26', 'MON-DD'),To_Date('OCT-11', 'MON-DD'), 167);
INSERT INTO GARDLOCATION VALUES (32, 'Franklin', To_Date('APR-24', 'MON-DD'),To_Date('OCT-07', 'MON-DD'), 165);
INSERT INTO GARDLOCATION VALUES (33, 'Gary', To_Date('MAY-05', 'MON-DD'),To_Date('OCT-11', 'MON-DD'), 158);
INSERT INTO GARDLOCATION VALUES (34, 'Goshen', To_Date('MAY-03', 'MON-DD'),To_Date('OCT-09', 'MON-DD'), 158);
INSERT INTO GARDLOCATION VALUES (35, 'Granger', To_Date('MAY-03', 'MON-DD'),To_Date('OCT-03', 'MON-DD'), 162);
INSERT INTO GARDLOCATION VALUES (36, 'Greencastle', To_Date('MAY-03', 'MON-DD'),To_Date('OCT-07', 'MON-DD'), 156);
INSERT INTO GARDLOCATION VALUES (37, 'Greenfield', To_Date('APR-24', 'MON-DD'),To_Date('OCT-14', 'MON-DD'), 172);
INSERT INTO GARDLOCATION VALUES (38, 'Greensburg', To_Date('APR-23', 'MON-DD'),To_Date('OCT-14', 'MON-DD'), 173);
INSERT INTO GARDLOCATION VALUES (39, 'Greenwood', To_Date('APR-24', 'MON-DD'),To_Date('OCT-07', 'MON-DD'), 165);
INSERT INTO GARDLOCATION VALUES (40, 'Griffith', To_Date('MAY-05', 'MON-DD'),To_Date('OCT-11', 'MON-DD'), 158);
INSERT INTO GARDLOCATION VALUES (41, 'Hammond', To_Date('APR-27', 'MON-DD'),To_Date('OCT-14', 'MON-DD'), 169);
INSERT INTO GARDLOCATION VALUES (42, 'Hartford City', To_Date('APR-28', 'MON-DD'),To_Date('OCT-12', 'MON-DD'), 166);
INSERT INTO GARDLOCATION VALUES (43, 'Highland', To_Date('MAY-05', 'MON-DD'),To_Date('OCT-11', 'MON-DD'), 158);
INSERT INTO GARDLOCATION VALUES (44, 'Hobart', To_Date('MAY-05', 'MON-DD'),To_Date('OCT-11', 'MON-DD'), 158);
INSERT INTO GARDLOCATION VALUES (45, 'Huntington', To_Date('MAY-07', 'MON-DD'),To_Date('OCT-04', 'MON-DD'), 149);
INSERT INTO GARDLOCATION VALUES (46, 'Indianapolis', To_Date('MAY-01', 'MON-DD'),To_Date('OCT-08', 'MON-DD'), 159);
INSERT INTO GARDLOCATION VALUES (47, 'Jasper', To_Date('MAY-01', 'MON-DD'),To_Date('OCT-08', 'MON-DD'), 159);
INSERT INTO GARDLOCATION VALUES (48, 'Jeffersonville', To_Date('APR-10', 'MON-DD'),To_Date('OCT-25', 'MON-DD'), 197);
 
savepoint A; 
-- Create USER table.
-- Stores user info. Helpful to keep track of the users location. 
-- Garden advice is based on location.
CREATE TABLE GARDENUSER (
UserID          Number PRIMARY KEY,
UserName        VARCHAR2(100),
UserPassword    VARCHAR2(50),
UserCityID      Number,
UserCity        VARCHAR2(100),
CONSTRAINT UserCityFK FOREIGN KEY (UserCityID) REFERENCES GARDLOCATION(CityID),
--CONSTRAINT gardenuser_uq UNIQUE (UserName, UserPassword), 
CONSTRAINT gardenuser_uq CHECK (UserName is not NULL or UserPassword is not NULL)
);

INSERT INTO GARDENUSER VALUES (1, 'ilouis','greenthumb', 29 ,'Fishers');
INSERT INTO GARDENUSER VALUES (2, 'kakers','090516', 29, 'Fishers');
INSERT INTO GARDENUSER VALUES (3,'leila129','harryStyles', 46, 'Indianapolis');
INSERT INTO GARDENUSER VALUES (4,'mixia98','uf2022', 13, 'Carmel');
INSERT INTO GARDENUSER VALUES (5,'migardener','iamnumberone', 13, 'Carmel');
INSERT INTO GARDENUSER VALUES (6,'anick1122','anick1122', 13, 'Carmel');
INSERT INTO GARDENUSER VALUES (7,'ivanabananas','nana1995', 46, 'Indianapolis');
INSERT INTO GARDENUSER VALUES (8,'voldemort','1234', 46, 'Indianapolis');
INSERT INTO GARDENUSER VALUES (9,'hermione01','password', 18, 'Columbus');
INSERT INTO GARDENUSER VALUES (10,'grandma16','pw5643', 8, 'Bloomington');
INSERT INTO GARDENUSER VALUES (11,'Flowergirl27','planter5', 2, 'Anderson');
INSERT INTO GARDENUSER VALUES (12,'harryPotterLover','flower32', 29, 'Fishers');
INSERT INTO GARDENUSER VALUES (13,'greenthumb','7463528', 2, 'Anderson');
INSERT INTO GARDENUSER VALUES (14,'spring56','pb7465893', 29, 'Fishers');
INSERT INTO GARDENUSER VALUES (15,'catlady54','password9876', 18,  'Columbus');
INSERT INTO GARDENUSER VALUES (16,'love2garden','19671995', 8, 'Bloomington');
INSERT INTO GARDENUSER VALUES (17,'ivana8668','ted8182', 13, 'Carmel');
INSERT INTO GARDENUSER VALUES (18,'doglover2','Trina0905', 39, 'Greenwood');
INSERT INTO GARDENUSER VALUES (19,'mommyof3','password1234', 29, 'Fishers');
INSERT INTO GARDENUSER VALUES (20,'username','123456789', 5, 'Avon');

savepoint B; 

-- Create PLANTFAM table.
-- Stores use info of what vegetables are in a plant family. 
-- Plants tend to grow the same as plants in their family. 
CREATE TABLE PLANTFAM (
Plant               VARCHAR2(50) PRIMARY KEY,
Family              VARCHAR2(50)
);

INSERT INTO PLANTFAM VALUES ('Tomato', 'Solanaceae - Nightshades');
INSERT INTO PLANTFAM VALUES ('Peppers', 'Solanaceae - Nightshades');
INSERT INTO PLANTFAM VALUES ('Eggplant', 'Solanaceae - Nightshades');
INSERT INTO PLANTFAM VALUES ('Potatoes', 'Solanaceae - Nightshades');
INSERT INTO PLANTFAM VALUES ('Tomatillos', 'Solanaceae - Nightshades');
INSERT INTO PLANTFAM VALUES ('Ground Cherries', 'Solanaceae - Nightshades');
INSERT INTO PLANTFAM VALUES ('Beans', 'Fabaceae - Legumes');
INSERT INTO PLANTFAM VALUES ('Pumpkins', 'Cucurbitaceae - Cucurbits');
INSERT INTO PLANTFAM VALUES ('Zucchini', 'Cucurbitaceae - Cucurbits');
INSERT INTO PLANTFAM VALUES ('Melons', 'Cucurbitaceae - Cucurbits');
INSERT INTO PLANTFAM VALUES ('Cucumbers', 'Cucurbitaceae - Cucurbits');
INSERT INTO PLANTFAM VALUES ('Cabbage', 'Brassicaceae - Brassicas');
INSERT INTO PLANTFAM VALUES ('Broccoli', 'Brassicaceae - Brassicas');
INSERT INTO PLANTFAM VALUES ('Cauliflower', 'Brassicaceae - Brassicas');


savepoint C; 


-- Create VEGETABLE table.
-- Stores info based on plant and variety. 
-- Heart of the database, what the user actually wants to know.
CREATE TABLE VEGETABLE (
Veg_ID            Number PRIMARY KEY,
Variety           VARCHAR2(150),
Plant             VARCHAR2(50),
START_In_Out      VARCHAR2(15),
StartTime         VARCHAR2(50),
Sun               VARCHAR2(25),
MinHarvest        NUMBER,
MaxHarvest        NUMBER
);

INSERT INTO VEGETABLE VALUES (1, 'Better Boy', 'Tomato', 'Indoor', '6 Weeks Before Last Frost', 'Full Sun', 70, 75);
INSERT INTO VEGETABLE VALUES (2, 'Cherokee Purple', 'Tomato', 'Indoor', '6 Weeks Before Last Frost', 'Full Sun', 80, 90);
INSERT INTO VEGETABLE VALUES (3,'Early Girl', 'Tomato', 'Indoor', '6 Weeks Before Last Frost', 'Full Sun', 50, 50);
INSERT INTO VEGETABLE VALUES (4,'Mr. Stripey', 'Tomato', 'Indoor', '6 Weeks Before Last Frost', 'Full Sun', 80, 80);
INSERT INTO VEGETABLE VALUES (5,'Sweet Million', 'Tomato', 'Indoor', '6 Weeks Before Last Frost', 'Full Sun', 60, 62);
INSERT INTO VEGETABLE VALUES (6,'Banana Hot', 'Peppers', 'Indoor','8 to 10 Weeks Before Last Frost', 'Full Sun', 75, 75);
INSERT INTO VEGETABLE VALUES (7,'Banana Sweet', 'Peppers', 'Indoor','8 to 10 Weeks Before Last Frost', 'Full Sun', 75, 75);
INSERT INTO VEGETABLE VALUES (8,'Habanero', 'Peppers', 'Indoor','8 to 10 Weeks Before Last Frost', 'Full Sun', 95, 95);
INSERT INTO VEGETABLE VALUES (9,'Jalapeno Hot', 'Peppers', 'Indoor','8 to 10 Weeks Before Last Frost', 'Full Sun', 72, 72);
INSERT INTO VEGETABLE VALUES (10,'Bell Pepper', 'Peppers', 'Indoor','8 to 10 Weeks Before Last Frost', 'Full Sun', 70, 80);
INSERT INTO VEGETABLE VALUES (11,'Black Beauty', 'EggPlant', 'Indoor', '6 to 8 Weeks Before Last Frost', 'Full Sun',80, 80);
INSERT INTO VEGETABLE VALUES (12, 'Ichiban', 'Eggplant', 'Indoor', '6 to 8 Weeks Before Last Frost', 'Full Sun', 50, 60);
INSERT INTO VEGETABLE VALUES (13,'White Eggplant', 'Eggplant', 'Indoor', '6 to 8 Weeks Before Last Frost','Full Sun', 75, 75);
INSERT INTO VEGETABLE VALUES (14,'Kennebec White', 'Potatoes', 'Outdoor', 'After Soil Has Warmed to 45 Degrees', 'Full Sun', 60, 70);
INSERT INTO VEGETABLE VALUES (15,'Yukon Gold', 'Potatoes', 'Outdoor', 'After Soil Has Warmed to 45 Degrees', 'Full Sun', 70, 90);
INSERT INTO VEGETABLE VALUES (16,'Red Norland', 'Potatoes', 'Outdoor', 'After Soil Has Warmed to 45 Degrees', 'Full Sun', 90, 100);
INSERT INTO VEGETABLE VALUES (17,'Tomatillo', 'Tomatillos', 'Indoor', '6 to 8 Weeks Before Last Frost', 'Full Sun', 60, 75);
INSERT INTO VEGETABLE VALUES (18,'Blue Lake Bush', 'Beans', 'Outdoor', 'After Last Frost Date', 'Full Sun', 48,48);
INSERT INTO VEGETABLE VALUES (19,'Edamame', 'Beans', 'Outdoor', 'After Last Frost Date', 'Full Sun', 75, 85);
INSERT INTO VEGETABLE VALUES (20,'Black Beauty', 'Zucchini', 'Indoor', '4 to 6 Weeks Before Last Frost', 'Full Sun', 48, 48);
INSERT INTO VEGETABLE VALUES (21,'Honeydew', 'Melons', 'Indoor', '2 to 4 Weeks Before Last Frost', 'Full Sun', 90, 115);
INSERT INTO VEGETABLE VALUES (22,'Super 45 Cantaloupe', 'Melons', 'Indoor', '2 to 4 Weeks Before Last Frost', 'Full Sun', 80, 88);
INSERT INTO VEGETABLE VALUES (23,'Crimson Sweet Watermelon', 'Melons', 'Indoor', '2 to 4 Weeks Before Last Frost', 'Full Sun', 80, 80);
INSERT INTO VEGETABLE VALUES (24,'Sugar Baby Watermelon', 'Melons', 'Indoor', '2 to 4 Weeks Before Last Frost', 'Full Sun', 78, 78);
INSERT INTO VEGETABLE VALUES (25,'Ice Box Watermelon', 'Melons', 'Indoor', '2 to 4 Weeks Before Last Frost', 'Full Sun', 78, 78);
INSERT INTO VEGETABLE VALUES (26,'Boston Pickling', 'Cucumbers', 'Indoor', '4 to 6 Weeks Before Last Frost', 'Full Sun', 55, 55);
INSERT INTO VEGETABLE VALUES (27,'Burpless Beauty Bush Hybrid', 'Cucumbers', 'Indoor', '4 to 6 Weeks Before Last Frost', 'Full Sun', 50, 60);
INSERT INTO VEGETABLE VALUES (28,'Burpless Hybrid', 'Cucumbers', 'Indoor', '4 to 6 Weeks Before Last Frost', 'Full Sun', 50, 50);
INSERT INTO VEGETABLE VALUES (29, 'Flat Dutch', 'Cabbage', 'Outdoor', 'After Last Frost Date', 'Full Sun', 80, 80);
INSERT INTO VEGETABLE VALUES (30,'Lieutenant', 'Broccoli', 'Indoor', '6 to 8 Weeks Before Last Frost', 'Full Sun', 55, 65);
INSERT INTO VEGETABLE VALUES (31,'White Hybrid', 'Cauliflower', 'Indoor', '6 to 8 Weeks Before Last Frost', 'Full Sun', 75, 75);


-- Create CRITTERS table.
-- Stores info based on the critters that can affect these plants. 
-- Gives organic and non-organic treatment options
CREATE TABLE CRITTERS (
Critter_ID        Number PRIMARY KEY,
Critter           VARCHAR2(100),
Plant             VARCHAR2(50),
OrganicTreat      VARCHAR2(200),
CONSTRAINT CPlantFK FOREIGN KEY (Plant) REFERENCES PLANTFAM(Plant)
);

INSERT INTO CRITTERS VALUES (1, 'Tomato Hornworm','Tomato', 'Bacillus thuringiensis based organic insecticide');
INSERT INTO CRITTERS VALUES (2, 'Aphids', 'Peppers', 'Spray off with water and insecticidal soap solution');
INSERT INTO CRITTERS VALUES (3, 'Flea Beetles','Eggplant','Neem Oil, Cornstarch');
INSERT INTO CRITTERS VALUES (4, 'Wireworm','Potatoes', 'Entomopathogenic Nematodes');
INSERT INTO CRITTERS VALUES (5, 'Rabbits', 'Beans', 'Red Pepper Flakes');
INSERT INTO CRITTERS VALUES (6, 'Japanese Beetles', 'Zucchini', 'Insecticidal Soap Solution, Cornstartch, Neem Oil');
INSERT INTO CRITTERS VALUES (7, 'Greenhouse Whitefly','Melons', 'Spray of with water, Insecticidal Soap Solution');
INSERT INTO CRITTERS VALUES (8, 'Cucumber Beetles', 'Cucumbers', 'Insecticidal Soap Solution, Cornstartch, Neem Oil');
INSERT INTO CRITTERS VALUES (9, 'Cabbage Loopers', 'Cabbage', 'Bacillus thuringiensis based organic insecticide');
INSERT INTO CRITTERS VALUES (10,'Cabbage Worms','Broccoli','Bacillus thuringiensis based organic insecticide' );
INSERT INTO CRITTERS VALUES (11,'Cabbage Root Maggots','Cauliflower', 'Bacillus thuringiensis based organic insecticide');

savepoint D; 

-- Create COMDISEASE table.
-- Stores info based on the common diseases that can affect these plants. 
-- Gives treatment options
CREATE TABLE COMDISEASE (
disease_ID       Number,
Disease          VARCHAR2(100),
Plant            VARCHAR2(50),
Treatment        VARCHAR2(200),
CONSTRAINT CDPlantFK FOREIGN KEY (Plant) REFERENCES PLANTFAM(Plant)
);

INSERT INTO COMDISEASE VALUES (1, 'Verticillium Wilt', 'Tomato', 'Plant cannot be saved - focus on clearing soil for next year');
INSERT INTO COMDISEASE VALUES (2, 'Leaf Spot', 'Peppers', 'Baking Soda, Dish soap, Water solution');
INSERT INTO COMDISEASE VALUES (3, 'Alternaria Rot', 'Eggplant', 'Fungacides including captan or copper');
INSERT INTO COMDISEASE VALUES (4, 'Blight', 'Potatoes', 'Remove all affected leaves and burn them or place them in the garbage before it spreads');
INSERT INTO COMDISEASE VALUES (6, 'Fungus on Foliage', 'Beans', 'Fungicides');
INSERT INTO COMDISEASE VALUES (7, 'Bacterial Wilt','Zucchini',  'Plant cannot be saved - focus on clearing diseased pant before disease spreds to others');
INSERT INTO COMDISEASE VALUES (8, 'Powdery Mildew', 'Melons', 'Fungicides including sulfur, lime-sulfur, neem oil, potassium bicarbonate');
INSERT INTO COMDISEASE VALUES (9, 'Cucumber Mosaic','Cucumbers', NULL);
INSERT INTO COMDISEASE VALUES (10, 'Club Root','Cabbage', 'Remove plants and raise soil pH to 7.2');
INSERT INTO COMDISEASE VALUES (11, 'Sclerotinia Stem Rot', 'Broccoli', 'Plant cannot be saved - focus on clearing soil and rotate crops for next year');
INSERT INTO COMDISEASE VALUES (12,'Alterbaria leaf spot', 'Cauliflower', 'Fungicides');

savepoint E; 

Commit;

/***************************
* 4. HAVE AT LEAST 5 VIEWS *
****************************/
/******************************
* 11. USE JOIN AND OUTER JOIN *
*******************************/
-- View One
-- This view can show just the diseases that can be associated with any plants.
create or replace view DISEASES as
select DISEASE, TREATMENT
from COMDISEASE
Where DISEASE not like '%,%'
group by DISEASE, TREATMENT
;

-- View Two
-- This view shows the the pests and animals that can destroy any plants.
create or replace view PESTS as
select CRITTER, ORGANICTREAT as Treatment
from CRITTERS
Where CRITTER is not NULL and CRITTER not like '%Beetle'
group by CRITTER, ORGANICTREAT
;

-- View Three
-- This View shows vegetable varieties based on grow time.
create or replace view PLANT_GROWTH as
select VARIETY, PLANT, MINHARVEST, MAXHARVEST
from VEGETABLE
;

Select * from Plant_Growth;

-- View Four
-- This view can show both diseases and pests/animals that destroy plants
-- usuall pests and diseases go hand in hand so its nice to have them together.
-- THE JOIN REQUIREMENT WAS USED HERE
create or replace view PLANT_CONTROL as
select CRITTERS.PLANT, CRITTERS.CRITTER, CRITTERS.ORGANICTREAT as CRITTER_TREATMENT, 
        COMDISEASE.DISEASE, COMDISEASE.TREATMENT as PLANT_TREATMENT
from CRITTERS
join COMDISEASE on CRITTERS.PLANT = COMDISEASE.PLANT
where CRITTERS.PLANT = COMDISEASE.PLANT
order by CRITTERS.PLANT
;


select * from plant_control;

-- View Five
-- This view shows the user the city they live in as well as their first frost date,
-- last frost date and their growing season. 
-- A FULL OUTER JOIN WAS USED HERE.
create or replace view USER_INFO as
select GARDENUSER.USERNAME, GARDENUSER.USERCITY, GARDLOCATION.FIRSTFROST, 
        GARDLOCATION.LASTFROST, GARDLOCATION.GROWINGSEASON 
from GARDENUSER
full outer join GARDLOCATION on GARDENUSER.USERCITY = GARDLOCATION.CITY
where GARDENUSER.USERCITY = GARDLOCATION.CITY
order by GARDENUSER.USERCITY
;

savepoint F; 

select * from USER_INFO;

/***************************************
* 5. USE AT LEAST TWO STRING FUNCTIONS *
****************************************/
-- Make sure cities are started with an uppercase letter
select initcap(city), FIRSTFROST, LASTFROST, GROWINGSEASON 
from GARDLOCATION;

-- Order by the length of the city
select initcap(city), FIRSTFROST, LASTFROST, GROWINGSEASON 
from GARDLOCATION 
order by length(city);

/***************************************
* 6. USE AT LEAST TWO NUMBER FUNCTIONS *
****************************************/
-- Finds the average harvest date
create or replace view PLANT_GROWTH as
select VARIETY, PLANT, MINHARVEST, MAXHARVEST, (MINHARVEST + MAXHARVEST)/ 2 as AVERAGE_HARVEST
from VEGETABLE;

--Finds and Rounds the average harvest date to a whole number 
create or replace view PLANT_GROWTH as
select VARIETY, PLANT, MINHARVEST, MAXHARVEST, round((MINHARVEST + MAXHARVEST)/ 2) as AVERAGE_HARVEST
from VEGETABLE; 
 
select *
from PLANT_GROWTH;

/*************************************
* 7. USE AT LEAST TWO DATE FUNCTIONS *
**************************************/
-- Show number of months in the growing season.
select CITY, round(months_between(FIRSTFROST, LASTFROST), 1) as GROWING_MONTHS
from GARDLOCATION;

-- Change the date format, frost dates tend to stay the same from year to year.
create or replace view FROST_DATES as
select CITY, To_CHAR(LASTFROST, 'MON-DD') as LASTFROST, To_CHAR(FIRSTFROST, 'MON-DD') as FIRSTFROST, GROWINGSEASON
from GARDLOCATION;

/**************************
* 8. USE DECODE FUNCTION  *
***************************/
-- Changes the science name to the more common english term for users.
create or replace view PLANTFAM_ENG as
select PLANT, DECODE(FAMILY, 'Solanaceae - Nightshades', 'Nightshades', 'Fabaceae - Legumes', 'Legumes', 'Cucurbitaceae - Cucurbits', 'Cucurbits', 
                        'Brassiaceae - Brassicas', 'Brassicas',  FAMILY) FAMILY
from PLANTFAM
order by FAMILY;

Select * from plantfam_eng;

savepoint G;

/*****************************
* 9. USE GROUP BY AND HAVING *
******************************/

-- Shows the plants that are started indoor and have more than one variety.
select Plant, count(*) as Number_Of_Varieties
from VEGETABLE
where START_IN_OUT = 'Indoor'
group by plant
Having count(*) > 1
;

/*********************
* 10. USE SUBQUERIES *
**********************/
-- Shows plants that are planted at least 6 weeks before frost date.
select Plant, variety 
from VEGETABLE
where PLANT in (select PLANT from VEGETABLE where STARTTIME like '6%');

/*****************************************************************************
* 12. DEMONSTRATE SAVE POINTS                                                *
*                                                                            *
* Save points have been used when creating the tables each table has a save  *
* point. Once all the tables are complete there is a commit.                 *
*                                                                            *
******************************************************************************/

/****************************************
* 13. USE INSERT OR DELETE THROUGH VIEW *
*****************************************/
-- Delete a plant family 

delete from PLANT_GROWTH where Plant = 'Tomatillos';

/**********************************
* 14. UPDATE WITH EMBEDDED SELECT *
***********************************/
-- A user has been looking up information for a different location with the longest growing
-- season more than 10 times. Update their location based on the new location they are researching.
update GARDENUSER set UserCity = (select City from GARDLOCATION where GrowingSeason = 205)
where UserName = 'love2garden';

select * from GardenUser;

savepoint H;

/***********************************************
* 15. DELETE ROWS WITH MORE THAN ONE CONDITION *
************************************************/
-- Too many johnDeers delete the duplicates
delete from GARDENUSER
where USERPASSWORD = '700' or USERPASSWORD = '837' or USERPASSWORD = '1000' and USERNAME = 'johnDeer';

/****************************************
* 16. CREATE A TABLE FROM ANOTHER TABLE *
*****************************************/
-- This creates a table based on who lives in what city. There can be a table for
-- every city if you wanted.

drop table FISHERS;
CREATE TABLE FISHERS(
USERNAME VARCHAR2(100)
);

insert into FISHERS 
select UserName 
from GARDENUSER
where USERCITY = 'Fishers';

savepoint I;
rollback to savepoint H;

/********************************************************************
* 17. HAVE UNIQUE CONSTRAINT AND CHECK CONSTRAINT WHEREVER POSSIBLE *
*                                                                   *
* The Unique constraint was created in the above table GARDENUSER   *
* each user should have unique username's and passwords             *
*********************************************************************/

/************************************
* 18. USE INDEX WHEREVER APPROPRIATE*
*************************************/
-- Indexes were created with keys in the table. There is 
-- no other need for indexing in this database. 

select * from all_indexes where owner = 'ILOUIS';

/**************************************************
* 19. HAVE AT LEAST ONE SEQUENCE USED EFFECTIVELY *
***************************************************/
-- Create a one use password for a user who creates an account
drop sequence passwordID;
create sequence passwordID increment by 137 start with 1000;

insert into GARDENUSER values(3, 'johnDeer', passwordID.NextVal, NULL, NULL);
select * from Gardenuser;

commit;

/*********************************************************************************
* Title: The Green Thumb (Final Presentation)                                    *
*                                                                                *
* Creator: Ivana Louis                                                           *
*                                                                                *
* The Purpose of this project is to create a database that holds data pertaining *
* to gardening and different garden plants. To be more specific, this database   *
* will hold information based on vegetable gardening. This database will make it *
* easier for a gardener to start and continue caring for their home gardens.     *
* Gardeners ranging from beginning to advanced will be able to use this database *
* to help them plan and take care of their plants.                               *
*********************************************************************************/

/*******************************************************************
* 1. Code Blocks to process data, Variables and loops must be used *
* 2. Code Blocks to Retrieve Records, Cursors must be used         *
* 3. Have Exception Handling 
* 4. 1/2 procedures
*******************************************************************/
-- This sequence is used in the code block to create an incrementing userID.
drop sequence createID;
create sequence createID increment by 1 start with 21;

-- Purpose: the purpose of this code block is to generate users so that the 
-- database as a whole can work. Without users there's no reason for the database
-- to exist. The cursor retieves data from the location table and pops it into 
-- the user table. Then the code block is used to process data and give values
-- to the created variables. It uses exception handling to ensure the proper use
-- of the cursor involved in this code block. This all is done in a procedure, 
-- the procedure is called and the number of users you want to add is inserted
-- into the garden users table.
CREATE or REPLACE 
Procedure addUsers(n IN number)
as
UserID          Number;
UserName        VARCHAR(100);
UserPassword    VARCHAR(50);

        	cursor Location_cursor is
                select CityID, City from GARDLOCATION;
            Location_val Location_cursor%ROWTYPE;

BEGIN
    open Location_cursor;
    dbms_random.seed (val => 0);
    FOR i IN 1..n LOOP
        --open Location_cursor;
        fetch Location_cursor into Location_val;
        UserID := createID.NextVal;
        UserName := 'GreenThumb' || UserID;
        UserPassword := dbms_random.string('x',TRUNC(dbms_random.value(6,12)));
        INSERT INTO GARDENUSER VALUES(UserID ,UserName, UserPassword, Location_val.CityID, Location_val.City);
    END LOOP;
    close Location_cursor;
EXCEPTION
    WHEN INVALID_CURSOR THEN
        DBMS_OUTPUT.PUT_LINE('Cannot close an unopened cursor');
    WHEN CURSOR_ALREADY_OPEN THEN
        DBMS_OUTPUT.PUT_LINE('Must close cursor before reopening.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Non-Cursor related Error');
END;
/

execute addUsers(5);
select * from GARDENUSER;

/*******************************************************
* 4. Two Triggers: Insertion Trigger, Deletion Trigger *
********************************************************/
-- Purpose: The purpose of these triggers are to keep track of any insertions 
-- or deletions in the vegetable table, and any deletions in the user table. 
-- the trigger puts the information into the appropriate table that was created.
-- Keeping track of these edits can prove to be useful for the database 
-- for example when reinstating deleted accounts.
drop table VEGETABLE_LOG; 
create table VEGETABLE_LOG as select VEG_ID, VARIETY, PLANT from VEGETABLE;
alter table VEGETABLE_LOG add Edit varchar2(15);
alter table VEGETABLE_LOG add MOD_USER varchar2(15);
alter table VEGETABLE_LOG add MOD_TIMESTAMP Date;
select * from VEGETABLE_LOG;
delete from VEGETABLE_LOG;

drop table USER_LOG; 
create table USER_LOG as select * from GARDENUSER;
alter table USER_LOG add Edit varchar2(15);
alter table USER_LOG add MOD_USER varchar2(15);
alter table USER_LOG add MOD_TIMESTAMP Date;
select * from USER_LOG;
delete from USER_LOG;

Create or replace trigger VEG_INS_ROW
after insert on VEGETABLE
for each row
begin
Insert into VEGETABLE_LOG(VEG_ID, VARIETY, PLANT, EDIT, MOD_USER, MOD_TIMESTAMP) 
values (:new.VEG_ID, :new.VARIETY, :new.PLANT,'Insert' ,user ,Sysdate);
end; -- Note: When the new and old are referenced inside the begin/end block, must use colons (:)
/

Create or replace trigger VEG_DEL_ROW
after delete on VEGETABLE
for each row
begin
Insert into VEGETABLE_LOG(VEG_ID, VARIETY, PLANT, EDIT ,MOD_USER, MOD_TIMESTAMP) 
values (:OLD.VEG_ID, :OLD.VARIETY, :OLD.PLANT,'Delete', user ,Sysdate);
end; -- Note: When the new and old are referenced inside the begin/end block, must use colons (:)
/

Create or replace trigger USER_DEL_ROW
after delete on GARDENUSER
for each row
begin
Insert into USER_LOG(UserID, UserName, UserPassword, UserCityID, UserCity, EDIT , MOD_USER, MOD_TIMESTAMP) 
values (:old.UserID, :old.UserName, :old.UserPassword, :old.UserCityID, :old.UserCity, 'Delete',user ,Sysdate);
end; -- Note: When the new and old are referenced inside the begin/end block, must use colons (:)
/

-- EXAMPLE
SELECT * FROM VEGETABLE;
INSERT INTO VEGETABLE VALUES(100, 'Patio Star', 'Zucchini', 'Indoor', '4 to 6 Weeks Before Last Frost Date', 'Full Sun', 50, 50);
DELETE FROM VEGETABLE WHERE VEG_ID = 25;
INSERT INTO VEGETABLE VALUES(101, 'Caserta', 'Zucchini', 'Indoor', '4 to 6 Weeks Before Last Frost Date', 'Full Sun', 55, 55);

-- EXAMPLE
DELETE FROM GARDENUSER WHERE UserCityID = 35;
DELETE FROM GARDENUSER WHERE UserCityID = 36;
DELETE FROM GARDENUSER WHERE UserCityID = 37;

select * from VEGETABLE_LOG;
select * from USER_LOG;

/*******************
* 5. Two Functions *
********************/
-- Purpose: the purpose of this function is to calculate the number of days left to harvest
-- based on your planting days. Insert the number of days that have gone by
-- and the function will do the rest.
drop function fn_days_to_harvest;
create or replace function fn_days_to_harvest(aHarvest IN NUMBER, aNum IN Number)
return NUMBER -- must declare a return type
is
daysPast NUMBER; -- the variables to be declared
daysLeft Number;
begin
    daysPast := aNUM;
    daysLeft := aHarvest - daysPast;  
return (daysLeft);
end;
/

select * from plant_growth;
select VARIETY, PLANT, MINHARVEST, MAXHARVEST, fn_days_to_harvest(AVERAGE_HARVEST, 49) as Harvest  FROM Plant_growth;

-- Purpose: The purpose of this function is to plan what day the plant will be 
-- ready to harvest. You can use that date to figure out if it is even possible 
-- to grow that plant at this time.
drop function fn_veg_date;
create or replace function fn_veg_date(aDate IN DATE, aNum IN NUMBER)
return VARCHAR2 -- must declare a return type
is
GrowSeason DATE;
Growth NUMBER;
-- the variables to be declared
begin
    Growth := aNum;
    GrowSeason := aDate + aNum;
return (GrowSeason);
end;
/

select * from plant_growth;
select VARIETY, PLANT, MINHARVEST, MAXHARVEST, fn_veg_date(sysdate, AVERAGE_HARVEST) as HarvestDate  FROM Plant_growth;

/********************
* 6. 2/2 Procedures *
*********************/
-- Purpose: the purpose of this procedure is to add only the main elements into 
-- the database system for the moment. 
create or replace
procedure sp_insert_new_veg(aID IN NUMBER, aVariety IN VARCHAR2, aPlant IN VARCHAR2, aMin IN NUMBER, aMax IN NUMBER)
as
begin
	insert into VEGETABLE values (aID, aVariety, aPlant, null, null, null, aMin, aMax);
end;
/

execute sp_insert_new_veg(45, 'Caserta', 'Zucchini', 55, 55);
select * from vegetable;

/*****************
* 7. One Package *
******************/
-- The purpose of this package is to combine new vegetables and the process of
-- finding out whether or not these vegetables can be done before the last frost
-- date. This can be used by users to figure out if its too late to grow a 
-- certain plant.

-- create a package header first
drop package plant_management;
create or replace package PLANT_MANAGEMENT
as
	function fn_veg_date(aDate IN DATE, aNum IN NUMBER) return VARCHAR2;
	procedure sp_insert_new_veg(aID IN NUMBER, aVariety IN VARCHAR2, aPlant IN VARCHAR2, aMin IN NUMBER, aMax IN NUMBER);
end PLANT_MANAGEMENT;
/

-- Create the package body to define the function and the procedure
-- Only functions/procedures specified in the header are public, otherwise they are availabe within the package

create or replace package body PLANT_MANAGEMENT
as
-- local variables accessable inside the pacakge
user_name VARCHAR2(30);
entry_Date DATE;

function fn_veg_date(aDate IN DATE, aNum IN NUMBER)
return VARCHAR2 -- must declare a return type
is
GrowSeason DATE;
Growth NUMBER;
-- the variables to be declared
begin
    Growth := aNum;
    GrowSeason := aDate + aNum;
return (GrowSeason);
end fn_veg_date;


procedure sp_insert_new_veg(aID IN NUMBER, aVariety IN VARCHAR2, aPlant IN VARCHAR2, aMin IN NUMBER, aMax IN NUMBER)
as
begin
	insert into VEGETABLE values (aID, aVariety, aPlant, null, null, null, aMin, aMax);
end sp_insert_new_veg;

-- this "begin" block goes with the package body, is often used to do book keeping or variable initialization
begin
	user_name := SYS_CONTEXT('USERENV', 'SESSION_USER');
	entry_Date := sysdate;
    
    -- data can be inserted into an audit table instead of console output
	dbms_output.put_line('user ' || user_name || ' ' ||'invoked package on ' || entry_Date || '*****************');

end PLANT_MANAGEMENT;
/
/*****************
* 8. One Object  *
******************/
-- The purpose of this object can keep track of all problems involved with the 
-- database by problems I mean critters, pests, and diseases on plants.
drop type problem_TY;

create type problem_TY as object
(ID        Number,
problem           VARCHAR2(100),
Plant             VARCHAR2(50),
Treatment      VARCHAR2(200));
/

drop table PROBLEMS;
create table PROBLEMS
(ID NUMBER,
PROBLEM PROBLEM_TY);
/

insert into PROBLEMS values
(1, problem_TY(590, null, null, null));

select * from PROBLEMS;

-- Global
-- This could be done in a global environment, it can be used by anyone at anytime. However, it only gives information for indiana. 
