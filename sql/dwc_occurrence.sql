/*
Created by Damiano Oldoni (INBO)
*/

SELECT
  o."_record_id"                        AS eventID,
  -- RECORD-LEVEL
  'HumanObservation'                    AS basisOfRecord,
-- OCCURRENCE
  o."_record_id"                        AS occurrenceID,
  o."scientificName"                    AS scientificName,
  o."vernacularName"                    AS vernacularName
  'Plantae'                             AS kingdom,
  'species'                             AS taxonRank
