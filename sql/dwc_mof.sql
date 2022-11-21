/*
Created by Damiano Oldoni (INBO)
*/

-- area
SELECT
  o."_record_id"                        AS eventID,
  'estimated covered area'              AS measurementType,
  CASE
    WHEN o."geschatte_" = '10000 voornamelijk langsheen afgesneden armen' THEN '10000'
    WHEN o."geschatte_" = '20m2' THEN '20'
    WHEN o."geschatte_" = '100m' THEN '100'
    WHEN o."geschatte_" = '0,5' THEN '0.5'
    ELSE o."geschatte_"
  END                                   AS measurementValue,
  'm²'                                  AS measurementUnit
  FROM occurrences as o
  WHERE o."geschatte_" NOT LIKE "%ex%" AND
  	o."geschatte_" != '5p' AND
  	o."geschatte_" IS NOT NULL

UNION

-- coverage
SELECT
  o."_record_id"                        AS eventID,
  'coverage'                            AS measurementType,
  SUBSTR(o."bedekking_", 1,LENGTH(o."bedekking_")-1) AS measurementValue,
  '%'                                   AS measurementUnit
  FROM occurrences as o
  WHERE o."bedekking_" IS NOT NULL
