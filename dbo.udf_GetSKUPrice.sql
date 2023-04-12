CREATE FUNCTION dbo.udf_GetSKUPrice(@ID_SKU INT)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @Cost DECIMAL(18,2);
    DECLARE @SumQuantity INT;
    DECLARE @SumValue DECIMAL(18, 2);
    SELECT @SumQuantity = SUM(Quantity),
    @SumValue = SUM(Value)
    FROM dbo.Basket
    WHERE ID_SKU = @ID_SKU;
    IF @SumQuantity > 0
    SET @Cost = @SumValue / @SumQuantity
    ELSE SET @Cost = 0
    RETURN @Cost;
END;