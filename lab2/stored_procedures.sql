CREATE PROCEDURE FlyttaBok
    @FrånButikID int,
    @TillButikID int,
    @ISBN char(13),
    @Antal int = 1
AS
BEGIN

    -- Validering
    IF NOT EXISTS (SELECT 1
    FROM Butiker
    WHERE ButikID = @FrånButikID)
        THROW 50001, 'Källbutiken finns inte.', 1;

    IF NOT EXISTS (SELECT 1
    FROM Butiker
    WHERE ButikID = @TillButikID)
        THROW 50002, 'Målbutiken finns inte.', 1;

    IF NOT EXISTS (SELECT 1
    FROM Böcker
    WHERE ISBN13 = @ISBN)
        THROW 50003, 'Boken finns inte.', 1;

    IF @Antal <= 0
        THROW 50004, 'Antal måste vara större än 0.', 1;


    DECLARE @NuvarandeAntal int;

    SELECT @NuvarandeAntal = Antal
    FROM LagerSaldo
    WHERE ButikID = @FrånButikID
        AND ISBN13 = @ISBN;

    IF @NuvarandeAntal IS NULL
        THROW 50005, 'Finns inte i källbutiken.', 1;

    IF @NuvarandeAntal < @Antal
        THROW 50006, 'För få exemplar i lager.', 1;


    -- Transaktion
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE LagerSaldo
        SET Antal = Antal - @Antal
        WHERE ButikID = @FrånButikID
        AND ISBN13 = @ISBN;

        IF EXISTS (
            SELECT 1
    FROM LagerSaldo
    WHERE ButikID = @TillButikID
        AND ISBN13 = @ISBN
        )
        BEGIN
        UPDATE LagerSaldo
            SET Antal = Antal + @Antal
            WHERE ButikID = @TillButikID
            AND ISBN13 = @ISBN;
    END
        ELSE
        BEGIN
        INSERT INTO LagerSaldo
            (ButikID, ISBN13, Antal)
        VALUES
            (@TillButikID, @ISBN, @Antal);
    END

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;

        THROW;
    END CATCH

END