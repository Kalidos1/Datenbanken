SELECT * FROM BUCHUNG;

DELETE FROM BUCHUNG WHERE buchung.buchung_ID = 5;

SELECT * FROM BUCHUNG;

SELECT * FROM storniertebuchung;


CREATE VIEW KundeBuchung(Kundennummer,AnzahlBuchung) AS
SELECT k.kunde_mail,COUNT(b.buchung_ID) FROM BUCHUNG B JOIN Kunde K
ON k.kunde_mail = b.kunde_mail
GROUP BY k.kunde_mail;

CREATE VIEW KundennummerBuchung(Kundennummer,AnzahlBuchung) AS
SELECT k.kunde_mail,NVL(kb.AnzahlBuchung,0)
FROM KundeBuchung KB RIGHT OUTER JOIN Kunde K
ON kb.kundennummer = k.kunde_mail;


CREATE VIEW KundeStornierung(Kundennummer,AnzahlStornierung) AS
SELECT k.kunde_mail,COUNT(sb.sbuchung_ID) FROM StornierteBuchung SB JOIN Kunde K
ON k.kunde_mail = sb.kunde_mail
GROUP BY k.kunde_mail;

CREATE VIEW KundennummerStornierung(Kundennummer,AnzahlStornierung) AS
SELECT k.kunde_mail,NVL(ks.AnzahlStornierung,0) 
FROM KundeStornierung KS RIGHT OUTER JOIN Kunde K
ON ks.kundennummer = k.kunde_mail;

CREATE VIEW KundeZahlungen(Kundennummer,Zahlung) AS
SELECT k.kunde_mail,SUM(a.anzahlung_betrag) FROM anzahlung a,Kunde K,Buchung B
WHERE k.kunde_mail = b.kunde_mail
AND b.buchung_id = a.buchung_nr
GROUP BY k.kunde_mail;

CREATE VIEW KundenstatistikTest AS
SELECT kb.kundennummer,kb.anzahlbuchung,ks.anzahlstornierung FROM KundennummerBuchung KB JOIN KundennummerStornierung KS
ON kb.kundennummer = ks.kundennummer;


CREATE VIEW Kundenstatistik AS
SELECT kt.kundennummer,kt.anzahlbuchung,kt.anzahlstornierung,NVL(kz.Zahlung,0) 
as Zahlung FROM KundenstatistikTest KT LEFT OUTER JOIN KundeZahlungen KZ
ON kt.kundennummer = kz.kundennummer;

SELECT * FROM Kundenstatistik;

DROP VIEW KundeBuchung;
DROP VIEW KundeStornierung;
DROP VIEW KundennummerBuchung;
DROP VIEW KundennummerStornierung;
DROP VIEW KundeZahlungen;
DROP VIEW KundenstatistikTest;
DROP VIEW Kundenstatistik;