CREATE VIEW dbo.SKUPrice AS
SELECT *, dbo.udf_GETSKUPrice(ID) AS Price
FROM dbo.SKU;