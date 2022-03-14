-- Cria arquivos temporarios pra melhorar a perfomance
DROP TABLE IF EXISTS temp1;
DROP TABLE IF EXISTS temp2;
CREATE TABLE IF NOT EXISTS temp1 AS SELECT
        DISTINCT g1.geographyID,
        CASE 100 
            WHEN g1.rankid THEN g1.name 
            WHEN g2.rankid THEN g2.name 
            WHEN g3.rankid THEN g3.name 
            WHEN g4.rankid THEN g4.name 
            ELSE NULL 
        END AS Continent,
        CASE 200 
            WHEN g1.rankid THEN g1.name 
            WHEN g2.rankid THEN g2.name 
            WHEN g3.rankid THEN g3.name 
            WHEN g4.rankid THEN g4.name 
            ELSE NULL 
        END AS Country,
        CASE 300 
            WHEN g1.rankid THEN g1.name 
            WHEN g2.rankid THEN g2.name 
            WHEN g3.rankid THEN g3.name 
            WHEN g4.rankid THEN g4.name 
            ELSE NULL 
        END AS StateProvince,
        CASE 400 
            WHEN g1.rankid THEN g1.name 
            WHEN g2.rankid THEN g2.name 
            WHEN g3.rankid THEN g3.name 
            WHEN g4.rankid THEN g4.name 
            ELSE NULL 
        END AS County 
    FROM
        geography g1 
    LEFT OUTER JOIN
        geography g2 
            ON g2.GeographyID = g1.ParentID 
    LEFT OUTER JOIN
        geography g3 
            ON g3.GeographyID = g2.ParentID 
    LEFT OUTER JOIN
        geography g4 
            ON g4.GeographyID = g3.ParentID;

-- Transformed subquery to a temp table to improve performance
CREATE TABLE IF NOT EXISTS temp2 AS SELECT
        DISTINCT tn.TaxonID,
        CASE 'Kingdom' 
            WHEN tut.name THEN tn.name 
            WHEN tut1.name THEN tn1.name 
            WHEN tut2.name THEN tn2.name 
            WHEN tut3.name THEN tn3.name 
            WHEN tut4.name THEN tn4.name 
            WHEN tut5.name THEN tn5.name 
            WHEN tut6.name THEN tn6.name 
            WHEN tut7.name THEN tn7.name 
            WHEN tut8.name THEN tn8.name 
            ELSE NULL 
        END AS Kingdom,
        CASE 'Phylum' 
            WHEN tut.name THEN tn.name 
            WHEN tut1.name THEN tn1.name 
            WHEN tut2.name THEN tn2.name 
            WHEN tut3.name THEN tn3.name 
            WHEN tut4.name THEN tn4.name 
            WHEN tut5.name THEN tn5.name 
            WHEN tut6.name THEN tn6.name 
            WHEN tut7.name THEN tn7.name 
            ELSE NULL 
        END AS Phylum,
        CASE 'Class' 
            WHEN tut.name THEN tn.name 
            WHEN tut1.name THEN tn1.name 
            WHEN tut2.name THEN tn2.name 
            WHEN tut3.name THEN tn3.name 
            WHEN tut4.name THEN tn4.name 
            WHEN tut5.name THEN tn5.name 
            WHEN tut6.name THEN tn6.name 
            ELSE NULL 
        END AS Class,
        CASE 'Order' 
            WHEN tut.name THEN tn.name 
            WHEN tut1.name THEN tn1.name 
            WHEN tut2.name THEN tn2.name 
            WHEN tut3.name THEN tn3.name 
            WHEN tut4.name THEN tn4.name 
            WHEN tut5.name THEN tn5.name 
            ELSE NULL 
        END AS 'Order',
        CASE 'Family' 
            WHEN tut.name THEN tn.name 
            WHEN tut1.name THEN tn1.name 
            WHEN tut2.name THEN tn2.name 
            WHEN tut3.name THEN tn3.name 
            WHEN tut4.name THEN tn4.name 
            ELSE NULL 
        END AS Family,
        CASE 'Genus' 
            WHEN tut.name THEN tn.name 
            WHEN tut1.name THEN tn1.name 
            WHEN tut2.name THEN tn2.name 
            WHEN tut3.name THEN tn3.name 
            ELSE NULL 
        END AS Genus,
        CASE 'Species' 
            WHEN tut.name THEN tn.name 
            WHEN tut1.name THEN tn1.name 
            WHEN tut2.name THEN tn2.name 
            ELSE NULL 
        END AS Species,
        CASE 'Subspecies' 
            WHEN tut.name THEN tn.name 
            WHEN tut1.name THEN tn1.name 
            WHEN tut2.name THEN tn2.name 
            ELSE NULL 
        END AS Subspecies 
    FROM
        taxontreedefitem tut 
    INNER JOIN
        taxon tn 
            ON tn.RankID = tut.RankID 
    LEFT OUTER JOIN
        taxon tn1 
            ON tn1.TaxonID = tn.ParentID 
    LEFT OUTER JOIN
        taxon tn2 
            ON tn2.TaxonID = tn1.ParentID 
    LEFT OUTER JOIN
        taxon tn3 
            ON tn3.TaxonID = tn2.ParentID 
    LEFT OUTER JOIN
        taxon tn4 
            ON tn4.TaxonID = tn3.ParentID 
    LEFT OUTER JOIN
        taxon tn5 
            ON tn5.TaxonID = tn4.ParentID 
    LEFT OUTER JOIN
        taxon tn6 
            ON tn6.TaxonID = tn5.ParentID 
    LEFT OUTER JOIN
        taxon tn7 
            ON tn7.TaxonID = tn6.ParentID 
    LEFT OUTER JOIN
        taxon tn8 
            ON tn8.TaxonID = tn7.ParentID 
    LEFT OUTER JOIN
        taxontreedefitem tut1 
            ON tn1.RankID = tut1.RankID 
    LEFT OUTER JOIN
        taxontreedefitem tut2 
            ON tn2.RankID = tut2.RankID 
    LEFT OUTER JOIN
        taxontreedefitem tut3 
            ON tn3.RankID = tut3.RankID 
    LEFT OUTER JOIN
        taxontreedefitem tut4 
            ON tn4.RankID = tut4.RankID 
    LEFT OUTER JOIN
        taxontreedefitem tut5 
            ON tn5.RankID = tut5.RankID 
    LEFT OUTER JOIN
        taxontreedefitem tut6 
            ON tn6.RankID = tut6.RankID 
    LEFT OUTER JOIN
        taxontreedefitem tut7 
            ON tn7.RankID = tut7.RankID 
    LEFT OUTER JOIN
        taxontreedefitem tut8 
            ON tn8.RankID = tut8.RankID 
    WHERE
        1 = 1;

-- This index is required for optimal temp tables performance
ALTER TABLE
  `temp1`
ADD
  INDEX `temp1_idx_geographyid` (`geographyID`);

-- This index is required for optimal temp tables performance
ALTER TABLE
  `temp2`
ADD
  INDEX `temp2_idx_taxonid` (`taxonID`);
