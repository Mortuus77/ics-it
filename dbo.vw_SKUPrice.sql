CREATE VIEW dbo.SKUPrice AS
SELECT *, dbo.udf_GetSKUPrice(ID) AS Price
FROM dbo.SKU;