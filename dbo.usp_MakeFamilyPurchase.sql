CREATE PROCEDURE dbo.usp_MakeFamilyPurchase
    @FamilySurName VARCHAR(255)
AS
BEGIN
    DECLARE @FamilyID INT;
    DECLARE @TotalValue DECIMAL(18,2);
    
    SELECT @FamilyID = ID
    FROM dbo.Family
    WHERE SurName = @FamilySurName;
    
    IF @FamilyID IS NULL
    BEGIN
        RAISERROR('Family with SurName %s does not exist', 16, 1, @FamilySurName);
        RETURN;
    END;
    
    SELECT @TotalValue = SUM(Value)
    FROM dbo.Basket
    WHERE ID_Family = @FamilyID;
    
    UPDATE dbo.Family
    SET BudgetValue = BudgetValue - @TotalValue
    WHERE ID = @FamilyID;
END;