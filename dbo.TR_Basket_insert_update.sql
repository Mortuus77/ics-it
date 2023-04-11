CREATE TRIGGER dbo.TR_Basket_insert_update
ON dbo.Basket
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ID_SKU INT;
    DECLARE @Count INT;

    SELECT @ID_SKU = ID_SKU, @Count = COUNT(*) 
    FROM inserted
    GROUP BY ID_SKU
    HAVING COUNT(*) >= 2;

    IF (@Count >= 2)
    BEGIN
        UPDATE dbo.Basket
        SET DiscountValue = Value * 0.05
        WHERE ID_SKU = @ID_SKU;
    END
    ELSE
    BEGIN
        UPDATE dbo.Basket
        SET DiscountValue = 0
        WHERE ID_SKU IN (SELECT ID_SKU FROM inserted);
    END
END