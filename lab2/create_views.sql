CREATE VIEW [TitlarPerFörfattare] AS 
SELECT 
    (Förnamn + ' ' + Efternamn) as [Namn], 
     CAST(DATEDIFF(day, Födelsedatum, GETDATE()) / 365.25 AS INT) AS Ålder, 
     COUNT(BokFörfattare.ISBN13) AS [Titlar],
     FORMAT(SUM(LagerSaldo.Antal * Böcker.Pris), '0') + ' kr' AS [Lagervärde]
FROM Författare
     JOIN BokFörfattare ON Författare.FörfattareID = BokFörfattare.FörfattareID
     JOIN Böcker ON BokFörfattare.ISBN13 = Böcker.ISBN13
     JOIN LagerSaldo ON Böcker.ISBN13 = LagerSaldo.ISBN13 
GROUP BY Författare.FörfattareID, Förnamn, Efternamn, Födelsedatum

GO

CREATE VIEW [Toppkunder] AS
SELECT 
    KundID AS [Kund],
    COUNT(DISTINCT Ordrar.OrderID) AS [Antal Ordrar],
    SUM(OrderRader.Antal * OrderRader.Pris) AS [Totalbelopp]
FROM Kunder
    JOIN Ordrar ON Kunder.KundID = Ordrar.KundID
    JOIN OrderRader ON Ordrar.OrderID = OrderRader.OrderID
GROUP BY Kunder.KundID