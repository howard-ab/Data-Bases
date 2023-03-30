-- Создать объекты в соответствии со скриптом:

DROP SCHEMA IF EXISTS topic_6 CASCADE;
CREATE SCHEMA topic_6;

DROP TABLE IF EXISTS topic_6.participant;
CREATE TABLE topic_6.participant
(
    participant_id         INT PRIMARY KEY,
    participant_nm         VARCHAR(200),
    participant_birth_dt   DATE,
    participant_country_nm VARCHAR(200)
);

DROP TABLE IF EXISTS topic_6.competition;
CREATE TABLE topic_6.competition
(
    competition_id           INT PRIMARY KEY,
    competition_nm           VARCHAR(200),
    held_dt                  DATE,
    competition_country_nm   VARCHAR(100),
    result_sorting_type_code VARCHAR(10) CHECK (result_sorting_type_code IN ('ASC', 'DESC'))
);

DROP TABLE IF EXISTS topic_6.competition_result;
CREATE TABLE topic_6.competition_result
(
    competition_id         INT REFERENCES topic_6.competition (competition_id),
    participant_id         INT REFERENCES topic_6.participant (participant_id),
    participant_result_amt NUMERIC(20, 2)
);


-- Осуществить вставку данных в таблицы по скрипту, полученному от семинариста. Поле result_sorting_type_code
-- определяет, сортировку какого типа необходимо использовать для ранжирования результатов участников в соревновании от
-- худшего к лучшему

insert into topic_6.competition_result values (1,180,1.00);
insert into topic_6.competition_result values (1,115,2.00);
insert into topic_6.competition_result values (1,278,3.00);
insert into topic_6.competition_result values (1,38,4.00);
insert into topic_6.competition_result values (1,142,5.00);
insert into topic_6.competition_result values (1,14,6.00);
insert into topic_6.competition_result values (1,99,7.00);
insert into topic_6.competition_result values (1,148,8.00);
insert into topic_6.competition_result values (1,218,9.00);
insert into topic_6.competition_result values (1,177,10.00);
insert into topic_6.competition_result values (1,271,11.00);
insert into topic_6.competition_result values (1,140,12.00);
insert into topic_6.competition_result values (1,79,13.00);
insert into topic_6.competition_result values (1,27,14.00);
insert into topic_6.competition_result values (1,265,15.00);
insert into topic_6.competition_result values (2,289,1.00);
insert into topic_6.competition_result values (2,115,2.00);
insert into topic_6.competition_result values (2,186,3.00);
insert into topic_6.competition_result values (2,156,4.00);
insert into topic_6.competition_result values (2,260,5.00);
insert into topic_6.competition_result values (2,108,6.00);
insert into topic_6.competition_result values (2,237,7.00);
insert into topic_6.competition_result values (2,24,8.00);
insert into topic_6.competition_result values (2,187,9.00);
insert into topic_6.competition_result values (2,171,10.00);
insert into topic_6.competition_result values (3,81,1.00);
insert into topic_6.competition_result values (3,105,2.00);
insert into topic_6.competition_result values (3,24,3.00);
insert into topic_6.competition_result values (3,269,4.00);
insert into topic_6.competition_result values (3,126,5.00);
insert into topic_6.competition_result values (3,167,6.00);
insert into topic_6.competition_result values (3,176,7.00);
insert into topic_6.competition_result values (3,205,8.00);
insert into topic_6.competition_result values (3,225,9.00);
insert into topic_6.competition_result values (3,148,10.00);
insert into topic_6.competition_result values (3,80,11.00);
insert into topic_6.competition_result values (3,218,12.00);
insert into topic_6.competition_result values (4,111,1.00);
insert into topic_6.competition_result values (4,71,2.00);
insert into topic_6.competition_result values (4,92,4.00);
insert into topic_6.competition_result values (4,205,5.00);
insert into topic_6.competition_result values (4,225,6.00);
insert into topic_6.competition_result values (4,173,7.00);
insert into topic_6.competition_result values (4,88,8.00);
insert into topic_6.competition_result values (4,156,9.00);
insert into topic_6.competition_result values (4,84,10.00);
insert into topic_6.competition_result values (4,300,3.00);
insert into topic_6.competition_result values (5,116,1.00);
insert into topic_6.competition_result values (5,227,2.00);
insert into topic_6.competition_result values (5,123,3.00);
insert into topic_6.competition_result values (5,96,4.00);
insert into topic_6.competition_result values (5,230,5.00);
insert into topic_6.competition_result values (5,275,6.00);
insert into topic_6.competition_result values (5,146,7.00);
insert into topic_6.competition_result values (5,190,8.00);
insert into topic_6.competition_result values (6,23,1.00);
insert into topic_6.competition_result values (6,273,2.00);
insert into topic_6.competition_result values (6,173,3.00);
insert into topic_6.competition_result values (6,89,4.00);
insert into topic_6.competition_result values (6,150,5.00);
insert into topic_6.competition_result values (6,246,6.00);
insert into topic_6.competition_result values (6,25,7.00);
insert into topic_6.competition_result values (6,247,8.00);
insert into topic_6.competition_result values (6,114,9.00);
insert into topic_6.competition_result values (6,163,10.00);
insert into topic_6.competition_result values (7,64,1.00);
insert into topic_6.competition_result values (7,15,2.00);
insert into topic_6.competition_result values (7,209,3.00);
insert into topic_6.competition_result values (7,293,4.00);
insert into topic_6.competition_result values (7,267,5.00);
insert into topic_6.competition_result values (7,289,6.00);
insert into topic_6.competition_result values (7,208,7.00);
insert into topic_6.competition_result values (7,235,8.00);
insert into topic_6.competition_result values (8,5,1.00);
insert into topic_6.competition_result values (8,82,2.00);
insert into topic_6.competition_result values (8,176,3.00);
insert into topic_6.competition_result values (8,269,4.00);
insert into topic_6.competition_result values (8,201,5.00);
insert into topic_6.competition_result values (9,87,1.00);
insert into topic_6.competition_result values (9,236,2.00);
insert into topic_6.competition_result values (9,259,3.00);
insert into topic_6.competition_result values (9,172,4.00);
insert into topic_6.competition_result values (9,229,5.00);
insert into topic_6.competition_result values (9,280,6.00);
insert into topic_6.competition_result values (9,298,7.00);
insert into topic_6.competition_result values (9,149,8.00);
insert into topic_6.competition_result values (9,257,9.00);
insert into topic_6.competition_result values (10,282,1.00);
insert into topic_6.competition_result values (10,106,2.00);
insert into topic_6.competition_result values (10,76,3.00);
insert into topic_6.competition_result values (10,264,4.00);
insert into topic_6.competition_result values (10,116,5.00);
insert into topic_6.competition_result values (10,286,6.00);
insert into topic_6.competition_result values (10,254,7.00);
insert into topic_6.competition_result values (10,278,8.00);
insert into topic_6.competition_result values (10,146,9.00);
insert into topic_6.competition_result values (10,196,10.00);
insert into topic_6.competition_result values (10,289,11.00);
insert into topic_6.competition_result values (10,81,12.00);
insert into topic_6.competition_result values (10,188,13.00);
insert into topic_6.competition_result values (10,277,14.00);
insert into topic_6.competition_result values (11,213,1.00);
insert into topic_6.competition_result values (11,20,2.00);
insert into topic_6.competition_result values (11,34,3.00);
insert into topic_6.competition_result values (11,78,4.00);
insert into topic_6.competition_result values (11,224,5.00);
insert into topic_6.competition_result values (11,210,6.00);
insert into topic_6.competition_result values (11,187,7.00);
insert into topic_6.competition_result values (11,278,8.00);
insert into topic_6.competition_result values (12,147,1.00);
insert into topic_6.competition_result values (12,58,2.00);
insert into topic_6.competition_result values (12,106,3.00);
insert into topic_6.competition_result values (12,187,4.00);
insert into topic_6.competition_result values (12,10,5.00);
insert into topic_6.competition_result values (12,206,6.00);
insert into topic_6.competition_result values (12,18,7.00);
insert into topic_6.competition_result values (12,45,8.00);
insert into topic_6.competition_result values (12,11,9.00);
insert into topic_6.competition_result values (12,228,10.00);
insert into topic_6.competition_result values (12,246,11.00);
insert into topic_6.competition_result values (13,50,1.00);
insert into topic_6.competition_result values (13,233,2.00);
insert into topic_6.competition_result values (13,60,3.00);
insert into topic_6.competition_result values (13,194,4.00);
insert into topic_6.competition_result values (13,8,5.00);
insert into topic_6.competition_result values (13,129,6.00);
insert into topic_6.competition_result values (13,178,7.00);
insert into topic_6.competition_result values (13,238,8.00);
insert into topic_6.competition_result values (13,300,9.00);
insert into topic_6.competition_result values (13,53,10.00);
insert into topic_6.competition_result values (13,292,11.00);
insert into topic_6.competition_result values (13,299,12.00);
insert into topic_6.competition_result values (13,80,13.00);
insert into topic_6.competition_result values (13,27,14.00);
insert into topic_6.competition_result values (13,68,15.00);
insert into topic_6.competition_result values (13,16,16.00);
insert into topic_6.competition_result values (14,135,1.00);
insert into topic_6.competition_result values (14,142,2.00);
insert into topic_6.competition_result values (14,233,3.00);
insert into topic_6.competition_result values (14,88,4.00);
insert into topic_6.competition_result values (14,283,5.00);
insert into topic_6.competition_result values (14,230,6.00);
insert into topic_6.competition_result values (14,102,7.00);
insert into topic_6.competition_result values (14,281,8.00);
insert into topic_6.competition_result values (15,103,1.00);
insert into topic_6.competition_result values (15,167,2.00);
insert into topic_6.competition_result values (15,152,3.00);
insert into topic_6.competition_result values (15,13,4.00);
insert into topic_6.competition_result values (15,245,5.00);
insert into topic_6.competition_result values (15,169,6.00);
insert into topic_6.competition_result values (15,127,7.00);
insert into topic_6.competition_result values (15,282,8.00);

insert into topic_6.competition values (1, 'Swimming', '2021-1-11', 'China', 'DESC');
insert into topic_6.competition values (2, 'Athletics', '2020-12-11', 'Indonesia', 'DESC');
insert into topic_6.competition values (3, 'Chess', '2020-1-3', 'Myanmar', 'DESC');
insert into topic_6.competition values (4, 'Archery', '2019-5-10', 'Sweden', 'ASC');
insert into topic_6.competition values (5, 'Badminton', '2019-4-11', 'Australia', 'DESC');
insert into topic_6.competition values (6, 'Gymnastics', '2019-1-11', 'Cameroon', 'ASC');
insert into topic_6.competition values (7, 'Skiing', '2018-12-1', 'Spain', 'ASC');
insert into topic_6.competition values (8, 'Diving', '2017-4-5', 'Finland', 'ASC');
insert into topic_6.competition values (9, 'Equestrian', '2017-6-1', 'Japan', 'ASC');
insert into topic_6.competition values (10, 'Judo', '2017-1-12', 'Mozambique', 'ASC');
insert into topic_6.competition values (11, 'Karate', '2016-10-10', 'Israel', 'ASC');
insert into topic_6.competition values (12, 'Athletics', '2016-2-5', 'Portugal', 'ASC');
insert into topic_6.competition values (13, 'Chess', '2016-4-11', 'Russia', 'ASC');
insert into topic_6.competition values (14, 'Snowboard', '2015-1-18', 'Luxembourg', 'ASC');
insert into topic_6.competition values (15, 'Tennis', '2014-8-15', 'Brazil', 'ASC');

insert into topic_6.participant values (1, 'Diego Gallaher', '2008-08-10', 'China');
insert into topic_6.participant values (2, 'Ofella Palmby', '1979-05-05', 'Philippines');
insert into topic_6.participant values (3, 'Micheline Curmi', '1965-10-29', 'Syria');
insert into topic_6.participant values (4, 'Dynah Andisie', '1970-02-12', 'Russia');
insert into topic_6.participant values (5, 'Dal Lots', '1957-03-19', 'Portugal');
insert into topic_6.participant values (6, 'Ethelda Camacke', '1957-08-29', 'Indonesia');
insert into topic_6.participant values (7, 'Cyril Ehrat', '1974-09-27', 'France');
insert into topic_6.participant values (8, 'Roger Stelfax', '1980-02-11', 'Portugal');
insert into topic_6.participant values (9, 'Jabez McMaster', '1988-08-18', 'Ireland');
insert into topic_6.participant values (10, 'Adrianna Tremberth', '1978-02-11', 'Russia');
insert into topic_6.participant values (11, 'Judie Rammell', '1964-12-20', 'Indonesia');
insert into topic_6.participant values (12, 'Brooke Gaw', '1995-07-16', 'Czech Republic');
insert into topic_6.participant values (13, 'Allsun Scimone', '1994-07-27', 'Philippines');
insert into topic_6.participant values (14, 'Pamela Laye', '1986-05-29', 'Philippines');
insert into topic_6.participant values (15, 'Ranee Trott', '1974-08-18', 'Argentina');
insert into topic_6.participant values (16, 'Lisle Abramski', '1993-03-28', 'Iraq');
insert into topic_6.participant values (17, 'Cheryl Bick', '1993-05-11', 'Indonesia');
insert into topic_6.participant values (18, 'Noby Spriggs', '1985-09-17', 'Macedonia');
insert into topic_6.participant values (19, 'Schuyler Weston', '1966-09-04', 'Tanzania');
insert into topic_6.participant values (20, 'Horton Ongin', '1961-08-11', 'China');
insert into topic_6.participant values (21, 'Carolyn Goodliff', '2002-01-17', 'Pakistan');
insert into topic_6.participant values (22, 'Geri Barnfather', '1985-02-24', 'Serbia');
insert into topic_6.participant values (23, 'Gearard Mote', '1990-06-01', 'Chile');
insert into topic_6.participant values (24, 'Sheffield Murrigans', '1970-03-26', 'Sweden');
insert into topic_6.participant values (25, 'Saunder Olivo', '1961-12-31', 'El Salvador');
insert into topic_6.participant values (26, 'Willamina Lequeux', '1993-12-10', 'Canada');
insert into topic_6.participant values (27, 'Eduard Fessier', '1957-04-22', 'Portugal');
insert into topic_6.participant values (28, 'Clywd Follacaro', '1995-12-18', 'Japan');
insert into topic_6.participant values (29, 'Arnuad Tran', '1999-11-27', 'France');
insert into topic_6.participant values (30, 'Bartlett Freiberg', '1987-06-26', 'Poland');
insert into topic_6.participant values (31, 'Alyssa Sousa', '1955-11-06', 'Tajikistan');
insert into topic_6.participant values (32, 'Lenci Kurth', '2000-10-11', 'Ivory Coast');
insert into topic_6.participant values (33, 'Jojo Thomesson', '1984-09-12', 'Honduras');
insert into topic_6.participant values (34, 'Brittney Sowood', '1971-05-06', 'Peru');
insert into topic_6.participant values (35, 'Pavia Ahlf', '1964-05-24', 'Russia');
insert into topic_6.participant values (36, 'Dennie Conerding', '1994-12-04', 'Nigeria');
insert into topic_6.participant values (37, 'Maribel Wenn', '1992-03-11', 'Indonesia');
insert into topic_6.participant values (38, 'Starr Creffield', '1960-08-03', 'Japan');
insert into topic_6.participant values (39, 'Drucie Crow', '1955-02-24', 'France');
insert into topic_6.participant values (40, 'Jamill Limmer', '1959-06-09', 'Brazil');
insert into topic_6.participant values (41, 'Dulce Kollaschek', '1975-11-16', 'China');
insert into topic_6.participant values (42, 'Wayland Murfett', '1956-09-03', 'China');
insert into topic_6.participant values (43, 'Forbes Wrought', '1957-11-22', 'Nigeria');
insert into topic_6.participant values (44, 'Roland Foulstone', '1964-02-08', 'Peru');
insert into topic_6.participant values (45, 'Loreen Dudney', '1969-10-05', 'Indonesia');
insert into topic_6.participant values (46, 'Dorey Norgan', '1971-04-28', 'Australia');
insert into topic_6.participant values (47, 'Everett Riddock', '1974-07-17', 'China');
insert into topic_6.participant values (48, 'Chandra Brevetor', '1987-05-14', 'Russia');
insert into topic_6.participant values (49, 'Krissie Stapylton', '1983-04-15', 'Philippines');
insert into topic_6.participant values (50, 'Win Proudlock', '1982-11-06', 'Poland');
insert into topic_6.participant values (51, 'Giffy Lago', '1962-03-18', 'Ukraine');
insert into topic_6.participant values (52, 'Edgar Bonson', '1966-03-15', 'Russia');
insert into topic_6.participant values (53, 'Der de Keyser','1998-03-10' , 'Denmark');
insert into topic_6.participant values (54, 'Findlay Aspy', '1955-11-25', 'China');
insert into topic_6.participant values (55, 'Collette MacAlpin', '1982-02-14', 'Czech Republic');
insert into topic_6.participant values (56, 'Irwinn Dewett', '1961-09-30', 'Indonesia');
insert into topic_6.participant values (57, 'Titos Woller', '1988-08-13', 'Philippines');
insert into topic_6.participant values (58, 'Odelinda Spurr', '1963-02-19', 'Philippines');
insert into topic_6.participant values (59, 'Marco Jennison', '1968-08-29', 'Tanzania');
insert into topic_6.participant values (60, 'Jolene LeEstut', '1987-01-24', 'China');
insert into topic_6.participant values (61, 'Ellwood Pinnijar', '1973-02-06', 'Russia');
insert into topic_6.participant values (62, 'Sarge Deeks', '1967-08-05', 'Russia');
insert into topic_6.participant values (63, 'Janna Huniwall', '1997-08-29', 'Czech Republic');
insert into topic_6.participant values (64, 'Sholom Vipan', '1990-02-20', 'China');
insert into topic_6.participant values (65, 'Hadlee McNeilley', '1994-08-05', 'Brazil');
insert into topic_6.participant values (66, 'Rahal Jahnig', '1997-01-04', 'Nigeria');
insert into topic_6.participant values (67, 'Waldo Oulett', '1967-07-13', 'Libya');
insert into topic_6.participant values (68, 'Teresita Filer', '1957-09-30', 'Saudi Arabia');
insert into topic_6.participant values (69, 'Alan Ferens', '1982-11-01', 'Japan');
insert into topic_6.participant values (70, 'Mufi Piercey', '1977-01-15', 'Indonesia');
insert into topic_6.participant values (71, 'Eddy Dyerson', '1983-11-08', 'United States');
insert into topic_6.participant values (72, 'Ericka Cooling', '1986-10-03', 'Indonesia');
insert into topic_6.participant values (73, 'Opal Taye', '1984-12-04', 'United States');
insert into topic_6.participant values (74, 'Dede Bernardino', '1964-11-24', 'China');
insert into topic_6.participant values (75, 'Beverley Meddemmen', '1966-05-18', 'Philippines');
insert into topic_6.participant values (76, 'Kat Trapp', '1971-01-13', 'Philippines');
insert into topic_6.participant values (77, 'Teddie Mulqueeny', '1980-12-29', 'Honduras');
insert into topic_6.participant values (78, 'Claudian Ladewig', '1960-05-05', 'Finland');
insert into topic_6.participant values (79, 'Griffie Orton', '2002-01-31', 'Indonesia');
insert into topic_6.participant values (80, 'Gardie Hosten', '1955-12-22', 'Philippines');
insert into topic_6.participant values (81, 'Linnea Carse', '1964-02-01', 'United States');
insert into topic_6.participant values (82, 'Joaquin Gomby', '1978-07-04', 'Czech Republic');
insert into topic_6.participant values (83, 'Osgood Chimenti', '1974-12-17', 'Canada');
insert into topic_6.participant values (84, 'Jake Liversley', '2004-03-09', 'United States');
insert into topic_6.participant values (85, 'Bertrando Perin', '1987-11-30', 'Philippines');
insert into topic_6.participant values (86, 'Berkly Spry', '1982-04-03', 'Philippines');
insert into topic_6.participant values (87, 'Porter Hannaby', '1980-02-03', 'Mozambique');
insert into topic_6.participant values (88, 'Lorita Paynter', '1975-02-06', 'Indonesia');
insert into topic_6.participant values (89, 'Fredi Filson', '1984-08-12', 'Madagascar');
insert into topic_6.participant values (90, 'Jayne Witheridge', '1987-02-05', 'Russia');
insert into topic_6.participant values (91, 'Daria Birkett', '1968-12-17', 'Portugal');
insert into topic_6.participant values (92, 'Jeanette Glason', '1957-04-29', 'Indonesia');
insert into topic_6.participant values (93, 'Papagena Pitney', '1962-02-21', 'China');
insert into topic_6.participant values (94, 'Reece Maurice', '1964-04-09', 'Panama');
insert into topic_6.participant values (95, 'Heall Colloby', '1985-01-15', 'Czech Republic');
insert into topic_6.participant values (96, 'Doro Artus', '1983-09-02', 'Indonesia');
insert into topic_6.participant values (97, 'Muriel Nisco', '1999-09-30', 'China');
insert into topic_6.participant values (98, 'Mose Runnacles', '1959-05-27', 'Vietnam');
insert into topic_6.participant values (99, 'Eleonora Blaxeland', '1993-01-02', 'Philippines');
insert into topic_6.participant values (100, 'Gustave Copcutt', '1987-03-23', 'Poland');
insert into topic_6.participant values (101, 'Barbe Lofty', '1958-12-22', 'Macedonia');
insert into topic_6.participant values (102, 'Jake Micka', '1971-05-03', 'Russia');
insert into topic_6.participant values (103, 'Danielle Kikke', '1983-11-30', 'France');
insert into topic_6.participant values (104, 'Davis Boscher', '2000-03-27', 'Angola');
insert into topic_6.participant values (105, 'Judah Vaz', '1989-03-01', 'China');
insert into topic_6.participant values (106, 'Anneliese McPartlin', '1966-07-18', 'Philippines');
insert into topic_6.participant values (107, 'Dallon Deporte', '1979-05-08', 'Armenia');
insert into topic_6.participant values (108, 'Tye McCaw', '1960-07-19', 'Philippines');
insert into topic_6.participant values (109, 'Stephan Mabbot', '1974-06-21', 'Cuba');
insert into topic_6.participant values (110, 'Sherill Huxley', '1955-05-26', 'Portugal');
insert into topic_6.participant values (111, 'Dugald Lane', '2003-10-28', 'France');
insert into topic_6.participant values (112, 'Jae Rivaland', '1999-05-23', 'Yemen');
insert into topic_6.participant values (113, 'Carlita Friese', '1995-03-03', 'China');
insert into topic_6.participant values (114, 'Joelynn Blaik', '1982-05-03', 'China');
insert into topic_6.participant values (115, 'Corty Guiel', '1991-08-16', 'Venezuela');
insert into topic_6.participant values (116, 'Rossy Bouch', '1967-12-30', 'Indonesia');
insert into topic_6.participant values (117, 'Flory Aseef', '1958-08-22', 'United States');
insert into topic_6.participant values (118, 'Jeth Sapsford', '1959-08-26', 'Indonesia');
insert into topic_6.participant values (119, 'Marshall Rotte', '1977-08-10', 'Russia');
insert into topic_6.participant values (120, 'Keven Torbeck', '1992-08-30', 'Indonesia');
insert into topic_6.participant values (121, 'Jabez Swanson', '1976-01-05', 'China');
insert into topic_6.participant values (122, 'Aprilette Repper', '1994-12-20', 'Sweden');
insert into topic_6.participant values (123, 'Richmound Testo', '2002-12-07', 'Mexico');
insert into topic_6.participant values (124, 'Johnath Barts', '1981-11-05', 'China');
insert into topic_6.participant values (125, 'Karoly Duckitt', '1972-04-07', 'South Africa');
insert into topic_6.participant values (126, 'Stirling McCurley', '1963-10-28', 'Indonesia');
insert into topic_6.participant values (127, 'Man Matthis', '1975-01-23', 'Turkmenistan');
insert into topic_6.participant values (128, 'Gibbie Parkisson', '1965-06-15', 'Kosovo');
insert into topic_6.participant values (129, 'Dita Vittle', '1981-11-22', 'Poland');
insert into topic_6.participant values (130, 'Nevin McNeil', '1987-01-29', 'China');
insert into topic_6.participant values (131, 'Valaree Woolliams', '1985-04-30', 'Bolivia');
insert into topic_6.participant values (132, 'Shoshana Watting', '2003-10-08', 'Indonesia');
insert into topic_6.participant values (133, 'Zola Downage', '1956-09-02', 'Portugal');
insert into topic_6.participant values (134, 'Ferne Allibon', '1988-05-08', 'France');
insert into topic_6.participant values (135, 'Aristotle Hillum', '1977-04-27', 'Netherlands');
insert into topic_6.participant values (136, 'Padriac Koppes', '1979-12-27', 'Indonesia');
insert into topic_6.participant values (137, 'Stormi Magovern', '1988-01-06', 'Botswana');
insert into topic_6.participant values (138, 'Renault Gaynesford', '1990-07-08', 'Denmark');
insert into topic_6.participant values (139, 'Gasper Aleswell', '1971-10-20', 'Honduras');
insert into topic_6.participant values (140, 'Kellen Pope', '1987-08-18', 'China');
insert into topic_6.participant values (141, 'Paula Meedendorpe', '1985-07-08', 'China');
insert into topic_6.participant values (142, 'Donall Charlson', '1973-08-10', 'Angola');
insert into topic_6.participant values (143, 'Joelie Lamey', '2001-05-13', 'Zimbabwe');
insert into topic_6.participant values (144, 'Mersey McInnerny', '1959-07-21', 'Croatia');
insert into topic_6.participant values (145, 'Willette Racher', '1977-03-31', 'Russia');
insert into topic_6.participant values (146, 'Laetitia Duxfield', '1957-03-17', 'China');
insert into topic_6.participant values (147, 'Shena Oswell', '2003-11-23', 'Russia');
insert into topic_6.participant values (148, 'Camile Bosley', '1983-03-26', 'Russia');
insert into topic_6.participant values (149, 'Kathleen Ludye', '1972-04-10', 'Ukraine');
insert into topic_6.participant values (150, 'Sigvard Cino', '1959-09-03', 'Russia');
insert into topic_6.participant values (151, 'Arvie Bischof', '1973-01-02', 'China');
insert into topic_6.participant values (152, 'Tyrone Glenny', '1974-02-03', 'China');
insert into topic_6.participant values (153, 'Cinda Witherow', '2003-02-09', 'Ukraine');
insert into topic_6.participant values (154, 'Georgena Denge', '1958-05-16', 'Isle of Man');
insert into topic_6.participant values (155, 'Iolanthe Petrichat', '1996-11-11', 'Russia');
insert into topic_6.participant values (156, 'Cecilio Fairebrother', '1981-10-16', 'Canada');
insert into topic_6.participant values (157, 'Spence Burkman', '1965-12-22', 'China');
insert into topic_6.participant values (158, 'Avrit Burnet', '1962-07-11', 'Croatia');
insert into topic_6.participant values (159, 'Val Arendt', '1980-08-08', 'Indonesia');
insert into topic_6.participant values (160, 'Thatch Folk', '1999-05-24', 'Netherlands');
insert into topic_6.participant values (161, 'Vern Byrom', '1981-06-07', 'Ukraine');
insert into topic_6.participant values (162, 'Arleen Shoard', '1981-09-12', 'Argentina');
insert into topic_6.participant values (163, 'Brenda Jone', '1990-05-19', 'Indonesia');
insert into topic_6.participant values (164, 'Stanly Kirckman', '2001-12-03', 'Nigeria');
insert into topic_6.participant values (165, 'Hugo Quirk', '1981-10-25', 'China');
insert into topic_6.participant values (166, 'Kathleen Seakings', '1973-07-30', 'China');
insert into topic_6.participant values (167, 'Dottie Biggen', '1967-09-07', 'Mongolia');
insert into topic_6.participant values (168, 'Arni Stuckes', '1973-09-30', 'Bosnia and Herzegovina');
insert into topic_6.participant values (169, 'Ashbey Dabell', '1956-07-27', 'Panama');
insert into topic_6.participant values (170, 'Imogene Kield', '1988-08-17', 'Macedonia');
insert into topic_6.participant values (171, 'Ekaterina Neighbour', '1956-02-03', 'Russia');
insert into topic_6.participant values (172, 'Domenico Juggins', '1986-09-06', 'Thailand');
insert into topic_6.participant values (173, 'Honor Shipperbottom', '1981-08-20', 'China');
insert into topic_6.participant values (174, 'Pyotr Mullane', '2001-08-31', 'Peru');
insert into topic_6.participant values (175, 'Freeman Griston', '1990-07-21', 'Czech Republic');
insert into topic_6.participant values (176, 'Joni Hunn', '1974-12-03', 'Vietnam');
insert into topic_6.participant values (177, 'Job Jory', '1964-12-20', 'China');
insert into topic_6.participant values (178, 'Marlo Ranby', '1973-01-17', 'Portugal');
insert into topic_6.participant values (179, 'Robby Dukesbury', '2003-08-29', 'Belarus');
insert into topic_6.participant values (180, 'Jermayne Piggen', '1987-01-22', 'Canada');
insert into topic_6.participant values (181, 'Dan McInnerny', '1992-06-05', 'Mongolia');
insert into topic_6.participant values (182, 'Joelle Sommerland', '1979-10-01', 'Portugal');
insert into topic_6.participant values (183, 'Erny Farady', '1977-08-11', 'United States');
insert into topic_6.participant values (184, 'Brad Sands', '1988-12-07', 'Mexico');
insert into topic_6.participant values (185, 'Angie Dowle', '1975-11-16', 'Iraq');
insert into topic_6.participant values (186, 'Alan Beardsley', '1977-03-20', 'Russia');
insert into topic_6.participant values (187, 'Malory Ciccottio', '1964-11-23', 'China');
insert into topic_6.participant values (188, 'Daryl Adnet', '1985-12-18', 'China');
insert into topic_6.participant values (189, 'Marietta Caffrey', '1979-01-19', 'China');
insert into topic_6.participant values (190, 'Magdaia Huchot', '1972-07-19', 'Egypt');
insert into topic_6.participant values (191, 'Dominga Langfitt', '1979-04-06', 'Portugal');
insert into topic_6.participant values (192, 'Nettie Crossingham', '1987-12-30', 'China');
insert into topic_6.participant values (193, 'Wilone Sinfield', '1975-04-17', 'Brazil');
insert into topic_6.participant values (194, 'Claire Roseby', '1971-10-18', 'China');
insert into topic_6.participant values (195, 'Hendrika Broadwood', '1989-12-12', 'Peru');
insert into topic_6.participant values (196, 'Tom Tolworthy', '1968-06-23', 'China');
insert into topic_6.participant values (197, 'Shawnee Banisch', '1969-09-18', 'Philippines');
insert into topic_6.participant values (198, 'Kelci Wiltshier', '1996-03-06', 'Sweden');
insert into topic_6.participant values (199, 'Lorette Tyson', '1992-03-28', 'China');
insert into topic_6.participant values (200, 'Cherie Daviot', '1980-03-19', 'China');
insert into topic_6.participant values (201, 'Gunter MacDonnell', '1975-07-25', 'Sweden');
insert into topic_6.participant values (202, 'Hermina Jandac', '1993-03-01', 'Czech Republic');
insert into topic_6.participant values (203, 'Coleman Stelle', '1961-12-22', 'Croatia');
insert into topic_6.participant values (204, 'Garik Castellanos', '1969-08-25', 'Mexico');
insert into topic_6.participant values (205, 'Claudette Kinnier', '1970-04-08', 'China');
insert into topic_6.participant values (206, 'Justino Hawes', '1996-12-21', 'Colombia');
insert into topic_6.participant values (207, 'Averell Greener', '1978-10-24', 'Portugal');
insert into topic_6.participant values (208, 'Lenci Rowcliffe', '1986-10-29', 'China');
insert into topic_6.participant values (209, 'Morganica Pretorius', '1978-09-11', 'Greece');
insert into topic_6.participant values (210, 'Staffard Fewtrell', '2004-03-09', 'Bangladesh');
insert into topic_6.participant values (211, 'Helsa Groombridge', '1975-09-06', 'Russia');
insert into topic_6.participant values (212, 'Rosemaria Karran', '1979-10-06', 'Malaysia');
insert into topic_6.participant values (213, 'Dagmar Plumbridge', '1995-01-14', 'Indonesia');
insert into topic_6.participant values (214, 'Porter Veevers', '1983-04-16', 'Qatar');
insert into topic_6.participant values (215, 'Roddy Zavattari', '1980-08-12', 'Ethiopia');
insert into topic_6.participant values (216, 'Delphinia Nuzzti', '1994-05-31', 'Afghanistan');
insert into topic_6.participant values (217, 'Osgood Osinin', '1997-03-05', 'Indonesia');
insert into topic_6.participant values (218, 'Peggi Pandya', '2002-10-20', 'Indonesia');
insert into topic_6.participant values (219, 'Gardner Tilford', '1981-07-17', 'Luxembourg');
insert into topic_6.participant values (220, 'Alf Crebbin', '1959-04-13', 'China');
insert into topic_6.participant values (221, 'Davide Sprey', '1988-10-08', 'Philippines');
insert into topic_6.participant values (222, 'Valaria Bilbery', '1962-01-02', 'Montenegro');
insert into topic_6.participant values (223, 'Mollee Deacock', '1997-11-04', 'China');
insert into topic_6.participant values (224, 'Dena Mosedill', '1969-12-20', 'Philippines');
insert into topic_6.participant values (225, 'Corly Cockayme', '1991-04-11', 'El Salvador');
insert into topic_6.participant values (226, 'Marve Spaule', '1997-07-14', 'Poland');
insert into topic_6.participant values (227, 'Bruno Challicum', '1971-03-25', 'Sweden');
insert into topic_6.participant values (228, 'Alfonse Plowman', '1961-05-03', 'United Kingdom');
insert into topic_6.participant values (229, 'Izzy Fugere', '1965-07-08', 'Brazil');
insert into topic_6.participant values (230, 'Meriel Tongs', '1999-12-14', 'Bosnia and Herzegovina');
insert into topic_6.participant values (231, 'Ramonda Garfitt', '1968-03-17', 'Indonesia');
insert into topic_6.participant values (232, 'Cati Rowler', '1964-12-29', 'Netherlands');
insert into topic_6.participant values (233, 'Kania Bridge', '1966-07-26', 'Russia');
insert into topic_6.participant values (234, 'Eli Ambroise', '1999-04-22', 'Bulgaria');
insert into topic_6.participant values (235, 'Mill Juckes', '1970-05-08', 'China');
insert into topic_6.participant values (236, 'Jamie Wrintmore', '1978-09-12', 'China');
insert into topic_6.participant values (237, 'Temple Ravenshaw', '1996-03-12', 'Ukraine');
insert into topic_6.participant values (238, 'Nicolais Dermid', '1960-06-08', 'Indonesia');
insert into topic_6.participant values (239, 'Michal Varga', '1985-07-15', 'United States');
insert into topic_6.participant values (240, 'Loutitia Lambersen', '1972-02-24', 'Indonesia');
insert into topic_6.participant values (241, 'Jozef Farfoot', '1990-03-18', 'Russia');
insert into topic_6.participant values (242, 'Wendall Shovelton', '1995-05-02', 'China');
insert into topic_6.participant values (243, 'Tobit Sedgemore', '1962-09-14', 'China');
insert into topic_6.participant values (244, 'Ansley Vince', '1974-08-24', 'Vietnam');
insert into topic_6.participant values (245, 'Jessi Locket', '1987-05-18', 'China');
insert into topic_6.participant values (246, 'Broddy Scoffins', '1955-03-21', 'United States');
insert into topic_6.participant values (247, 'Kaine Brunotti', '1995-08-31', 'Croatia');
insert into topic_6.participant values (248, 'Cesar Gainsborough', '1983-04-16', 'Ivory Coast');
insert into topic_6.participant values (249, 'Sidonnie Litherborough', '1978-09-25', 'Indonesia');
insert into topic_6.participant values (250, 'Jilleen Heinzler', '1973-03-24', 'Portugal');
insert into topic_6.participant values (251, 'Fergus Jeram', '1995-05-22', 'Indonesia');
insert into topic_6.participant values (252, 'Ax Leadley', '1973-04-20', 'Indonesia');
insert into topic_6.participant values (253, 'Ellissa Robberecht', '1959-04-01', 'Ukraine');
insert into topic_6.participant values (254, 'Paddie Kamena', '2004-03-15', 'Portugal');
insert into topic_6.participant values (255, 'Alejoa Gullick', '1997-05-31', 'Portugal');
insert into topic_6.participant values (256, 'Arly Lahy', '1981-10-07', 'China');
insert into topic_6.participant values (257, 'Chad Musslewhite', '1983-12-09', 'Czech Republic');
insert into topic_6.participant values (258, 'Bartel Julyan', '2001-07-15', 'Iraq');
insert into topic_6.participant values (259, 'Gilda Taw', '1956-05-18', 'China');
insert into topic_6.participant values (260, 'Sandor Dennett', '1974-02-13', 'Greece');
insert into topic_6.participant values (261, 'Rivkah Molineaux', '2000-08-02', 'Argentina');
insert into topic_6.participant values (262, 'Kariotta Barnish', '1957-03-20', 'Slovenia');
insert into topic_6.participant values (263, 'Solly Bowmen', '1958-07-02', 'Portugal');
insert into topic_6.participant values (264, 'Elli Fiddyment', '1984-02-19', 'Poland');
insert into topic_6.participant values (265, 'Aili Stranks', '1957-06-16', 'France');
insert into topic_6.participant values (266, 'Kimbell Barbara', '1997-04-12', 'China');
insert into topic_6.participant values (267, 'Euell Mounsie', '1975-09-07', 'El Salvador');
insert into topic_6.participant values (268, 'Roman Whitworth', '1968-04-16', 'Bhutan');
insert into topic_6.participant values (269, 'Lucais Milner', '2003-07-25', 'New Caledonia');
insert into topic_6.participant values (270, 'Beth Reddin', '1955-12-02', 'Ukraine');
insert into topic_6.participant values (271, 'Nathalie Skepper', '1980-08-08', 'Iran');
insert into topic_6.participant values (272, 'Valaree Stolting', '1977-05-17', 'Russia');
insert into topic_6.participant values (273, 'Aleta Stennes', '1957-07-11', 'Brazil');
insert into topic_6.participant values (274, 'Marji MacKonochie', '1971-01-10', 'Indonesia');
insert into topic_6.participant values (275, 'Karrie Everall', '1978-01-26', 'Indonesia');
insert into topic_6.participant values (276, 'Matty McKilroe', '1971-02-07', 'Mexico');
insert into topic_6.participant values (277, 'Abbe Howe', '1960-07-09', 'Thailand');
insert into topic_6.participant values (278, 'Jillie Burden', '1997-12-23', 'Burkina Faso');
insert into topic_6.participant values (279, 'Margette Rummer', '1964-05-14', 'Russia');
insert into topic_6.participant values (280, 'Creighton Mackison', '1976-11-08', 'Brazil');
insert into topic_6.participant values (281, 'Vonnie Lafrentz', '1974-11-09', 'China');
insert into topic_6.participant values (282, 'Ailina Guilaem', '1986-02-14', 'Finland');
insert into topic_6.participant values (283, 'Ilyssa Mercey', '1959-01-12', 'Israel');
insert into topic_6.participant values (284, 'Misha Delve', '1993-09-18', 'Albania');
insert into topic_6.participant values (285, 'Mischa Tatton', '1988-12-03', 'Japan');
insert into topic_6.participant values (286, 'Arin Sedworth', '1961-02-13', 'Cayman Islands');
insert into topic_6.participant values (287, 'Myrvyn Ayton', '1983-12-30', 'Indonesia');
insert into topic_6.participant values (288, 'Sebastiano Tease', '1957-12-01', 'China');
insert into topic_6.participant values (289, 'Les Haldenby', '1996-12-30', 'Argentina');
insert into topic_6.participant values (290, 'Arnaldo Twiname', '2000-10-07', 'Portugal');
insert into topic_6.participant values (291, 'Ag Woodyear', '1966-11-22', 'Sweden');
insert into topic_6.participant values (292, 'Alexa Gulc', '1961-06-16', 'Sweden');
insert into topic_6.participant values (293, 'Doreen Domingues', '1989-09-15', 'Philippines');
insert into topic_6.participant values (294, 'Janeen Ratnage', '2000-08-23', 'Indonesia');
insert into topic_6.participant values (295, 'Hugo Donizeau', '1981-09-22', 'Philippines');
insert into topic_6.participant values (296, 'Louis Gilbart', '1990-04-28', 'Vietnam');
insert into topic_6.participant values (297, 'Tedmund McGougan', '2003-03-10', 'China');
insert into topic_6.participant values (298, 'Celinka Sugars', '1979-05-15', 'China');
insert into topic_6.participant values (299, 'Jyoti Backshill', '2002-03-01', 'Myanmar');
insert into topic_6.participant values (300, 'Anabelle Langcaster', '1991-11-08', 'China');


-- Для каждого соревнования получить топ-1 результат

SELECT DISTINCT competition_nm,
       CASE
           WHEN result_sorting_type_code = 'ASC'
           THEN first_value(participant_nm) OVER (PARTITION BY c0.competition_id
                                                  ORDER BY participant_result_amt
                                                  ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
           ELSE first_value(participant_nm) OVER (PARTITION BY c0.competition_id
                                                  ORDER BY participant_result_amt DESC
                                                  ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
       END AS winner
FROM topic_6.competition AS c0
INNER JOIN topic_6.competition_result c on c0.competition_id = c.competition_id
INNER JOIN topic_6.participant c2 on c.participant_id = c2.participant_id;

-- Для каждого соревнования вывести призовые места

WITH temp AS (
SELECT DISTINCT competition_nm, participant_nm, participant_result_amt,
       CASE
           WHEN result_sorting_type_code = 'ASC'
           THEN dense_rank() OVER (PARTITION BY c0.competition_id
                                   ORDER BY participant_result_amt
                                   ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
           ELSE dense_rank() OVER (PARTITION BY c0.competition_id
                                   ORDER BY participant_result_amt DESC
                                   ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
       END AS rank
FROM topic_6.competition AS c0
INNER JOIN topic_6.competition_result c on c0.competition_id = c.competition_id
INNER JOIN topic_6.participant c2 on c.participant_id = c2.participant_id)

SELECT *
FROM temp
WHERE rank <= 3
ORDER BY competition_nm, rank;

-- Для каждого непризового места вывести отклонение от лучшего результата

WITH temp AS (
SELECT DISTINCT competition_nm, participant_nm, participant_result_amt,
       CASE
           WHEN result_sorting_type_code = 'ASC'
           THEN dense_rank() OVER (PARTITION BY c0.competition_id
                                   ORDER BY participant_result_amt
                                   ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
           ELSE dense_rank() OVER (PARTITION BY c0.competition_id
                                   ORDER BY participant_result_amt DESC
                                   ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
       END AS rank,
       CASE
           WHEN result_sorting_type_code = 'ASC'
           THEN max(participant_result_amt) OVER (PARTITION BY c0.competition_id)
           ELSE min(participant_result_amt) OVER (PARTITION BY c0.competition_id)
       END AS best_result
FROM topic_6.competition AS c0
INNER JOIN topic_6.competition_result c on c0.competition_id = c.competition_id
INNER JOIN topic_6.participant c2 on c.participant_id = c2.participant_id)

SELECT competition_nm, participant_nm, abs(participant_result_amt - best_result) AS delta
FROM temp
WHERE rank > 3
ORDER BY competition_nm, rank;

-- Для каждого соревнования вывести всех участников, которые младше победителя

WITH temp AS (
SELECT DISTINCT competition_nm, participant_birth_dt, participant_nm,
       CASE
           WHEN result_sorting_type_code = 'ASC'
           THEN first_value(participant_birth_dt) OVER (PARTITION BY c0.competition_id
                                                  ORDER BY participant_result_amt
                                                  ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
           ELSE first_value(participant_birth_dt) OVER (PARTITION BY c0.competition_id
                                                  ORDER BY participant_result_amt DESC
                                                  ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
       END AS winner_birth_date
FROM topic_6.competition AS c0
INNER JOIN topic_6.competition_result c on c0.competition_id = c.competition_id
INNER JOIN topic_6.participant c2 on c.participant_id = c2.participant_id)

SELECT *
FROM temp
WHERE participant_birth_dt > winner_birth_date
ORDER BY competition_nm;

-- Для каждого соревнования по каждому участнику вывести результат участника, результат предыдущего участника,
-- следующего участника, а также разницу между ними

WITH temp AS (
SELECT DISTINCT competition_nm, participant_birth_dt, participant_nm,
       CASE
           WHEN result_sorting_type_code = 'ASC'
           THEN lag(participant_result_amt, 1, 0) OVER (PARTITION BY c0.competition_id
                                                  ORDER BY participant_result_amt
                                                  ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
           ELSE lag(participant_result_amt, 1, 0) OVER (PARTITION BY c0.competition_id
                                                  ORDER BY participant_result_amt DESC
                                                  ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
       END AS previous,
       CASE
           WHEN result_sorting_type_code = 'ASC'
           THEN lead(participant_result_amt, 1, 0) OVER (PARTITION BY c0.competition_id
                                                  ORDER BY participant_result_amt
                                                  ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
           ELSE lead(participant_result_amt, 1, 0) OVER (PARTITION BY c0.competition_id
                                                  ORDER BY participant_result_amt DESC
                                                  ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
       END AS next
FROM topic_6.competition AS c0
INNER JOIN topic_6.competition_result c on c0.competition_id = c.competition_id
INNER JOIN topic_6.participant c2 on c.participant_id = c2.participant_id)

SELECT competition_nm, participant_nm, previous, next, abs(previous - next)
FROM temp
ORDER BY competition_nm;

-- Для каждого соревнования получить количество уникальных участников соревнования, не используя GROUP BY



-- Для каждого соревнования вывести статистику: указать, кто из участников был призером в формате "Занял место X", "Не
-- занял призового места"



-- Создать таблицу со статистикой по всем соревнованиям: вывести каждого участника, дату его рождения, его результат,
-- лучший результат по соревнованию, имя участника с лучшим результатом, отклонение результата участника от 1 места,
-- средний резльутат по соревнованию, отклонение результата участника от среднего, минимальный результат по
-- соревнованию, имя участника с минимальным результатом