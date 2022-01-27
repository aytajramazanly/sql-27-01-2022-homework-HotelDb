--create database HotelDb
--use HotelDb

--create table Customers(
--Id int primary key identity,
--Fullname nvarchar(80),
--Age int check(Age>=18),
--PhoneNumber nvarchar(40)
--)

--create table RoomTypes(
--Id int primary key identity,
--RoomTypeName nvarchar(40),
--)

--alter table RoomTypes
--add Price int 

--create table RoomStatuses(
--Id int primary key identity,
--Status nvarchar(40),
--)

--create table ServiceTypes(
--Id int primary key identity,
--ServiceTypeName nvarchar(40),
--)
--create table Rooms(
--Id int primary key identity,
--RoomNumber nvarchar(20),
--RoomTypeId int references RoomTypes(Id)
--)

--create table Reservations(
--Id int primary key identity,
--InDate date,
--OutDate date,
--RoomId int references Rooms(Id),
--CustomerId int references Customers(Id),
--StatusId int references RoomStatuses(Id)
--)

--create table ServiceCharges(
--Id int primary key identity,
--Amount decimal (10,2),
--TypeId int references ServiceTypes(Id),
--ReservationId int references Reservations(Id)
--)

--create table PaymentMethods(
--Id int primary key identity,
--MethodName nvarchar(40)
--)

--create table Payments(
--Id int primary key identity,
--Amount decimal (15,2),
--MethodId int references PaymentMethods(Id),
--ReservationId int references Reservations(Id)
--)


--create table ChangesReservation(
--Id int primary key identity,
--InDate date,
--OutDate date,
--RoomId int references Rooms(Id),
--ReservationId int references Reservations(Id)
--)

--insert into RoomTypes values 
--('Single Standart', 40),
--('Single Lux', 80),
--('Double Standart', 100),
--('Double Lux', 140),
--('Triple Standart', 165),
--('Triple Lux', 190),
--('King',280)

--insert into RoomStatuses values 
--('Occupied'),
--('Reserve'),
--('Vacant')


--insert into ServiceTypes values
--('Mini-Bar'),
--('Game-Zone'),
--('Bar'),
--('Restoran'),
--('Room')

--insert into PaymentMethods values
--('Card'),
--('Cash'),
--('Credit Card')

--insert into Customers values 
--('Aytac Ramazanli',23, '123456'),
--('Ilkin Bayramov',22, '123456'),
--('Aysel Ramazanli',26, '123456'),
--('John Lewit',32, '123456'),
--('Basak Sayar',22, '123456'),
--('Kerem Yaman',21, '123456')

--insert into Rooms values 
--('1101',1),
--('1102',1),
--('1103',2),
--('1104',2),
--('2101',3),
--('2102',3),
--('2103',4),
--('2104',4),
--('3101',5),
--('3102',5),
--('3103',6),
--('3104',6),
--('4101',7),
--('4102',7)

--insert into Reservations values 
--('2022-01-30','2022-02-5',4,1,2),
--('2022-02-15','2022-02-22',6,5,2),
--('2022-03-10','2022-03-14',12,4,2),
--('2022-03-12','2022-03-17',7,3,2),
--('2022-03-15','2022-03-22',8,6,2)

--insert into ServiceCharges values 
--(55.70,3,2),
--(33.50,4,2),
--(15,1,5),
--(125,4,5)

--insert into Payments values 
--(240,1,2),
--(15,2,5)

--update Reservations Set StatusId = 1
--where Id=2

--update Reservations Set StatusId = 1
--where Id=4

--insert into ChangesReservation (RoomId,ReservationId) values
--(5,2)

--create view v_getReservationsInfo
--as
--select rv.Id, Fullname 'Customer', rm.RoomNumber, Price 'PricePerDay', 
--rv.InDate, rv.OutDate,
--p.Amount 'PaymentAmount', pm.MethodName 'PaymentMethod',
--cr.InDate 'ChangeInDate', cr.OutDate 'ChangeOutDate', rmc.RoomNumber 'RoomChange',
--[Status] from Reservations rv

--full join Customers c
--on rv.CustomerId=c.Id

--full join Rooms rm
--on rv.RoomId=rm.Id

--full join RoomTypes rt
--on rm.RoomTypeId=rt.Id

-- join RoomStatuses rs
--on rv.StatusId=rs.Id

--full join Payments p
--ON rv.Id=p.ReservationId

--left join PaymentMethods pm
--on p.MethodId=pm.Id

--left join ChangesReserVation cr
--on rv.Id=cr.ReservationId

--left join Rooms rmc
--on cr.RoomId=rmc.Id


--select * from v_getReservationsInfo










