CREATE FUNCTION dbo.udf_GetSKUPrice(@ID_SKU INT)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @Cost DECIMAL(18,2);
    SELECT @Cost = SUM(Value) / SUM(Quantity)
    FROM dbo.Basket
    WHERE ID_SKU = @ID_SKU;
    RETURN @Cost;
END;