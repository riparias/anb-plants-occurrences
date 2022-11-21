/*
Created by Damiano Oldoni (INBO)
*/

-- area
SELECT
  o."_record_id"                        AS eventID,
  'estimated covered area'              AS measurementType,
  o."geschatte_"                        AS measurementValue,
  'm²'                                  AS measurementUnit
  FROM occurrences as o
  WHERE o."geschatte_" NOT LIKE "%ex" AND
    CAST(o."geschatte_" AS NUMERIC) > 0

UNION

-- coverage
SELECT
  o."_record_id"                        AS eventID,
  'coverage'                            AS measurementType,
  SUBSTR(o."bedekking_", 1,LENGTH(o."bedekking_")-1) AS measurementValue,
  '%'                                   AS measurementUnit
  FROM occurrences as o
  WHERE o."bedekking_" IS NOT NULL
