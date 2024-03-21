/*
Working with joins in SQL & Aliases
Author: Khalid Diriye
*/
SELECT C.CompositionID, C.CompositionName
FROM Composition C
JOIN Composition_Instrument CI 
	on C.CompositionID = CI.CompositionID
JOIN Instrument I 
	on CI.InstrumentID = I.InstrumentID
WHERE I.InstrumentName = 'Saxophone';

SELECT C.CompositionID, C.CompositionName
FROM Composition C
WHERE C.CompositionID IN ( SELECT CI.CompositionID
									FROM Composition_Instrument CI
									JOIN Instrument I
										on CI.InstrumentID = I.InstrumentID
										WHERE I.InstrumentName = 'Saxophone');


SELECT C.CompositionID, C.CompositionName
FROM Composition C
JOIN Composition_Instrument CI 
	on C.CompositionID = CI.CompositionID
JOIN Instrument I 
	on CI.InstrumentID = I.InstrumentID
WHERE I.InstrumentName = 'Saxophone';

SELECT C.ComposerID, C.FirstName, C.LastName
FROM Composer C
WHERE C.ComposerID IN ( SELECT CI.CompositionID
									FROM Composition_Instrument CI
									JOIN Instrument I
										on CI.InstrumentID = I.InstrumentID
										WHERE I.InstrumentName = 'Saxophone');

-- Exists
select c.CompositionID, c.CompositionName
  from Composition c
 where EXISTS
             (select *
				from Composition co
                inner join Composition_Instrument ci
					on co.CompositionID = ci.CompositionID
                inner join Instrument i
                  on ci.InstrumentID = i.InstrumentID
               where 
				i.InstrumentName = 'Flute' and i.InstrumentName = 'Saxophone'
				and co.ComposerID = c.ComposerID
				)

-- Not Exists

select InstrumentID, InstrumentName
FROM Instrument i
WHERE NOT EXISTS ( select InstrumentID
					from Composition_Instrument ci)




