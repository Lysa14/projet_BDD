--création des tables

create table cinema(
 ID_cinema numeric(30) not null,
 nom varchar(30) not null,
 ville  varchar(30) not null,
 adresse varchar(30) not null,
 PRIMARY KEY(ID_cinema)
);


create table film(
ID_film numeric(30) not null,
titre varchar(30)not null,
duree varchar(30) not null, 
signaletique_jeunesse numeric(30) not null,
genre varchar(30) not null,
anne_sortie numeric(30) not null,
PRIMARY KEY(ID_film)
);


create table salle(
ID_salle numeric(30) not null,
ID_cinema numeric(30) not null,
num_salle numeric(30)  not null,
capacite numeric(30) not null,
constraint pk_salle PRIMARY KEY(ID_salle),
constraint fk_salle FOREIGN KEY(ID_cinema) REFERENCES cinema (ID_cinema)on delete cascade
);


create table seance(
ID_seance int not null,
heure_debut date not null,
heure_fin date not null,
constraint pk_seance PRIMARY KEY(ID_seance),
constraint heure_debut_is_a_time check (heure_debut>=date '2000-01-01' and heure_debut<date '2000-01-02'),
constraint heure_fin_is_time check (heure_fin>=date '2000-01-01' and heure_fin<date '2000-01-02')
);


create table tarif (
ID_tarif numeric(30) not null,
prix numeric(30) not null,
libelle varchar(30),
constraint check_libelle check(libelle ='enfant' OR libelle = 'etudiant' OR libelle ='plein tarif' OR libelle ='senior'),
constraint pk_tarif PRIMARY KEY(ID_tarif)
);

create table projection(
ID_projection numeric(30) not null,
ID_salle numeric(30) not null,
ID_seance numeric(30) not  null,
Id_film numeric(30) not null,
date_projection date not null,
version varchar(30) not null,
constraint pk_projection   PRIMARY KEY(ID_projection),
constraint fk1_projection  FOREIGN KEY(ID_seance) REFERENCES seance (ID_seance) on delete cascade,
constraint fk2_projection  FOREIGN KEY(ID_salle)  REFERENCES salle (ID_salle) on delete cascade,
constraint fk3_projection  FOREIGN KEY(ID_film)  REFERENCES film (ID_film) on delete cascade
);

create table reservation (
date_reservation date not null,
mode_reservation varchar(30),
ID_reservation int not null,
ID_tarif int not null,
ID_projection int not null,
constraint check_mode_reservation check(mode_reservation ='en-ligne' OR mode_reservation = 'sur-place'),
constraint pk_reservation PRIMARY KEY(ID_reservation),
constraint fk1_reservation FOREIGN KEY(ID_tarif) REFERENCES tarif (ID_tarif)on delete cascade,
constraint fk2_reservation FOREIGN KEY(ID_projection) REFERENCES projection (ID_projection)on delete cascade
);


-------modification ------
ALTER TABLE cinema
MODIFY adresse varchar(50);

Alter TABLE film MODIFY
signaletique_jeunesse numeric(30) ;

Alter TABLE film MODIFY
genre varchar(100) ;

Alter TABLE film MODIFY
titre varchar(100) not null ;

----------insertion Reservation ---------
-------------------ORACLE -----------------------------------------------------------
INSERT INTO Reservation VALUES ('01/01/2021' , '02/01/2021' , 'en-ligne' , 1 , 1, 1 );
INSERT INTO Reservation VALUES ('05/01/2021' , '05-01-2021' , 'sur-place' , 2 , 2 , 2 );
INSERT INTO Reservation VALUES ('07/01/2021' , '08/01/2021' , 'en-ligne' , 3 , 1, 3 );
INSERT INTO Reservation VALUES ('12/01/2021' , '12/01/2021' , 'sur-place' , 4 , 2, 4 );
INSERT INTO Reservation VALUES ('12/01/2021' , '12/01/2021' , 'en-ligne' , 5 ,3 , 5 );
INSERT INTO Reservation VALUES ('12/01/2021' , '12/01/2021' , 'sur-place' , 6 ,1, 6);
INSERT INTO Reservation VALUES ('12/01/2021' , '12/01/2021' , 'en-ligne' , 7 ,2, 7 );
INSERT INTO Reservation VALUES ('05/02/2021' , '05/02/2021' , 'en-ligne' , 8 ,3, 8 );
INSERT INTO Reservation VALUES ('05/02/2021' , '05/02/2021' , 'sur-place' , 9 ,1, 9 );
INSERT INTO Reservation VALUES ('12/03/2021' , '12/03/2021' , 'en-ligne' , 10 ,1, 10 );
INSERT INTO Reservation VALUES ('12/03/2021' , '12/03/2021' , 'sur-place' ,11  , 1,11 );
INSERT INTO Reservation VALUES ('13/03/2021' , '14/03/2021' , 'en-ligne' , 12 ,2, 12 );
INSERT INTO Reservation VALUES ('02/04/2021' , '02/04/2021' , 'en-ligne' , 13 ,1, 13 );
INSERT INTO Reservation VALUES ('12/04/2021' , '12/04/2021' , 'sur-place' , 14 ,1, 14 );
INSERT INTO Reservation VALUES ('07/05/2021' , '07/05/2021' , 'en-ligne' , 15 ,2, 15 );
INSERT INTO Reservation VALUES ('12/05/2021' , '15/05/2021' , 'en-ligne' , 16 , 3,16 );
INSERT INTO Reservation VALUES ('14/06/2021' , '14/06/2021' , 'en-ligne' , 17 , 1,17 );
INSERT INTO Reservation VALUES ('09/06/2021' , '09/06/2021' , 'en-ligne' , 18 , 1,18 );
INSERT INTO Reservation VALUES ('19/07/2021' , '19/07/2021' , 'en-ligne' , 19 ,1, 19 );
INSERT INTO Reservation VALUES ('26/07/2021' , '24/07/2021' , 'en-ligne' , 20 ,2, 20 );
INSERT INTO Reservation VALUES ('01/08/2021' , '02/08/2021' , 'en-ligne' , 21 ,1, 21 );
INSERT INTO Reservation VALUES ('12/08/2021' , '12/08/2021' , 'en-ligne' , 22 , 3,22 );
INSERT INTO Reservation VALUES ('13/09/2021' , '13/09/2021' , 'en-ligne' , 23, 3,23);
INSERT INTO Reservation VALUES ('12/10/2021' , '14/10/2021' , 'en-ligne' , 24 , 2,24 );
INSERT INTO Reservation VALUES ('14/10/2021' , '14/10/2021' , 'en-ligne' , 25 , 2,25);
INSERT INTO Reservation VALUES ('12/10/2021' , '12/10/2021' , 'en-ligne' , 26 , 3,26 );
INSERT INTO Reservation VALUES ('05/11/2021' , '12/11/2021' , 'en-ligne' , 27 , 1,27 );
INSERT INTO Reservation VALUES ('12/11/2021' , '12/11/2021' , 'en-ligne' , 28 , 1,28 );
INSERT INTO Reservation VALUES ('25/12/2021' , '25/12/2021', 'en-ligne' , 29, 2,29 );
INSERT INTO Reservation VALUES ('26/12/2021' , '26/12/2021' , 'en-ligne' , 30 , 3,30 );
 
 ---------------MYsql---------------------------------------------------------------

INSERT INTO  Reservation VALUES ('2021-04-01' ,'2021-04-01' , 'en-ligne' , 1 , 1, 1 );
INSERT INTO  Reservation VALUES ('2021-05-11' ,'2021-05-11' , 'sur-place' , 2 , 2 , 2 );
INSERT INTO Reservation VALUES ('2021-05-15' ,'2021-05-15', 'en-ligne' , 3 , 1, 3 );
INSERT INTO Reservation VALUES ('2021-06-12' ,'2021-06-13' , 'sur-place' , 4 , 2, 4 );
INSERT INTO Reservation VALUES ('2021-06-06' ,'2021-06-07' , 'en-ligne' , 5 ,3 , 5 );
INSERT INTO Reservation VALUES ('2021-07-14' ,'2021-07-14' , 'sur-place' , 6 ,1, 6);

---celle qu'a fait younes--

INSERT INTO Reservation VALUES ('20-dec-21','en-ligne',1,1,1);
INSERT INTO Reservation VALUES ('21-dec-21','sur-place',2,1,2);
INSERT INTO Reservation VALUES ('20-dec-21','en-ligne',3,2,3);
INSERT INTO Reservation VALUES ('20/dec/21','sur-place',4,1,3);
INSERT INTO Reservation VALUES ('24/dec/21','sur-place',5,1,4);






 ------insertion pour cinema

insert into cinema values(1,'Champs-Elysees','Paris','Av. des Champs-Elysees, 75008');
insert into cinema values (2,'BALZAC' , 'Paris' , '1 RUE BALZAC 75008');
insert into cinema values (3,'SAINT-MICHEL','Paris','7 RUE HAUTEFEUILLE 75006');
insert into cinema values (4,'SAINT-GERMAIN','Paris',' SAINT-GERMAIN 75006');
insert into cinema values (5,'STRASBOURG','Paris','39 BOULEVARD DE STRASBOURG 75010');
insert into cinema values (6,'St Simon','Versailles','6 RUE ST SIMON 78000');
insert into cinema values (7,'ST DENIS','Colombes','98 RUE ST DENIS 92700');
insert into cinema values (8,'Bethune','Lille','40 Rue de Béthune 59800');
insert into cinema values (9,'Gosselet','Lille','18 rue Gosselet 59000');
insert into cinema values (10,'Cap Sud','Avignon','Vox 
22 place de l Horloge 84000');

------ insertion salle-----
insert into salle values (1,1,1,60);
insert into salle values (2,1,2,40);
insert into salle values (3,1,3,30);
insert into salle values (4,1,4,80);
insert into salle values (5,2,1,30);
insert into salle values (6,2,2,40);
insert into salle values (7,2,3,30);
insert into salle values (8,2,4,40);
insert into salle values (9,3,1,40);
insert into salle values (10,3,2,60);
insert into salle values (11,3,3,60);
insert into salle values (12,4,1,30);
insert into salle values (13,4,2,60);
insert into salle values (14,4,3,50);
insert into salle values (15,4,4,50);
insert into salle values (16,5,1,30);
insert into salle values (17,5,2,40);
insert into salle values (18,5,3,30);
insert into salle values (19,5,4,60);
insert into salle values (20,6,1,30);
insert into salle values (21,6,2,40);
insert into salle values (22,6,3,30);
insert into salle values (23,6,4,50);
insert into salle values (24,7,1,70);
insert into salle values (25,7,2,60);
insert into salle values (26,7,3,60);
insert into salle values (27,7,4,50);
insert into salle values (28,8,1,40);
insert into salle values (29,8,2,30);
insert into salle values (30,8,3,50);
insert into salle values (31,8,4,60);
insert into salle values (32,9,1,60);
insert into salle values (33,9,2,60);
insert into salle values (34,9,3,40);
insert into salle values (35,9,4,80);
insert into salle values (36,10,1,40);
insert into salle values (37,10,2,60);
insert into salle values (38,10,3,50);
insert into salle values(39,10,4,60);


------insertion seance ---


insert into seance values(1,to_date('20000101-100000','YYYYMMDD-HH24MISS'),to_date('20000101-120000','YYYYMMDD-HH24MISS'));

insert into seance values(2,to_date('20000101-130000','YYYYMMDD-HH24MISS'),to_date('20000101-150000','YYYYMMDD-HH24MISS'));

insert into seance values(3,to_date('20000101-160000','YYYYMMDD-HH24MISS'),to_date('20000101-180000','YYYYMMDD-HH24MISS'));

insert into seance values(4,to_date('20000101-190000','YYYYMMDD-HH24MISS'),to_date('20000101-210000','YYYYMMDD-HH24MISS'));

insert into seance values(5,to_date('20000101-210000','YYYYMMDD-HH24MISS'),to_date('20000101-230000','YYYYMMDD-HH24MISS'));
------insertion tarif ---------

--7€ si le libellé est: "Etudiant".5€ si le libellé est: "Enfant"10 €si le libellé est: "Sénior" , plein tarif = 13.
INSERT INTO tarif VALUES(1 ,7 ,'etudiant');
INSERT INTO tarif VALUES(2 ,5 ,'enfant');
INSERT INTO tarif VALUES(3 ,10 ,'senior');
INSERT INTO tarif VALUES(4 ,13 ,'plein tarif');

----------insertion film ----------
insert into film values (1,'fight club',193,-16,'drame',10-09-1999);
insert into film values (2,'Pulp Fiction',154,-12,'gangster et comedie',10-09-1994);
insert into film values (3,'Interstellar',169,-10, 'Science-fiction et drame',5-11-2014);
insert into film values (4,'2001:L Odyssée de l espace ',149,NULL,'Science-fiction et experimental',03-04-1968);
insert into film values (5,'Blade Runner',117,-12,'science-fiction, action et thriller',25-06-1982);
insert into film values (6,'Le Parrain',175,-12,'policier et drame',24-03-1962);
insert into film values (7,'Forrest Gump',142,NULL,'Comédie dramatique',06-07-1994);
insert into film values (8,'Le Seigneur des Anneaux - Le Retour du roi',263,NULL,'Fantasy',01-12-2003);
insert into film values (9,'Le Bon, la Brute et le Truand',178,NULL,'Western',23-12-1966);
insert into film values (10,'The Dark Knight - Le Chevalier noir',153,NULL,'Super-héros et Action',16-07-2008);
insert into film values (11,'Inception',147,-14,'Thriller et Science-fiction',14-07-2010);
insert into film values (12, 'Matrix',169,null,'science-fiction',31-03-1999);
insert into film values (13,'Retour vers le futur I',116,NULL,'gangster et comedie',03-07-1985);
insert into film values (14,'Gladiator',171,-12,'Péplum',05-05-2001);
insert into film values (15,'Titanic',195,NULL,'drame romantique',18-12-1997);
insert into film values (16,'Le Roi Lion',89,NULL,'Animation',15-06-1994);
insert into film values (17,'Eiffel',109,NULL,'drame',13-10-2021);
insert into film values (18,'Les Eternels',157,NULL,'Science Fiction',03-11-2021);
insert into film values (19,'Zone hostile',114,-18,'Science-fiction, action et guerre',15-01-2021);
insert into film values (20,'Spider-Man: No Way Home',148,NULL,'super-héros',15-12-2021);
/*insert into film values (1, 'MOURIR PEUT ATTENDRE',163,null,'action-thriller-espionnage','06-oct-21');
insert into film values (2, 'Infinite',106,null,'scienc fiction-thriller-espionnage','04-oct-2021');
insert into film values (3, 'Le dernier duel',152,12,'drame historique','13-oct-2021');
insert into film values (4,'The Addams Family 2',93,null,'fantastique-comedie','13-oct-2021');
insert into film values (5, 'Eiffel',108,null,'historique','13-oct-2021');*/

--insertion projection--
insert into projection values(1,1,1,1,'23-dec-21','vostfr');
insert into projection values(2,1,4,2,'23-dec-21','VO');
insert into projection values(3,2,1,3,'24-dec-21','vostfr');
insert into projection values(4,2,3,4,'24-dec-21','VO');
insert into projection values(5,3,1,5,'25-dec-21','VO');
insert into projection values(6,3,4,5,'25-dec-21','vostfr');
insert into projection values(7,4,2,5,'26-dec-21','vostfr');
insert into projection values(9,4,2,5,'26-dec-21','vostfr');
insert into projection values(10,4,2,5,'26-dec-21','vostfr');
insert into projection values(11,4,2,5,'26-dec-21','vostfr');
insert into projection values(12,4,2,5,'26-dec-21','vostfr');
insert into projection values(13,4,2,5,'26-dec-21','vostfr');
insert into projection values(14,4,2,5,'26-dec-21','vostfr');
insert into projection values(15,4,2,5,'26-dec-21','vostfr');
insert into projection values(16,4,2,5,'26-dec-21','vostfr');
insert into projection values(17,4,2,5,'26-dec-21','vostfr');


-------------------------------------------------------------------------------------------------
                           -- REQUETTES--
------------------------------------------------------------------------------------------------
--1--
select * from cinema;
--2--
select *
from seance 
INNER JOIN cinema
ON cinema.ville = 'Paris' ;

--3--
select seance.ID_seance , seance.heure_debut , seance.heure_fin , salle.ID_salle , cinema.ID_cinema
from seance 
  inner join salle
 on salle.ID_salle  = seance.ID_salle
  inner join film
 on  film.titre = 'fight club' 
 inner  join cinema 
 on  cinema.ville = 'Paris' and cinema.ID_cinema = salle.ID_cinema
 where seance.ID_seance = seance.ID_salle;

 

--user1 pourra consulter les tarifs des reservations  mais jamais les modifier ni les supprimer 
CREATE VIEW v_reservation AS (
 select prix
 from tarif
 inner join  reservation
 on reservation.ID_tarif = tarif.ID_tarif
);

CREATE OR REPLACE VIEW v_reservation AS (
 select DISTINCT prix
 from tarif
  left join  reservation
 on reservation.ID_tarif = tarif.ID_tarif

);

select * from v_reservation;

GRANT  select 
  on TABLE v_tarif
  to user1;

---les vues  
--
CREATE VIEW v_sommereservation AS (
select cinema.ID_cinema , sum(tarif.prix)
from cinema
 join reservation
 join tarif
on tarif.ID_tarif = reservation.ID_tarif
join seance
on seance.ID_seance = reservation.id_seance
 join salle
on cinema.ID_cinema = salle.ID_cinema 
group by ID_cinema ;
)


-- 
CREATE VIEW v_capaciteSalle AS (
select  cinema.ID_cinema , salle.capacite 
from cinema
inner join salle
on cinema.ID_cinema = salle.ID_cinema
group by cinema.ID_cinema
);
select * from v_capaciteSalle;
--donne l autorisation de supprimer , modifier et de consulter la capacite des salles
GRANT select , update , delete
on TABLE v_capaciteSalle
to user1;


--les triggers --
--mettre en majuscule les villes a chaque fois qu'on insert 
CREATE TRIGGER  OR REPLACE t_cinema before insert on cinema for each row 
set new.ville = upper(new.ville);

--date de seance et date de reservation doivent etre toujours des dates croissante 
create or replace trigger t_reservation before insert on commande for each row
	begin
		select date_reservation , date_seance
		from reservation;
		
		:new.date_reservation := sysdate;
    :new.date_seance := sysdate;

		
	end;
  /
/*verifer q'une date de reservation < date de seance */

create or replace trigger check_date_reservation
before insert on reservation
for each row 
declare
v_date_proj projection.date_projection%type;
begin
select date_projection into v_date_proj 
from projection 
where :new.ID_projection=ID_projection;
 if(:new.date_reservation> v_date_proj)
then
RAISE_APPLICATION_ERROR(-20001,'date res > date projection');
end if;
end; /

/* verifier que le film ne soit pas projeté avant sa date de sortie */
create or replace trigger check_date_sortie
before insert on projection
for each row 
 declare v_date_sor date;
begin 
select date_sortie into v_date_sor 
from film
where :new.ID_film=ID_film;
if(:new.date_projection < v_date_sor)
then
RAISE_APPLICATION_ERROR(-20001,'le film ne peut pas etre projeté avant sa date de sortie');
end if;
end; /

/*verifier que le nombre de reservation <= capacité de la salle qui acceuil la projection*/

create or replace trigger check_disponibilite
before insert on reservation
for each row
declare
nbr number(10);
v_capacite salle.capacite%type;
begin
select count(*) into nbr from reservation where ID_reservation = :new.ID_reservation;
select capacite into v_capacite from salle A
right join projection B
on A.ID_salle = B.ID_salle
right join reservation C
on C.ID_projection=B.ID_projection
where c.ID_reservation = :new.ID_reservation;
if (nbr>v_capacite) 
then
RAISE_APPLICATION_ERROR(-20001,'capacite atteinte');
end if;
end; /
