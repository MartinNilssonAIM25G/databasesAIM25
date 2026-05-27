USE [Bokhandel]
GO

INSERT INTO Butiker
    (Butiksnamn, Gatuadress1, Postnummer, Postort)
VALUES
    ('Andra sidan stan', 'Utbyvägen 16', '41574', 'Göteborg'),
    ('Bokhandel Nifelheim', 'Sturegatan 2', '79160', 'Falun'),
    ('Mitt i stan', 'Kolgruvegatan 6', '41707', 'Göteborg'),
    ('Stadens Bokhandel', 'Kocksgatan 1', '11632', 'Stockholm')

GO

INSERT INTO Förlag
    (FörlagNamn, Gatuadress1, Postnummer, Postort, Email, Mobilnummer)
VALUES
    ('Bästa Förlaget', 'Kaveldunsvägen 1', '43540', 'Mölnlycke', 'Bastaforlaget@gmail.com', '0700998877'),
    ('Inte lika bra Förlaget', 'Hantverkaregatan 32', '23234', 'Arlöv', 'intelikabra@gmail.com', '0701223344'),
    ('Riktigt dåligt Förlag', 'Sagavägen 6', '18132', 'Lidingö', 'dåligaförlaget@gmail.com', '0702556677')

GO

INSERT INTO Författare
    (Förnamn, Efternamn, Födelsedatum)
VALUES
    ('Alaric', 'Stormveil', '1953-06-18'),
    ('Elowen', 'Thorne', '1988-01-13'),
    ('Cassian', 'Virex', '1973-12-18'),
    ('Nova', 'Calder', '1992-02-28'),
    ('Henrik', 'Dahlgren', '1983-04-02'),
    ('Sara', 'Lindqvist', '2006-09-27')

GO

INSERT INTO Böcker
    (ISBN13, Titel, Språk, Pris, Utgivningsdatum, Format, FörlagID)
VALUES
    ('9781839214573', 'The Shattered Crown', 'en', 149.00, '2021-03-15', 'Pocket', 1),
    ('9781839214627', 'Veil of Ashes', 'en', 159.00, '2022-01-10', 'Pocket', 1),
    ('9781839214894', 'Stormbound Oath', 'en', 269.00, '2024-08-01', 'Inbunden', 1),
    ('9781742103316', 'Whispers of the Elderwood', 'en', 299.00, '2019-03-01', 'Inbunden', 1),
    ('9781742103583', 'The Hollow Queen', 'en', 216.00, '2020-06-01', 'Inbunden', 1),
    ('9781742103996', 'Roots of the Forgotten', 'en', 112.00, '2012-01-01', 'Pocket', 1),
    ('9781591047723', 'Neon Orbit', 'en', 179.00, '2019-09-12', 'Inbunden', 2),
    ('9781591047990', 'The Last Transmission', 'en', 189.00, '2021-02-05', 'Inbunden', 2),
    ('9781591048454', 'Void Protocol', 'en', 199.00, '2025-06-01', 'Inbunden', 2),
    ('9781662335100', 'Echoes of Titan', 'en', 169.00, '2020-01-28', 'Inbunden', 2),
    ('9781662335483', 'Synthetic Dawn', 'en', 179.00, '2022-06-14', 'Inbunden', 2),
    ('9781662335995', 'Fragments of Tomorrow', 'en', 189.00, '2024-09-09', 'Inbunden', 2),
    ('9789188231452', 'Skuggan i Snön', 'sv', 99.00, '2018-10-11', 'Pocket', 3),
    ('9789188231780', 'Den Tysta Gatan', 'sv', 99.00, '2020-03-19', 'Pocket', 3),
    ('9789188231995', 'Blodspår', 'sv', 99.00, '2023-01-07', 'Pocket', 3),
    ('9789179013321', 'Flickan vid Sjön', 'sv', 79.00, '2019-07-25', 'ljudbok', 3),
    ('9789179013659', 'Ingen Ser Dig', 'sv', 50.00, '2021-09-02', 'ljudbok', 3),
    ('9789179014021', 'Sista Vittnet', 'sv', 125.00, '2024-02-14', 'e-bok', 3)
GO

INSERT INTO Kunder
    (Förnamn, Efternamn, Gatuadress1, Postnummer, Postort, Email, Mobilnummer)
Values
    ('Albin', 'Kjellmark', 'Granitvägen 12', '41763', 'Göteborg', 'albin.kjellmark@fiktivmail.se', '0701234567'),
    ('Maja', 'Lindros', 'Skogsstigen 5B', '90342', 'Umeå', 'maja.lindros@fiktivmail.se', '0722345678'),
    ('Oskar', 'Vendel', 'Hamngatan 21', '11245', 'Stockholm', 'oskar.vendel@fiktivmail.se', '0733456789'),
    ('Elin', 'Falkryd', 'Ängsvägen 8', '22229', 'Lund', 'elin.falkryd@fiktivmail.se', '0764567890'),
    ('Noah', 'Strandell', 'Bergsgatan 3', '55317', 'Jönköping', 'noah.strandell@fiktivmail.se', '0795678901')

GO

INSERT INTO BokFörfattare
    (ISBN13, FörfattareID)
VALUES
    ('9781591047723', 1),
    ('9781591047990', 1),
    ('9781591048454', 1),
    ('9781662335100', 2),
    ('9781662335483', 2),
    ('9781662335995', 2),
    ('9781742103316', 3),
    ('9781742103583', 3),
    ('9781742103996', 3),
    ('9781839214573', 4),
    ('9781839214627', 4),
    ('9781839214894', 4),
    ('9789179013321', 5),
    ('9789179013659', 5),
    ('9789179014021', 5),
    ('9789188231452', 6),
    ('9789188231780', 6),
    ('9789188231995', 6)

INSERT INTO LagerSaldo
    (ButikID, ISBN13, Antal)
VALUES
    (1, '9781839214573', 3),
    (1, '9781839214627', 0),
    (1, '9781839214894', 2),
    (1, '9781742103316', 5),
    (1, '9781742103583', 1),
    (1, '9781742103996', 0),
    (1, '9781591047723', 4),
    (1, '9781591047990', 2),
    (1, '9781591048454', 0),
    (1, '9781662335100', 3),
    (1, '9781662335483', 1),
    (1, '9781662335995', 5),
    (1, '9789188231452', 0),
    (1, '9789188231780', 2),
    (1, '9789188231995', 4),
    (1, '9789179013321', 1),
    (1, '9789179013659', 0),
    (1, '9789179014021', 3),

    (2, '9781839214573', 0),
    (2, '9781839214627', 4),
    (2, '9781839214894', 1),
    (2, '9781742103316', 0),
    (2, '9781742103583', 3),
    (2, '9781742103996', 2),
    (2, '9781591047723', 0),
    (2, '9781591047990', 5),
    (2, '9781591048454', 3),
    (2, '9781662335100', 1),
    (2, '9781662335483', 0),
    (2, '9781662335995', 2),
    (2, '9789188231452', 4),
    (2, '9789188231780', 0),
    (2, '9789188231995', 1),
    (2, '9789179013321', 3),
    (2, '9789179013659', 5),
    (2, '9789179014021', 0),

    (3, '9781839214573', 2),
    (3, '9781839214627', 1),
    (3, '9781839214894', 0),
    (3, '9781742103316', 3),
    (3, '9781742103583', 0),
    (3, '9781742103996', 4),
    (3, '9781591047723', 2),
    (3, '9781591047990', 0),
    (3, '9781591048454', 1),
    (3, '9781662335100', 5),
    (3, '9781662335483', 3),
    (3, '9781662335995', 0),
    (3, '9789188231452', 2),
    (3, '9789188231780', 4),
    (3, '9789188231995', 0),
    (3, '9789179013321', 1),
    (3, '9789179013659', 2),
    (3, '9789179014021', 5),

    (4, '9781839214573', 1),
    (4, '9781839214627', 3),
    (4, '9781839214894', 5),
    (4, '9781742103316', 0),
    (4, '9781742103583', 2),
    (4, '9781742103996', 1),
    (4, '9781591047723', 0),
    (4, '9781591047990', 3),
    (4, '9781591048454', 4),
    (4, '9781662335100', 0),
    (4, '9781662335483', 2),
    (4, '9781662335995', 1),
    (4, '9789188231452', 3),
    (4, '9789188231780', 0),
    (4, '9789188231995', 5),
    (4, '9789179013321', 2),
    (4, '9789179013659', 0),
    (4, '9789179014021', 1)

INSERT INTO Ordrar
    (KundID, Orderdatum, Status, Förnamn, Efternamn, Gatuadress1, Gatuadress2, Postnummer, Postort, Land, Email, Mobilnummer)
VALUES
    (1, '2024-01-15', 'Levererad', 'Albin', 'Kjellmark', 'Granitvägen 12', NULL, '41763', 'Göteborg', 'SE', 'albin.kjellmark@fiktivmail.se', '0701234567'),
    (2, '2024-02-03', 'Levererad', 'Maja', 'Lindros', 'Skogsstigen 5B', NULL, '90342', 'Umeå', 'SE', 'maja.lindros@fiktivmail.se', '0722345678'),
    (3, '2024-03-22', 'Skickad', 'Oskar', 'Vendel', 'Hamngatan 21', NULL, '11245', 'Stockholm', 'SE', 'oskar.vendel@fiktivmail.se', '0733456789'),
    (4, '2024-04-10', 'Skickad', 'Elin', 'Falkryd', 'Ängsvägen 8', NULL, '22229', 'Lund', 'SE', 'elin.falkryd@fiktivmail.se', '0764567890'),
    (5, '2024-05-18', 'Betald', 'Noah', 'Strandell', 'Bergsgatan 3', NULL, '55317', 'Jönköping', 'SE', 'noah.strandell@fiktivmail.se', '0795678901'),
    (1, '2024-06-07', 'Betald', 'Albin', 'Kjellmark', 'Granitvägen 12', NULL, '41763', 'Göteborg', 'SE', 'albin.kjellmark@fiktivmail.se', '0701234567'),
    (3, '2024-07-14', 'Lagd', 'Oskar', 'Vendel', 'Hamngatan 21', NULL, '11245', 'Stockholm', 'SE', 'oskar.vendel@fiktivmail.se', '0733456789'),
    (2, '2024-08-29', 'Levererad', 'Maja', 'Lindros', 'Skogsstigen 5B', NULL, '90342', 'Umeå', 'SE', 'maja.lindros@fiktivmail.se', '0722345678'),
    (5, '2024-09-11', 'Lagd', 'Noah', 'Strandell', 'Bergsgatan 3', NULL, '55317', 'Jönköping', 'SE', 'noah.strandell@fiktivmail.se', '0795678901'),
    (4, '2024-10-30', 'Lagd', 'Elin', 'Falkryd', 'Ängsvägen 8', NULL, '22229', 'Lund', 'SE', 'elin.falkryd@fiktivmail.se', '0764567890'),
    (1, '2024-11-05', 'Levererad', 'Albin', 'Kjellmark', 'Granitvägen 12', NULL, '41763', 'Göteborg', 'SE', 'albin.kjellmark@fiktivmail.se', '0701234567'),
    (2, '2024-11-12', 'Levererad', 'Maja', 'Lindros', 'Skogsstigen 5B', NULL, '90342', 'Umeå', 'SE', 'maja.lindros@fiktivmail.se', '0722345678'),
    (3, '2024-11-18', 'Levererad', 'Oskar', 'Vendel', 'Hamngatan 21', NULL, '11245', 'Stockholm', 'SE', 'oskar.vendel@fiktivmail.se', '0733456789'),
    (4, '2024-11-25', 'Skickad', 'Elin', 'Falkryd', 'Ängsvägen 8', NULL, '22229', 'Lund', 'SE', 'elin.falkryd@fiktivmail.se', '0764567890'),
    (5, '2024-12-01', 'Skickad', 'Noah', 'Strandell', 'Bergsgatan 3', NULL, '55317', 'Jönköping', 'SE', 'noah.strandell@fiktivmail.se', '0795678901'),
    (2, '2024-12-08', 'Betald', 'Maja', 'Lindros', 'Skogsstigen 5B', NULL, '90342', 'Umeå', 'SE', 'maja.lindros@fiktivmail.se', '0722345678'),
    (1, '2024-12-14', 'Betald', 'Albin', 'Kjellmark', 'Granitvägen 12', NULL, '41763', 'Göteborg', 'SE', 'albin.kjellmark@fiktivmail.se', '0701234567'),
    (5, '2025-01-03', 'Levererad', 'Noah', 'Strandell', 'Bergsgatan 3', NULL, '55317', 'Jönköping', 'SE', 'noah.strandell@fiktivmail.se', '0795678901'),
    (3, '2025-01-15', 'Lagd', 'Oskar', 'Vendel', 'Hamngatan 21', NULL, '11245', 'Stockholm', 'SE', 'oskar.vendel@fiktivmail.se', '0733456789'),
    (4, '2025-02-01', 'Lagd', 'Elin', 'Falkryd', 'Ängsvägen 8', NULL, '22229', 'Lund', 'SE', 'elin.falkryd@fiktivmail.se', '0764567890'),
    (1, '2025-02-10', 'Levererad', 'Albin', 'Kjellmark', 'Granitvägen 12', NULL, '41763', 'Göteborg', 'SE', 'albin.kjellmark@fiktivmail.se', '0701234567'),
    (1, '2025-03-05', 'Levererad', 'Albin', 'Kjellmark', 'Granitvägen 12', NULL, '41763', 'Göteborg', 'SE', 'albin.kjellmark@fiktivmail.se', '0701234567'),
    (2, '2025-03-12', 'Skickad', 'Maja', 'Lindros', 'Skogsstigen 5B', NULL, '90342', 'Umeå', 'SE', 'maja.lindros@fiktivmail.se', '0722345678'),
    (2, '2025-04-01', 'Betald', 'Maja', 'Lindros', 'Skogsstigen 5B', NULL, '90342', 'Umeå', 'SE', 'maja.lindros@fiktivmail.se', '0722345678')
GO

INSERT INTO OrderRader
    (OrderID, ISBN13, Antal, Pris)
VALUES
    (1, '9781839214573', 1, 149.00),
    (1, '9781742103316', 2, 299.00),
    (2, '9781591047723', 1, 179.00),
    (2, '9789188231452', 1, 99.00),
    (2, '9789179013321', 1, 79.00),
    (3, '9781839214894', 1, 269.00),
    (3, '9781662335100', 2, 169.00),
    (4, '9789188231780', 1, 99.00),
    (4, '9781591047990', 1, 189.00),
    (4, '9781742103583', 1, 216.00),
    (5, '9781662335483', 2, 179.00),
    (6, '9789179013659', 1, 50.00),
    (6, '9781839214627', 1, 159.00),
    (7, '9781591048454', 1, 199.00),
    (7, '9781662335995', 1, 189.00),
    (7, '9789188231995', 2, 99.00),
    (8, '9781742103996', 1, 112.00),
    (8, '9789179014021', 1, 125.00),
    (9, '9781839214573', 1, 149.00),
    (9, '9781662335100', 1, 169.00),
    (10, '9789188231452', 2, 99.00),
    (10, '9781591047723', 1, 179.00),
    (11, '9781591047723', 1, 179.00),
    (11, '9789188231995', 2, 99.00),
    (11, '9781662335995', 1, 189.00),
    (12, '9781839214894', 1, 269.00),
    (12, '9781742103996', 2, 112.00),
    (13, '9789179014021', 1, 125.00),
    (13, '9781591048454', 1, 199.00),
    (13, '9781662335483', 1, 179.00),
    (14, '9789188231452', 3, 99.00),
    (14, '9781839214627', 1, 159.00),
    (15, '9781742103583', 2, 216.00),
    (15, '9789179013659', 1, 50.00),
    (16, '9781662335100', 1, 169.00),
    (16, '9781839214573', 2, 149.00),
    (16, '9789188231780', 1, 99.00),
    (17, '9781591047990', 1, 189.00),
    (17, '9781742103316', 1, 299.00),
    (18, '9789179013321', 2, 79.00),
    (18, '9781662335995', 1, 189.00),
    (19, '9781839214894', 1, 269.00),
    (19, '9789188231995', 1, 99.00),
    (20, '9781591047723', 2, 179.00),
    (20, '9781742103996', 1, 112.00),
    (20, '9789179014021', 1, 125.00),
    (21, '9781839214573', 2, 149.00),
    (21, '9781591047723', 1, 179.00),
    (21, '9789188231452', 3, 99.00),
    (22, '9781742103316', 1, 299.00),
    (22, '9781662335995', 2, 189.00),
    (22, '9789179014021', 1, 125.00),
    (23, '9781839214894', 1, 269.00),
    (23, '9789188231995', 2, 99.00),
    (24, '9781591048454', 1, 199.00),
    (24, '9781742103583', 2, 216.00),
    (24, '9789179013659', 1, 50.00)