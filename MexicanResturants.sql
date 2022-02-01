--I will start by familiarizing myself with the data inclued in this table.

Select *
FROM dbo.['just tacos and burritos$']

--Check for null values in city column

SELECT 
city
FROM 
dbo.['just tacos and burritos$']
WHERE city is NULL

--Check which countries included in dataset(only US)

SELECT DISTINCT
country
FROM 
dbo.['just tacos and burritos$']

--Duplicate postalCode column so the duplicate column can be converted into state name using the postalcodes

ALTER TABLE dbo.['just tacos and burritos$']
ADD State varchar(255);

UPDATE dbo.['just tacos and burritos$']
SET State = postalCode

-- Convert state postalcode into state name so we can count number of resturants selling tacos and burritos in each state.

SELECT state
FROM dbo.['just tacos and burritos$']
WHERE State BETWEEN 99501 and 99950;

Update dbo.['just tacos and burritos$']
SET State = 'AK'
WHERE State BETWEEN 99501 and 99950;


SELECT state
FROM dbo.['just tacos and burritos$']
WHERE State BETWEEN 80001 and 81658;

Update dbo.JustTacosAndBurritos
SET State = 'CO'
WHERE State BETWEEN 80001 and 81658;

-- After the first converstion for Alaska I was unable to do the next conversion due to a varchar error.
--to fix this I reset the data by downloading the original file and instead of duplicating the postalcode 
--I converted the province into a state column using the postalcode.

Select Distinct province
FROM [Mexican-Food].[dbo].['just tacos and burritos$']


--Change provinces into State abreviations 

-------------------------------------------------------------------------------------------------
Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'AK'
WHERE postalCode BETWEEN 99501 and 99950;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'AL'
WHERE postalCode BETWEEN 35004 and 36925;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'AR'
WHERE postalCode BETWEEN 71601 and 72959;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'AR'
WHERE postalCode = 75502 

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'AZ'
WHERE postalCode BETWEEN 85001 and 86556;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'CA'
WHERE postalCode BETWEEN 90001 and 96162;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'CO'
WHERE postalCode BETWEEN 80001 and 81658;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'CT'
WHERE postalCode BETWEEN 6001 and 6389;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'CT'
WHERE postalCode BETWEEN 6401 and 6928;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'DC'
WHERE postalCode BETWEEN 20001 and 20039;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'DC'
WHERE postalCode BETWEEN 20042 and 20599;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'DC'
WHERE postalCode = 20799 

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'DE'
WHERE postalCode BETWEEN 19701 and 19980;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'FL'
WHERE postalCode BETWEEN 32004 and 34997;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'GA'
WHERE postalCode BETWEEN 30001 and 31999;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'GA'
WHERE postalCode = 39901 

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'HI'
WHERE postalCode BETWEEN 96701 and 96898;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'IA'
WHERE postalCode BETWEEN 50001 and 52809;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'IA'
WHERE postalCode BETWEEN 68119 and 68120;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'ID'
WHERE postalCode BETWEEN 83201 and 83876;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'IL'
WHERE postalCode BETWEEN 60001 and 62999;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'IN'
WHERE postalCode BETWEEN 46001 and 47997;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'KS'
WHERE postalCode BETWEEN 66002 and 67954;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'KY'
WHERE postalCode BETWEEN 40003 and 42788;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'LA'
WHERE postalCode BETWEEN 70001 and 71232;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'LA'
WHERE postalCode BETWEEN 71234 and 71497;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'MA'
WHERE postalCode BETWEEN 1001 and 2791;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'MA'
WHERE postalCode BETWEEN 5501 and 5544;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'MD'
WHERE postalCode = 20331

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'MD'
WHERE postalCode BETWEEN 20335 and 20797;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'MD'
WHERE postalCode BETWEEN 20812 and 21930;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'ME'
WHERE postalCode BETWEEN 3901 and 4992;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'MI'
WHERE postalCode BETWEEN 48001 and 49971;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'MN'
WHERE postalCode BETWEEN 55001 and 56763;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'MO'
WHERE postalCode BETWEEN 63001 and 65899;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'MS'
WHERE postalCode BETWEEN 38601 and 39776;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'MS'
WHERE postalCode = 71233 

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'MT'
WHERE postalCode BETWEEN 59001 and 59937;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'NC'
WHERE postalCode BETWEEN 27006 and 28909;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'ND'
WHERE postalCode BETWEEN 58001 and 58856;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'NE'
WHERE postalCode BETWEEN 68001 and 68118;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'NE'
WHERE postalCode BETWEEN 68122 and 69367;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'NH'
WHERE postalCode BETWEEN 3031 and 3897;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'NJ'
WHERE postalCode BETWEEN 7001 and 8989;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'NM'
WHERE postalCode BETWEEN 87001 and 88441;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'NV'
WHERE postalCode BETWEEN 88901 and 89883;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'NY'
WHERE postalCode = 6390

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'NY'
WHERE postalCode BETWEEN 10001 and 14975;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'OH'
WHERE postalCode BETWEEN 43001 and 45999;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'OK'
WHERE postalCode BETWEEN 73001 and 73199;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'OK'
WHERE postalCode BETWEEN 73401 and 74966;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'OR'
WHERE postalCode BETWEEN 97001 and 97920;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'PA'
WHERE postalCode BETWEEN 15001 and 19640;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'PR'
WHERE postalCode = 0

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'RI'
WHERE postalCode BETWEEN 2801 and 2940;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'SC'
WHERE postalCode BETWEEN 29001 and 29948;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'SD'
WHERE postalCode BETWEEN 57001 and 57799;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'TN'
WHERE postalCode BETWEEN 37010 and 38589;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'TX'
WHERE postalCode = 73301 

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'TX'
WHERE postalCode = 75001 

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'TX'
WHERE postalCode BETWEEN 75503 and 79999;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'TX'
WHERE postalCode BETWEEN 88510 and 88589;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'UT'
WHERE postalCode BETWEEN 84001 and 84784;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'VA'
WHERE postalCode BETWEEN 20040 and 20167;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'VA'
WHERE postalCode BETWEEN 22001 and 24658;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'VT'
WHERE postalCode BETWEEN 5001 and 5495;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'VT'
WHERE postalCode BETWEEN 5601 and 5907;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'WA'
WHERE postalCode BETWEEN 98001 and 99403;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'WI'
WHERE postalCode BETWEEN 53001 and 54990;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'WV'
WHERE postalCode BETWEEN 24701 and 26886;

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'WY'
WHERE postalCode BETWEEN 82001 and 83128;

-----------------------------------------------------------------------------------------------------------
--Manually change the provinces with postalcodes that wern't included in the postalcode ranges.

Select Distinct province
FROM [Mexican-Food].[dbo].['just tacos and burritos$']

SELECT *
FROM [Mexican-Food].[dbo].['just tacos and burritos$']
WHERE province = 'Bo Tortuguero'

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'PR'
WHERE postalCode = 765

SELECT *
FROM [Mexican-Food].[dbo].['just tacos and burritos$']
WHERE province = 'Bo Saldinera'

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'PR'
WHERE postalCode = 646

SELECT *
FROM [Mexican-Food].[dbo].['just tacos and burritos$']
WHERE province = 'North Branch'

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'TX'
WHERE postalCode = 75244

SELECT *
FROM [Mexican-Food].[dbo].['just tacos and burritos$']
WHERE province = 'California'

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'CA'
WHERE province = 'California'

SELECT *
FROM [Mexican-Food].[dbo].['just tacos and burritos$']
WHERE province = 'Santurce'

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'PR'
WHERE postalCode = 907

SELECT *
FROM [Mexican-Food].[dbo].['just tacos and burritos$']
WHERE province = 'Oak Point'

Update [Mexican-Food].[dbo].['just tacos and burritos$']
SET province = 'TX'
WHERE postalCode = 75068
--------------------------------------------------------------------------------------------------------
---For the last step I renamed the province column
-- in the SQL selections I renamed the province column to the state column



