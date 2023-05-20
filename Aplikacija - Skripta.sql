use master;
create database aplikacija;
use aplikacija;

create table komentar(
	id int not null primary key identity (1,1),
	vrijemekomentiranja datetime null,
	opis varchar(25) not null,
	objava int not null,
	osoba int not null
);
create table svidamise_komentar(
	id int not null primary key identity (1,1),
	osoba int not null,
	komentar int not null
);
create table objava(
	id int not null primary key identity (1,1),
	naslov varchar(50) null,
	upis varchar(250) null,
	vrijemeizrade datetime null,
	ipadresa varchar(20) not null,
	osoba int not null
);
create table osoba(
	id int not null primary key identity (1,1),
	ime varchar(25) null,
	prezime varchar(25) null,
	datumrodenja datetime not null,
	email varchar(50) null,
	lozinka varchar(60) null,
	brojtel int not null,
	slika varchar(100) not null,
	administrator bit null,
	stanje bit null,
	aktivan bit null,
	uniqueid varchar(250) not null
);
create table svidamise(
	id int not null primary key identity (1,1),
	vrijemesvidanja datetime null,
	objava int not null,
	osoba int not null
);

-- veze izme?u tablica

alter table komentar add foreign key (objava) references objava (id);
alter table objava add foreign key (osoba) references osoba (id);
alter table svidamise add foreign key (objava) references objava (id);
alter table svidamise_komentar add foreign key (komentar) references komentar (id);

-- unos u tablicu

insert into osoba (ime,prezime,datumrodenja,email,lozinka,brojtel,slika,administrator,stanje,aktivan,uniqueid)
values ('Marija','Maric','1996-09-23','mmaric@gmail.com','12345678',0995673589,'slika' ,0,0,0,'yes'),
('Branko','Brankic','1998-02-02','brankicb@gmail.com','bbrankic1',0997562234,'slika',0,0,0,'yes'),
('Igor','Igric','2002-07-16','igorigor@gmail.com','iggy123',0997775522,'slika',0,0,0,'yes');

insert into objava (naslov,upis,vrijemeizrade,ipadresa,osoba)
values ('helloworld','hello','2023-04-23 14:32','22347899012',1),
('bok','dobardan','2023-01-16 8:00','33466787129',2),
('hi','welcome','2023-03-17 18:31', '25689912377',3);

insert into komentar (vrijemekomentiranja,opis,objava,osoba)
values('2023-04-23 18:55','hello',1,1),
('2023-02-12 12:23','welcome',2,2),
('2023-03-27 18:00','helloworld',3,3);

insert into svidamise (vrijemesvidanja,objava,osoba)
values ('2023-02-12 19:00',1,1),
('2023-05-12 23:50',2,2),
('2023-02-16 11:43',3,3);

insert into svidamise_komentar (osoba,komentar)
values (3,1),
(2,2),
(3,2);

-- update tablice

update osoba set prezime='Brankovic'
where id=2;

update osoba set ime='Marina'
where id=1;

update objava set upis='backend'
where id=2;

-- delete tablice

delete from osoba where id=1;

delete from komentar where id=2;

delete from komentar where id=3;
