use master
go
create database Podcasting;
use Podcasting
create table Users(
User_ID int primary key, --identity (1,1),
First_name nchar(100) NOT NULL, 
Last_name nchar(100) NOT NULL ,
Password char(100) NOT NULL, 
Email char(100) NOT NULL, 
DOB date NOT NULL 
);

create table Channel(
Channel_ID int primary key,-- identity (1,1),
Name nchar(100) NOT NULL, 
Num_of_Audios int DEFAULT 0,
Num_OF_Subcribers int DEFAULT 0, 
User_ID int NOT NULL,
foreign key (User_ID) references Users(User_ID) on delete no action on update no action
);

create table Audio(
Audio_ID int primary key,-- identity (1,1),
Name nchar(100) NOT NULL, 
Views int,
Channel_ID int NOT NULL,
foreign key (Channel_ID) references Channel(Channel_ID) on delete cascade on update cascade
);

create table LIVE(
Start_time datetime NOT NULL,
Audio_ID  int NOT NULL,
primary key(Audio_ID),
foreign key (Audio_ID ) references Audio(Audio_ID) on delete cascade on update cascade
);

create table RECORDED(
duration TIME NOT NULL,
Audio_ID  int NOT NULL,
primary key(Audio_ID),
foreign key (Audio_ID ) references Audio(Audio_ID) on delete cascade on update cascade
);

create table Library(
Library_ID int primary key,-- identity (1,1), 
Number_of_Audios int DEFAULT 0,
User_ID int NOT NULL,
--primary key(Library_ID, User_ID),
foreign key (User_ID) references Users(User_ID) on delete no action on update no action
);

create table Subscribe(
Channel_ID int NOT NULL,
User_ID int,-- NOT NULL
primary key(Channel_ID, User_ID) ,
foreign key (User_ID) references Users(User_ID)  on delete cascade on update cascade,
foreign key (Channel_ID) references Channel(Channel_ID) on delete cascade on update cascade
);

create table Library_has_audio(
Library_ID int NOT NULL,-- primary key,
Audio_ID  int NOT NULL,
primary key(Library_ID, Audio_ID ),
foreign key (Audio_ID) references Audio(Audio_ID) on delete cascade on update cascade,
foreign key (Library_ID) references Library(Library_ID)  on delete cascade on update cascade
);

--insert in Users
insert into Users(User_iD,First_name,Last_name,Password,Email,DOB) 
values (1,'Alaa','Ibrahim','123456','alaa@gmail.com','3-3-1999'),
(2,'Alaa','Shabaan','00000000','aLaa11@gmail.com','6-2-2000'),
(3,'Salma','Ali','11223344','salma@gmail.com','6-6-1999'),
(4,'Nahla','Mustafa','11111111','nahla@gmail.com','1-1-1999');
select * from Users;

-----------------

--insert in Channel
insert into Channel(Channel_ID,Name,User_ID) 
values (1,'alaa channel',1),(2,'salma channel',3);
select * from Channel;

-----------------
--insert in Audio & UPDATE Channel.Num_of_Audios
--each channel has many audios 
insert into Audio(Audio_ID,Name, Views,Channel_ID)
values (1,'lecture1',123,1);
UPDATE Channel 
set Num_of_Audios=Num_of_Audios+1
WHERE Channel_ID=1;
--
insert into Audio(Audio_ID,Name, Views,Channel_ID)
values(2,'2nd_lecture',44,1);
UPDATE Channel 
set Num_of_Audios=Num_of_Audios+1
WHERE Channel_ID=1;
--
insert into Audio(Audio_ID,Name, Views,Channel_ID)
values(3,'3rd_lecture',90,2);
UPDATE Channel 
set Num_of_Audios=Num_of_Audios+1
WHERE Channel_ID=2;
--
select *from Channel;
select *from Audio;
-----------------------------------------------

--insert in RECORDED & LIVE 
insert into RECORDED(Audio_ID,duration)
values(1,'1:12:23'),(2,'1:20:30');
insert into LIVE(Audio_ID,Start_time)
values(3,'2021-01-01 12:12:20');
select * from Audio;
select * from RECORDED;
select * from LIVE;

----------------------

--insert in Subscribe and update Channel.Num_OF_Subcribers
insert into Subscribe(Channel_ID,User_ID)
values (1,1);
UPDATE Channel 
set Num_OF_Subcribers=Num_OF_Subcribers+1
WHERE Channel_ID=1;
insert into Subscribe(Channel_ID,User_ID)
values (1,2);
UPDATE Channel 
set Num_OF_Subcribers=Num_OF_Subcribers+1
WHERE Channel_ID=1;
insert into Subscribe(Channel_ID,User_ID)
values (1,3);
UPDATE Channel 
set Num_OF_Subcribers=Num_OF_Subcribers+1
WHERE Channel_ID=1;
insert into Subscribe(Channel_ID,User_ID)
values (2,2);
UPDATE Channel 
set Num_OF_Subcribers=Num_OF_Subcribers+1
WHERE Channel_ID=2;
insert into Subscribe(Channel_ID,User_ID)
values (2,3);
UPDATE Channel 
set Num_OF_Subcribers=Num_OF_Subcribers+1
WHERE Channel_ID=2;
select *from Subscribe;
select *from Channel;
--------------------------------------


--insert in Library
insert into Library (Library_ID,User_ID)
values (1,3),(2,1),(3,2),(4,4);
select * from Library;

-----------------------

--insert in Library_has_audio & update Library.Number_of_Audios
--1
insert into Library_has_audio(Library_ID,Audio_ID)
values (1,1);
UPDATE Library
set Number_of_Audios=Number_of_Audios+1
WHERE Library_ID=1;
--2
insert into Library_has_audio(Library_ID,Audio_ID)
values (1,2);
UPDATE Library
set Number_of_Audios=Number_of_Audios+1
WHERE Library_ID=1;
--3
insert into Library_has_audio(Library_ID,Audio_ID)
values (1,3);
UPDATE Library
set Number_of_Audios=Number_of_Audios+1
WHERE Library_ID=1;
--4
insert into Library_has_audio(Library_ID,Audio_ID)
values (2,1);
UPDATE Library
set Number_of_Audios=Number_of_Audios+1
WHERE Library_ID=2;
--5
insert into Library_has_audio(Library_ID,Audio_ID)
values (2,2);
UPDATE Library
set Number_of_Audios=Number_of_Audios+1
WHERE Library_ID=2;
--6
insert into Library_has_audio(Library_ID,Audio_ID)
values (3,1);
UPDATE Library
set Number_of_Audios=Number_of_Audios+1
WHERE Library_ID=3;
--7
insert into Library_has_audio(Library_ID,Audio_ID)
values (3,2);
UPDATE Library
set Number_of_Audios=Number_of_Audios+1
WHERE Library_ID=3;
--8
insert into Library_has_audio(Library_ID,Audio_ID)
values (3,3);
UPDATE Library
set Number_of_Audios=Number_of_Audios+1
WHERE Library_ID=3;
--9
insert into Library_has_audio(Library_ID,Audio_ID)
values (4,2)
UPDATE Library
set Number_of_Audios=Number_of_Audios+1
WHERE Library_ID=4;
--------------------
select *from Library_has_audio;
select *from Library;


---------------------

---select from Live where 
select *from LIVE;
SELECT Start_time from  LIVE
where Audio_ID=3 ;


---select duration from recorded where
SELECT duration from  RECORDED
where Audio_ID=1;


-- get no_of_subscriptions
SELECT *FROM Subscribe;
select Subscribe.User_ID, count(Subscribe.Channel_ID)  as Number_of_Subscriptions from Subscribe
join Users 
on Subscribe.User_ID=Users.User_ID
group by Subscribe.User_ID;

--------------------
-- UPDATE Users.password where 
UPDATE Users 
SET Password ='88888888'
WHERE First_name='Nahla';
select *from Users;


--delete an audio from Library_has_audio , then Update Library.Number_of_Audios ,select from both tables

DELETE FROM Library_has_audio
WHERE Audio_ID=1 AND  Library_ID=3

UPDATE Library
set Number_of_Audios=Number_of_Audios-1
WHERE Library_ID=3;

select * from Library_has_audio;
select * from Library;


--update channel_id of 1 -> channel_id of 3 , then view related tables
update Channel
set Channel_ID=3
where Channel_ID=1;
select *from Channel;
select *from Subscribe;
select *from Audio;


--update Library_id of 3 ->  Library_id of 5 , then view related tables
update  Library
set Library_ID=5
WHERE Library_ID=3;
select * from Library;
select * from Library_has_audio;



--delete Library_id of 5,then view related tables
DELETE FROM Library
WHERE Library_ID=5;
select * from Library_has_audio;
select * from Library;

--delete channel_id of 3 , then view related tables
DELETE FROM Channel
WHERE Channel_ID=3;
select *from Channel;
select *from Subscribe;
select *from Audio;




