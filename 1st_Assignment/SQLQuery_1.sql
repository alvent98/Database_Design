/*create DATABASE HellasCamp;*/
Use HellasCamp;
create table Camp
(
    campId tinyInt Identity(1,1) UNIQUE not null,
    campName CHAR(40) not null,
    capacity SMALLINT default 0
        CONSTRAINT cap CHECK(capacity >=0),
    PRIMARY KEY (campId)
);

create table Category
(
    categoryId char(1) UNIQUE not null,
    area real not null,
        CONSTRAINT are CHECK(area >=0),
    cost real not null
        CONSTRAINT co CHECK(cost >=0),
    PRIMARY KEY (categoryId)
);

create table Customer
(
    customerId int Identity(1,1) UNIQUE not null,
    customerName char(30) not null,
    surname char(30) not null,
    phone char(30) not null,
    PRIMARY KEY (customerId)
);

create table PaymentWay
(
    paymentWayId tinyint Identity(1,1) UNIQUE not null,
    wayName char(30) not null,
    PRIMARY KEY (paymentWayId)
);

create table Employee
(
    employeeId smallint Identity(1,1) UNIQUE not null,
    employeeName char(30) not null,
    surname char(30) not null,
    PRIMARY KEY (employeeId)
);


CREATE TABLE Position
(
    positionId smallint Identity(1,1) not null,
    campId tinyInt not null,
    categoryId char(1) not null,
    PRIMARY KEY (positionId,campId),
    FOREIGN KEY (campId) 
        REFERENCES Camp(campId)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (categoryId) 
        REFERENCES Category(categoryId)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);

CREATE TABLE Reservation
(
    reservationId int Identity(1,1) unique not null,
    reservationDate date not null,
    paymentWayId tinyint not null,
    employeeId smallint not null,
    customerId int not null,
    PRIMARY KEY (reservationId),
    FOREIGN KEY (paymentWayId)
        REFERENCES PaymentWay(paymentWayId)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (employeeId) 
        REFERENCES Employee(employeeId)
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    FOREIGN KEY (customerId) 
        REFERENCES Customer(customerId)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Position_Reservation
(
    reservationId int not null,
    positionId smallint not null,
    campId tinyInt not null,
    startDate date not null,
    endDate date not null,
    persons TINYINT not NULL default 1
        CONSTRAINT per CHECK(persons >0),
    PRIMARY KEY (reservationId,positionId,campId),
    FOREIGN KEY (positionId,campId) 
        REFERENCES Position(positionId,campId)
        ON DELETE cascade
        ON UPDATE CASCADE,
    FOREIGN KEY (reservationId)
        REFERENCES Reservation(reservationId)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

