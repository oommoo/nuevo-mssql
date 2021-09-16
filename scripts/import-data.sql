DECLARE @jsonVariable nvarchar(max);

SELECT @jsonVariable = bulkColumn
FROM OPENROWSET (BULK '/opt/nuevo-mssql/data/Soldiers.json') as j;

SELECT *
FROM OPENJSON(@jsonVariable)
WITH
(
    id int '$.data.id',
    guild nvarchar5(255) '$.data.name',
    member_count int '$.data.member_count',
    profile_count int '$data.profile_count',
    ranking int '$data.rank',
    gp bigint '$.data.galactic_power'
) as json

