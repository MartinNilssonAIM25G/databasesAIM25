USE [Bokhandel]
GO

CREATE TABLE [Förlag]
(
    [FörlagID] integer IDENTITY (1,1)
        CONSTRAINT PK_Förlag PRIMARY KEY,
    [FörlagNamn] nvarchar(255) NOT NULL,
    [Gatuadress1] nvarchar(255) NOT NULL,
    [Gatuadress2] nvarchar(255),
    [Postnummer] char(5) NOT NULL,
    [Postort] nvarchar(255) NOT NULL,
    [Land] char(2) DEFAULT 'SE',
    [Email] nvarchar(255),
    [Mobilnummer] nvarchar(20)
)
GO

CREATE TABLE [Butiker]
(
    [ButikID] integer IDENTITY(1, 1)
        CONSTRAINT PK_Butiker PRIMARY KEY,
    [Butiksnamn] nvarchar(255) NOT NULL,
    [Gatuadress1] nvarchar(255) NOT NULL,
    [Gatuadress2] nvarchar(255),
    [Postnummer] char(5) NOT NULL,
    [Postort] nvarchar(255) NOT NULL,
    [Land] char(2) DEFAULT 'SE'
)
GO

CREATE TABLE [Författare]
(
    [FörfattareID] integer IDENTITY(1, 1)
        CONSTRAINT PK_Författare PRIMARY KEY,
    [Förnamn] nvarchar(255) NOT NULL,
    [Efternamn] nvarchar(255) NOT NULL,
    [Födelsedatum] date
)
GO

CREATE TABLE [Böcker]
(
    [ISBN13] char(13)
        CONSTRAINT PK_Böcker PRIMARY KEY,
    [Titel] nvarchar(255) NOT NULL,
    [Språk] char(2),
    [Pris] decimal(10,2) NOT NULL
        CONSTRAINT CK_Böcker_Pris
        CHECK(Pris >= 0),
    [Utgivningsdatum] date,
    [Format] nvarchar(50) NOT NULL,
    [FörlagID] integer NOT NULL,

    CONSTRAINT FK_Böcker_Förlag FOREIGN KEY (FörlagID) REFERENCES Förlag (FörlagID)
)
GO

CREATE TABLE [Kunder]
(
    [KundID] integer IDENTITY(1, 1)
        CONSTRAINT PK_Kunder PRIMARY KEY,
    [Förnamn] nvarchar(255) NOT NULL,
    [Efternamn] nvarchar(255) NOT NULL,
    [Gatuadress1] nvarchar(255) NOT NULL,
    [Gatuadress2] nvarchar(255),
    [Postnummer] char(5) NOT NULL,
    [Postort] nvarchar(255) NOT NULL,
    [Land] char(2) DEFAULT 'SE',
    [Email] nvarchar(255) UNIQUE,
    [Mobilnummer] nvarchar(20)
)
GO

CREATE TABLE [BokFörfattare]
(
    [ISBN13] char(13) NOT NULL,
    [FörfattareID] integer NOT NULL,
    CONSTRAINT PK_BokFörfattare PRIMARY KEY (ISBN13, FörfattareID),
    CONSTRAINT FK_BokFörfattare_Böcker FOREIGN KEY (ISBN13) REFERENCES Böcker(ISBN13),
    CONSTRAINT FK_BokFörfattare_Författare FOREIGN KEY (FörfattareID) REFERENCES Författare(FörfattareID)
)
GO

CREATE TABLE [LagerSaldo]
(
    [ButikID] integer NOT NULL,
    [ISBN13] char(13) NOT NULL,
    [Antal] integer NOT NULL
        CONSTRAINT CK_LagerSaldo_Antal CHECK (Antal >= 0),

    CONSTRAINT PK_LagerSaldo PRIMARY KEY (ButikID, ISBN13),
    CONSTRAINT FK_LagerSaldo_Butiker FOREIGN KEY (ButikID) REFERENCES Butiker(ButikID),
    CONSTRAINT FK_LagerSaldo_Böcker FOREIGN KEY (ISBN13) REFERENCES Böcker(ISBN13)
)
GO

CREATE TABLE [Ordrar]
(
    [OrderID] integer IDENTITY(1, 1)
        CONSTRAINT PK_Ordrar PRIMARY KEY,
    [KundID] integer NOT NULL,
    [Orderdatum] date NOT NULL,
    [Status] nvarchar(50) NOT NULL,
    [Förnamn] nvarchar(255) NOT NULL,
    [Efternamn] nvarchar(255) NOT NULL,
    [Gatuadress1] nvarchar(255) NOT NULL,
    [Gatuadress2] nvarchar(255),
    [Postnummer] char(5) NOT NULL,
    [Postort] nvarchar(255) NOT NULL,
    [Land] char(2) DEFAULT 'SE',
    [Email] nvarchar(255),
    [Mobilnummer] nvarchar(20)
)
GO

CREATE TABLE [OrderRader]
(
    [OrderID] integer NOT NULL,
    [ISBN13] char(13) NOT NULL,
    [Antal] integer NOT NULL,
    [Pris] decimal(10,2) NOT NULL
        CONSTRAINT CK_OrderRader_Pris CHECK (Pris >= 0),

    CONSTRAINT PK_OrderRader PRIMARY KEY (OrderID, ISBN13),
    CONSTRAINT FK_OrderRader_Ordrar FOREIGN KEY (OrderID) REFERENCES Ordrar(OrderID),
    CONSTRAINT FK_OrderRader_Böcker FOREIGN KEY (ISBN13) REFERENCES Böcker(ISBN13)
)
GO