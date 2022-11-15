/*
Created by Damiano Oldoni (INBO)
*/

SELECT
  o."_record_id"                        AS eventID,
-- RECORD-LEVEL
  'HumanObservation'                    AS basisOfRecord,
-- OCCURRENCE
  o."_record_id"                        AS occurrenceID,
  CASE
    WHEN o."geschatte_" =  '1 exemplaar' THEN 1
    WHEN o."geschatte_" =  '2 exemplaren' THEN 2
    WHEN o."geschatte_" =  '3 exemplaren' THEN 3
    WHEN o."geschatte_" =  '3 ex' THEN 3
    WHEN o."geschatte_" =  '4 exemplaren' THEN 4
    WHEN o."geschatte_" =  '5 exemplaren' THEN 5
    ELSE NULL
  END                                   AS individualCount,
  'present'                             AS occurrenceStatus,
  CASE
    WHEN o."abundantie" = 'D / Dominant / >50%' THEN 'D'
    WHEN o."abundantie" = 'A / Abundant/ 25% - 50%' THEN 'A'
    WHEN o."abundantie" = 'F / Frequent / 5% - 25%' THEN 'F'
    WHEN o."abundantie" = 'O / Occasional / >5%' THEN 'O'
    ELSE NULL
  END                                   AS organismQuantity,
  "DAFOR Scale"                         AS organismQuantityType,
  o."scientificName"                    AS scientificName,
  o."vernacularName"                    AS vernacularName,
  'Plantae'                             AS kingdom,
  'species'                             AS taxonRank
FROM occurrences as o

