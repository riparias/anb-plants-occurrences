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
  o."bedekking_"                        AS measurementValue,
  '%'                                   AS measurementUnit
  FROM occurrences as o
  WHERE o."bedekking_" IS NOT NULL

UNION

-- river bank
SELECT
  o."_record_id"                        AS eventID,
  'river bank'                          AS measurementType,
  CASE
    WHEN o."oever" = 'Beide oevers' THEN 'both'
    WHEN o."oever" = 'Linker oever' THEN 'left'
    WHEN o."oever" = 'Rechter oever' THEN 'right'
    ELSE NULL
  END                                   AS measurementValue,
  NULL                                  AS measurementUnit
FROM occurrences as o
