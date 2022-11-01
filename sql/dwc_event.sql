/*
Created by Damiano Oldoni (INBO)
*/

SELECT
-- RECORD-LEVEL
  'Event'                               AS type,
  'en'                                  AS language,
  'http://creativecommons.org/publicdomain/zero/1.0/' AS license,
  'ANB'                                 AS rightsHolder,
  ''                                    AS datasetID,
  'ANB'                                 AS institutionCode,
  'Monitoring of LIFE RIPARIAS invasive alien plants in the Flemish part of the LIFE RIPARIAS areas' AS datasetName,
  'HumanObservation'                    AS basisOfRecord,
  'targeted monitoring'                 AS samplingProtocol,
-- OCCURRENCE
  o."_record_id"                        AS occurrenceID,
-- EVENT
  o."_record_id"                        AS eventID,
  date(o."_created_at")                 AS eventDate,
  time(o."_created_at")                 AS eventTime,
-- LOCATION
  'BE'                                  AS countryCode,
  CASE
    WHEN o."regio" = 'Dijlevallei' THEN 'Dijle Valley'
	  WHEN o."regio" = 'Zennevallei' THEN 'Zenne Valley'
	  WHEN o."regio" = 'Markvallei' THEN 'Mark Valley'
	  ELSE NULL
	END                                   AS locality,
  CASE
	  WHEN o."Waterloop" = 'Laan' THEN 'Laan'
	  WHEN o."Waterloop" = 'Zenne' THEN 'Zenne'
	  WHEN o."Waterloop" = 'Molenbeek' THEN 'Molenbeek'
	  WHEN o."Waterloop" = 'Spuibeek 2de arm' THEN 'Spuibeek: second arm'
	  WHEN o."Waterloop" = 'Weesbeek' THEN 'Weesbeek'
	  WHEN o."Waterloop" = 'Tangebeek' THEN 'Tangebeek'
	  WHEN o."Waterloop" = 'Amelvonnesbeek' THEN 'Amelvonnesbeek'
	  WHEN o."Waterloop" = 'Groebengracht' THEN 'Groebengracht'
	  WHEN o."Waterloop" = 'Dijle' THEN 'Dijle'
	  WHEN o."Waterloop" = 'Kleine Maelbeek' THEN 'Kleine Maelbeek'
	  WHEN o."Waterloop" = 'Voer' THEN 'Voer'
	  WHEN o."Waterloop" = 'IJse' THEN 'IJse'
	  WHEN o."Waterloop" = 'Maalbeek' THEN 'Maalbeek'
	  WHEN o."Waterloop" = 'Woluwe' THEN 'Woluwe'
	  WHEN o."Waterloop" = 'Kanaal Leuven-Dijle' THEN 'Channel Leuven-Dijle'
	  WHEN o."Waterloop" = 'Broekloop' THEN 'Broekloop'
	  WHEN o."Waterloop" = 'Mark' THEN 'Mark'
	  WHEN o."Waterloop" = 'Tarwoolbeek' THEN 'Tarwoolbeek'
	  WHEN o."Waterloop" = 'De Grote Laak' THEN 'Grote Laak'
	  WHEN o."Waterloop" = 'Arebeek' THEN 'Arebeek'
	  WHEN o."Waterloop" = 'Vrouwvliet' THEN 'Vrouwvliet'
	  WHEN o."Waterloop" = 'Hollebeek' THEN 'Hollebeek'
	  WHEN o."Waterloop" = 'Maasdalbeek' THEN 'Maasdalbeek'
	  WHEN o."Waterloop" = 'Minselbeek' THEN 'Minselbeek'
	  WHEN o."Waterloop" = 'Bosbeek' THEN 'Bosbeek'
	  WHEN o."Waterloop" = 'Zuunbeek' THEN 'Zuunbeek'
	  WHEN o."Waterloop" = 'Kanaal Brussel-Rupel' THEN 'Channel Brussel-Rupel'
	  WHEN o."Waterloop" = 'Abdijbeek' THEN 'Abdijbeek'
	  WHEN o."Waterloop" = 'Molen van Hamelgem' THEN 'Molenbeek of Hamelgem'
	  WHEN o."Waterloop" = 'Leigracht' THEN 'Leigracht'
	  WHEN o."Waterloop" = 'Rifrafbeek' THEN 'Rifrafbeek'
	  WHEN o."Waterloop" = 'Zwartebeek' THEN 'Zwartebeek'
	  WHEN o."Waterloop" = 'Kanaal naar Charleroi' THEN 'Channel to Charleroi'
	  WHEN o."Waterloop" = 'Vunt' THEN 'Vunt'
	  WHEN o."Waterloop" = 'Steenputbeek' THEN 'Steenputbeek'
	  WHEN o."Waterloop" = 'Bovenheidebeek' THEN 'Bovenheidebeek'
	  WHEN o."Waterloop" = 'Bruelbeek' THEN 'Bruelbeek'
	  WHEN o."Waterloop" = 'Beverbeek' THEN 'Beverbeek'
	  WHEN o."Waterloop" = 'Lubbeek' THEN 'Lubbeek'
	  WHEN o."Waterloop" = 'Weisetterbeek' THEN 'Weisetterbeek'
	  WHEN o."Waterloop" = 'Lotbeek' THEN 'Lotbeek'
	  WHEN o."Waterloop" = 'Vogelzangbeek' THEN 'Vogelzangbeek'
	  WHEN o."Waterloop" = 'Krekelbeek' THEN 'Krekelbeek'
	  WHEN o."Waterloop" = 'Vijverbeek' THEN 'Vijverbeek'
	  WHEN o."Waterloop" = 'Britspoelbeek' THEN 'Britspoelbeek'
	  WHEN o."Waterloop" = 'Oude mark' THEN 'Oude Mark'
	  WHEN o."Waterloop" = 'Stanne-Beek' THEN 'Stanne-Beek'
	  WHEN o."Waterloop" = 'Lemingsbeek' THEN 'Lemingsbeek'
	  WHEN o."Waterloop" = 'Kesterbeek' THEN 'Kesterbeek'
	  WHEN o."Waterloop" = 'Wolzakkenleibeek' THEN 'Wolzakkenleibeek'
	  WHEN o."Waterloop" = 'Linkebeek' THEN 'Linkebeek'
	  WHEN o."Waterloop" = 'Veerlebeek' THEN 'Veerlebeek'
	  WHEN o."Waterloop" = 'Grootbroek' THEN 'Grootbroek'
	  WHEN o."Waterloop" = 'Kleinebeek' THEN 'Kleinebeek'
	  WHEN o."Waterloop" = 'Hoge beek' THEN 'Hoge Beek'
	  WHEN o."Waterloop" = 'Vaalbeek' THEN 'Vaalbeek'
	  WHEN o."Waterloop" = 'Scheibeek' THEN 'Scheibeek'
	  WHEN o."Waterloop" = 'Barebeek' THEN 'Barebeek'
	  WHEN o."Waterloop" = 'Dorploop' THEN 'Dorploop'
	  WHEN o."Waterloop" = 'Bierbeek' THEN 'Bierbeek'
	  WHEN o."Waterloop" = 'Demer' THEN 'Demer'
	  WHEN o."Waterloop" = 'Reehagenbeek' THEN 'Reehagenbeek'
	  WHEN o."Waterloop" = 'Peerdebeek' THEN 'Peerdebeek'
	  WHEN o."Waterloop" = 'Oude platte beek' THEN 'Oude platte beek'
	  WHEN o."Waterloop" = 'Rilroheidebeek' THEN 'Rilroheidebeek'
	  ELSE NULL
  END                                   AS waterBody
  CASE
    WHEN o."locatie" = 'Binnen de 5 meter van de waterloop,Op de oever,Tussen de 10 en 20m van de waterloop,Tussen de 5 en 10m van de waterloop' THEN 'on the riverbank | within 5 meters of the riverbank | between 5 and 10 meters of the riverbank | between 10 and 20 meters of the riverbank'
    WHEN o."locatie" = 'Binnen de 5 meter van de waterloop,Op de oever,Tussen de 5 en 10m van de waterloop' THEN 'on the riverbank | within 5 meters of the riverbank | between 5 and 10 meters of the riverbank'
    WHEN o."locatie" = 'Binnen de 5 meter van de waterloop,Op de oever' THEN 'on the riverbank | within 5 meters of the riverbank'
    WHEN o."locatie" = 'Binnen de 5 meter van de waterloop,Op de oever,Tussen de 10 en 20m van de waterloop,Tussen de 20 en 50m van de waterloop,Tussen de 5 en 10m van de waterloop' THEN 'on the riverbank | within 5 meters of the riverbank | between 5 and 10 meters of the riverbank | between 10 and 20 meters of the riverbank | between 20 and 50 meters of the riverbank'
    WHEN o."locatie" = 'Op de oever' THEN 'on the riverbank'
    WHEN o."locatie" = 'Verder dan 50 meter van de waterloop' THEN 'further than 50 meters of the riverbank'
    WHEN o."locatie" = 'Binnen de 5 meter van de waterloop,Op de oever,Tussen de 10 en 20m van de waterloop,Tussen de 20 en 50m van de waterloop,Tussen de 5 en 10m van de waterloop,Verder dan 50 meter van de waterloop' THEN 'on the riverbank | within 5 meters of the riverbank | between 5 and 10 meters of the riverbank | between 10 and 20 meters of the riverbank | between 20 and 50 meters of the riverbank | further than 50 meters of the riverbank'
    WHEN o."locatie" = 'Binnen de 5 meter van de waterloop,Tussen de 10 en 20m van de waterloop,Tussen de 20 en 50m van de waterloop,Tussen de 5 en 10m van de waterloop,Verder dan 50 meter van de waterloop' THEN 'within 5 meters of the riverbank | between 5 and 10 meters of the riverbank | between 10 and 20 meters of the riverbank | between 20 and 50 meters of the riverbank | further than 50 meters of the riverbank'
    WHEN o."locatie" = 'Binnen de 5 meter van de waterloop,Tussen de 10 en 20m van de waterloop,Tussen de 20 en 50m van de waterloop,Tussen de 5 en 10m van de waterloop' THEN 'within 5 meters of the riverbank | between 5 and 10 meters of the riverbank | between 10 and 20 meters of the riverbank | between 20 and 50 meters of the riverbank'
    WHEN o."locatie" = 'Binnen de 5 meter van de waterloop,Op de oever,Tussen de 20 en 50m van de waterloop,Tussen de 5 en 10m van de waterloop,Verder dan 50 meter van de waterloop' THEN 'on the riverbank | within 5 meters of the riverbank | between 5 and 10 meters of the riverbank | between 20 and 50 meters of the riverbank | further than 50 meters of the riverbank'
    WHEN o."locatie" = 'Tussen de 10 en 20m van de waterloop,Tussen de 20 en 50m van de waterloop,Tussen de 5 en 10m van de waterloop,Verder dan 50 meter van de waterloop' THEN 'between 5 and 10 meters of the riverbank | between 10 and 20 meters of the riverbank | between 20 and 50 meters of the riverbank | further than 50 meters of the riverbank'
    WHEN o."locatie" = 'Binnen de 5 meter van de waterloop' THEN 'within 5 meters of the riverbank'
    WHEN o."locatie" = 'Binnen de 5 meter van de waterloop,Tussen de 10 en 20m van de waterloop,Tussen de 20 en 50m van de waterloop,Verder dan 50 meter van de waterloop' THEN 'within 5 meters of the riverbank | between 10 and 20 meters of the riverbank | between 20 and 50 meters of the riverbank | further than 50 meters of the riverbank'
    WHEN o."locatie" = 'Tussen de 5 en 10m van de waterloop' THEN 'between 5 and 10 meters of the riverbank'
    WHEN o."locatie" = 'Tussen de 20 en 50m van de waterloop' THEN 'between 20 and 50 meters of the riverbank'
    WHEN o."locatie" = 'Tussen de 20 en 50m van de waterloop,Verder dan 50 meter van de waterloop' THEN 'between 20 and 50 meters of the riverbank | further than 50 meters of the riverbank'
    WHEN o."locatie" = 'Binnen de 5 meter van de waterloop,Tussen de 5 en 10m van de waterloop' THEN 'within 5 meters of the riverbank | between 5 and 10 meters of the riverbank'
    WHEN o."locatie" = 'Binnen de 5 meter van de waterloop,Tussen de 10 en 20m van de waterloop,Tussen de 5 en 10m van de waterloop' THEN 'within 5 meters of the riverbank | between 5 and 10 meters of the riverbank | between 10 and 20 meters of the riverbank'
    WHEN o."locatie" = 'Tussen de 10 en 20m van de waterloop' THEN 'between 10 and 20 meters of the riverbank'
    ELSE NULL
  END                                   AS locationRemarks,
  printf('%.5f', ROUND(o."_latitude", 5)) AS decimalLatitude,
  printf('%.5f', ROUND(o."_longitude", 5)) AS decimalLongitude,
  'WGS84'                               AS geodeticDatum,
  30                                    AS coordinateUncertaintyInMeters
FROM occurrences AS o
