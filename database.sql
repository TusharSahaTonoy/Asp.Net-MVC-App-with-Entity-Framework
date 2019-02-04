create database Inventory2DB
go
use Inventory2DB
go
create table Suppliers(
	SupplierId int primary key identity,
	SupplierName nvarchar(50),
	CellNo nvarchar(15),
	[Address] nvarchar(100),
	AddedBy nvarchar(50),
	IsActive nvarchar(5)
)
create table Stock(
	ProductId int primary key identity(100,1),
	ProductName nvarchar(80) not null,
	Quantity int,
	UnitPrice money,
	ImageUrl nvarchar(100),
	AddedBy nvarchar(50),
	IsActive nvarchar(5)
)
create table Purchase(
	Id int primary key identity,
	PurchaseDate date,
	ProductId int foreign key references Stock(ProductId),
	Quantity int,
	UnitPrice money,	
	Total money,
	SupplierId int foreign key references Suppliers(SupplierId),
	AddedBy nvarchar(50)
)
create table [User](
	UserId int primary key identity,
	UserName nvarchar(50),
	[Password] nvarchar(max),
	AddedBy nvarchar(50),
	IsActive nvarchar(5)
)
create table Employee(
	EmployeeId int primary key identity,
	EmployeeName nvarchar(50),
	Email nvarchar(50),
	CellNo nvarchar(15),
	[Address] nvarchar(80),
	Salary money,
	RoleName nvarchar(50),
	UserId int foreign key references [User](UserId),
	IsActive nvarchar(5)
)

Create table Customers(
	CustomerId int primary key identity,
	CustomerName nvarchar(50),
	[Address] nvarchar(80),
	CellNo nvarchar(15),
	AddedBy nvarchar(50)
)
create table Orders(
	OrderId int primary key identity,
	OrderDate date,
	ProductId int foreign key references Stock(ProductId),
	CustomerId int foreign key references Customers(CustomerId),
	Quantity int,
	UnitPrice money,
	TotalPrice money,
	AddedBy nvarchar(50)
)
