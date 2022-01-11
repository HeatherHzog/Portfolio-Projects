/*
Cleaning Data in SQL Queries
*/

Select * 
FROM PortolioProjectCovid.dbo.NashvilleHousing

--------------------------------------------------------------------------------------------------------------------------

-- Standardize Sale Date Format

Select SaleDateConverted, CONVERT(date, saledate)
FROM PortolioProjectCovid.dbo.Nashvillehousing

ALTER TABLE NashvilleHousing
Add SaleDateConverted Date;

Update NashvilleHousing
SET SaleDateConverted = CONVERT(Date,SaleDate)


 --------------------------------------------------------------------------------------------------------------------------

-- Populate Property Address data

Select PropertyAddress
FROM PortolioProjectCovid.dbo.Nashvillehousing
--WHERE PropertyAddress is null
ORDER by ParcelID


Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL (a.PropertyAddress, b.PropertyAddress)
FROM PortolioProjectCovid.dbo.Nashvillehousing a
JOIN PortolioProjectCovid.dbo.Nashvillehousing b
on a.ParcelID = b.ParcelID
AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null

Update a
SET PropertyAddress = ISNULL (a.PropertyAddress, b.PropertyAddress)
FROM PortolioProjectCovid.dbo.Nashvillehousing a
JOIN PortolioProjectCovid.dbo.Nashvillehousing b
on a.ParcelID = b.ParcelID
AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null
--------------------------------------------------------------------------------------------------------------------------

-- Breaking out Address into Individual Columns (Address, City, State)

Select PropertyAddress
FROM PortolioProjectCovid.dbo.Nashvillehousing
order by ParcelID

SELECT
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 ) as Address
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1 , LEN(propertyaddress)) as Address

FROM PortolioProjectCovid.dbo.Nashvillehousing

ALTER TABLE NashvilleHousing
Add PropertySplitAddress nvarchar (255);

Update NashvilleHousing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 )

ALTER TABLE NashvilleHousing
Add PropertySplitCity nvarchar (255);

Update NashvilleHousing
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1 , LEN(propertyaddress))

Select*
FROM PortolioProjectCovid.dbo.Nashvillehousing


Select OwnerAddress
FROM PortolioProjectCovid.dbo.Nashvillehousing

Select
Parsename(Replace(OwnerAddress, ',', '.') , 3)
,Parsename(Replace(OwnerAddress, ',', '.') , 2)
,Parsename(Replace(OwnerAddress, ',', '.') , 1)
FROM PortolioProjectCovid.dbo.Nashvillehousing


ALTER TABLE NashvilleHousing
Add OwnerSplitAddress nvarchar (255);

Update NashvilleHousing
SET OwnerSplitAddress = Parsename(Replace(OwnerAddress, ',', '.') , 3)

ALTER TABLE NashvilleHousing
Add OwnerSplitCity nvarchar (255);

Update NashvilleHousing
SET OwnerSplitCity = Parsename(Replace(OwnerAddress, ',', '.') , 2)

ALTER TABLE NashvilleHousing
Add OwnerSplitState nvarchar (255);

Update NashvilleHousing
SET OwnerSplitState = Parsename(Replace(OwnerAddress, ',', '.') , 1)


--------------------------------------------------------------------------------------------------------------------------


-- Change Y and N to Yes and No in "Sold as Vacant" field


Select Distinct(SoldAsVacant), Count(SoldAsVacant)
FROM PortolioProjectCovid.dbo.Nashvillehousing
Group by SoldAsVacant
Order By 2

Select SoldAsVacant
, CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
When SoldAsVacant = 'N' THEN 'No'
Else SoldAsVacant
END
FROM PortolioProjectCovid.dbo.Nashvillehousing

Update NashvilleHousing
SET SoldAsVacant = CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
When SoldAsVacant = 'N' THEN 'No'
Else SoldAsVacant
END

-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Remove Duplicates

WITH RowNumCTE as(
Select *,
ROW_NUMBER() OVER (
PARTITION BY ParcelID,
PropertyAddress,
SalePrice,
SaleDate,
LegalReference
Order BY UniqueID
) row_num

FROM PortolioProjectCovid.dbo.Nashvillehousing
)
Select *
From RowNumCTE
Where row_num > 1
Order BY PropertyAddress

Select *
FROM PortolioProjectCovid.dbo.Nashvillehousing


---------------------------------------------------------------------------------------------------------

-- Delete Unused Columns


Select *
FROM PortolioProjectCovid.dbo.Nashvillehousing

ALTER TABLE PortolioProjectCovid.dbo.Nashvillehousing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress

ALTER TABLE PortolioProjectCovid.dbo.Nashvillehousing
DROP COLUMN SaleDate


-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------


