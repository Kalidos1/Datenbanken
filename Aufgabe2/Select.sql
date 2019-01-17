/*-----------------Controlls----------------------------*/

commit;
rollback;

SELECT * From Buchung;

/*-----------------Select 1-------------------------*/
SELECT COUNT(A.adresse_Ort) as Anzahl,A.adresse_Ort
FROM dbsys61.Ferienwohnung F,dbsys61.Adresse A
WHERE A.adresse_ID = F.adresse_ID
GROUP BY A.adresse_Ort;


/*-----------------Select 2-------------------------*/

SELECT *
FROM 
(
SELECT AVG(b.buchung_sterne) as Sterne,f.fw_name
FROM dbsys61.Buchung B,dbsys61.Ferienwohnung F
WHERE b.fw_id = f.fw_ID
AND f.land_name = 'Spain'
GROUP BY f.fw_name
)
WHERE Sterne >= 4;

/*-----------------Select 3-------------------------*/

CREATE VIEW Anzahl AS
SELECT MAX(COUNT(h.fw_ID)) as Anzahl
FROM dbsys61.hat H,dbsys61.Ferienwohnung F
WHERE h.fw_ID = f.fw_ID
GROUP BY f.fw_name;

CREATE VIEW ANZAHL_NAME(Anzahl,FName) AS
SELECT COUNT(h.fw_ID) as Anzahl2,f.fw_name
FROM dbsys61.hat H,dbsys61.Ferienwohnung F
WHERE h.fw_ID = f.fw_ID
GROUP BY f.fw_name;


SELECT an.anzahl,an.fname
FROM ANZAHL_NAME AN,Anzahl A
WHERE an.anzahl = a.anzahl;

DROP VIEW ANZAHL_NAME;
DROP VIEW Anzahl;

/*-----------------Select 4-------------------------*/
CREATE VIEW Buchung_Zahlung(landName,landCount)
AS SELECT f.land_Name,COUNT(b.fw_ID)
FROM dbsys61.Ferienwohnung F JOIN dbsys61.Buchung b
ON b.fw_ID = f.fw_ID
WHERE b.buchung_von > CURRENT_DATE
GROUP BY f.land_Name;

SELECT l.land_name as Land,NVL(bz.landCount,0) as Anzahl 
FROM Buchung_Zahlung BZ RIGHT OUTER JOIN dbsys61.Land L
ON bz.landName = l.land_name
ORDER BY Anzahl DESC;

DROP VIEW Buchung_Zahlung;

/*-----------------Select 5-------------------------*/

/* STERNE = 0 wenn nicht in Buchung aber Frei (Noch keine Bewertung)*/

CREATE VIEW FerienwohnungSpanien(Ferienwohnung)
AS SELECT f.fw_name
FROM dbsys61.Ferienwohnung F JOIN dbsys61.hat H
ON f.fw_ID = h.fw_ID
AND h.austattung_name = 'Sauna'
AND f.land_name = 'Spain';

CREATE VIEW Buchungen(Ferienwohnung)
AS SELECT f.fw_name
FROM dbsys61.Ferienwohnung f,dbsys61.Buchung B,FerienwohnungSpanien FS
WHERE b.buchung_Von >= TO_DATE('11/01/2018', 'MM/DD/YYYY')
AND b.buchung_Von <= TO_DATE('11/21/2018', 'MM/DD/YYYY')
AND b.buchung_Bis >= TO_DATE('11/01/2018', 'MM/DD/YYYY')
AND b.buchung_Bis <= TO_DATE('11/21/2018', 'MM/DD/YYYY')
AND f.fw_name = FS.ferienwohnung
AND f.fw_ID = b.fw_ID;

CREATE VIEW Sterne(Sterne,Ferienwohnung) AS
SELECT AVG(b.buchung_sterne) as Sterne,FS.ferienwohnung
FROM dbsys61.Buchung B,FerienwohnungSpanien FS RIGHT OUTER JOIN dbsys61.Ferienwohnung F
ON f.fw_name = fs.ferienwohnung
WHERE fs.ferienwohnung NOT IN (SELECT * FROM Buchungen VB) 
AND b.fw_ID = f.fw_ID
GROUP BY FS.ferienwohnung
ORDER BY Sterne DESC;

SELECT * FROM Sterne;

DROP VIEW FerienwohnungSpanien;
DROP VIEW Buchungen;
DROP VIEW Sterne;

commit;
rollback;
