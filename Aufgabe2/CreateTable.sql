/*-----------------Land--------------------*/
CREATE TABLE Land
( land_Name     VARCHAR2(30) NOT NULL,
  CONSTRAINT land_pk PRIMARY KEY (land_Name)
);

/*-----------------Touristenattraktion----------------------------*/
CREATE TABLE Touristenattraktion
( ta_Name            VARCHAR2(30) NOT NULL,
  ta_Beschreibung    VARCHAR2(30) NOT NULL,
  CONSTRAINT ta_pk PRIMARY KEY (ta_Name)
);

/*-----------------Austattung--------------------*/
CREATE TABLE Austattung
( austattung_Name   VARCHAR2(30) NOT NULL,
  CONSTRAINT austattung_pk PRIMARY KEY (austattung_Name)
);

/*-----------------Adresse--------------------*/
CREATE TABLE Adresse
( adresse_ID    INT NOT NULL,
  adresse_PLZ   INT NOT NULL,
  adresse_Ort   VARCHAR2(30) NOT NULL,
  adresse_Strasse VARCHAR2(30) NOT NULL,
  CONSTRAINT adresse_pk PRIMARY KEY (adresse_ID)
);

/*-----------------Ferienwohnung----------------------------*/
CREATE TABLE Ferienwohnung
( fw_ID             INT NOT NULL,
  fw_Name           VARCHAR2(30) NOT NULL,
  fw_Zimmeranzahl   INT NOT NULL,
  fw_Preis          INT NOT NULL,
  fw_Groesse        INT NOT NULL,
  land_Name         VARCHAR(30) NOT NULL,
  adresse_ID        INT NOT NULL,
  CONSTRAINT fw_pk  PRIMARY KEY (fw_ID),
  CONSTRAINT BefindetSichIn_fk FOREIGN KEY (land_Name) REFERENCES Land(land_Name),
  CONSTRAINT Besitzt_fk FOREIGN KEY (adresse_ID) REFERENCES Adresse(adresse_ID)
);



/*-----------------Bild--------------------*/
CREATE TABLE Bild
( bild_ID           INT NOT NULL,
  fw_ID             INT NOT NULL,
  CONSTRAINT bild_pk PRIMARY KEY (bild_ID,fw_ID),
  CONSTRAINT verfuegt_fk FOREIGN KEY (fw_ID) REFERENCES Ferienwohnung(fw_ID)
);



/*-----------------LiegtInDerNähe----------------------------*/
CREATE TABLE LiegtInDerNähe
( lidn_Entfernung   INT NOT NULL,
  ta_Name           VARCHAR2(30) NOT NULL,
  fw_ID             INT NOT NULL,
  CONSTRAINT lidn_pk PRIMARY KEY (fw_ID,ta_Name),
  CONSTRAINT fw_fk FOREIGN KEY (fw_ID) REFERENCES Ferienwohnung(fw_ID),
  CONSTRAINT ta_fk FOREIGN KEY (ta_Name) REFERENCES Touristenattraktion(ta_Name),
  CONSTRAINT lidn_Entfernung CHECK (lidn_Entfernung < 50000)
);

/*-----------------hat--------------------*/
CREATE TABLE hat
( austattung_Name VARCHAR2(30) NOT NULL,
  fw_ID         INT NOT NULL,
  CONSTRAINT hat_pk PRIMARY KEY (fw_ID,austattung_Name),
  CONSTRAINT ferienw_fk FOREIGN KEY (fw_ID) REFERENCES Ferienwohnung(fw_ID), 
  CONSTRAINT austattung_fk FOREIGN KEY (austattung_Name) REFERENCES Austattung(austattung_Name)
);



/*-----------------Kunde--------------------*/
CREATE TABLE Kunde
( kunde_mail         VARCHAR2(30) NOT NULL,
  kunde_Name         VARCHAR2(30) NOT NULL,
  kunde_PW           VARCHAR2(30) NOT NULL,
  kunde_Bankverbindung   VARCHAR2(30) NOT NULL,
  kunde_Newsletter   VARCHAR2(1) NOT NULL,
  land_Name          VARCHAR(30) NOT NULL,
  adresse_ID         INT NOT NULL,  
  CONSTRAINT kunde_pk  PRIMARY KEY (kunde_mail),
  CONSTRAINT LebtIn_fk FOREIGN KEY (land_Name) REFERENCES Land(land_Name),
  CONSTRAINT WohntAn_fk FOREIGN KEY (adresse_ID) REFERENCES Adresse(adresse_ID),
  CONSTRAINT newsletter CHECK (kunde_Newsletter IN ('Y', 'N'))
);

/*-----------------Buchung--------------------*/
CREATE TABLE Buchung
(buchung_ID INT NOT NULL,
 buchung_Datum DATE NOT NULL,
 buchung_Von DATE NOT NULL,
 buchung_Bis DATE NOT NULL,
 buchung_Sterne INT NOT NULL,
 buchung_Bewertungsdatum DATE NOT NULL,
 buchung_RechnungNR INT NOT NULL,
 buchung_RechnungsBetrag INT NOT NULL,
 buchung_RechnungsDatum DATE NOT NULL,
 kunde_mail         VARCHAR2(30) NOT NULL,
 fw_ID             INT NOT NULL,
 CONSTRAINT buchung_pk PRIMARY KEY (buchung_ID),
 CONSTRAINT bucht_fk FOREIGN KEY (kunde_mail) REFERENCES Kunde(kunde_mail),
 CONSTRAINT wirdGebucht_fk FOREIGN KEY (fw_ID) REFERENCES Ferienwohnung(fw_ID),
 CONSTRAINT buchungVonDate CHECK (buchung_Bis - buchung_Von >= 3)
);

/*-----------------Anzahlung--------------------*/
CREATE TABLE Anzahlung
( anzahlung_NR  INT NOT NULL,
  anzahlung_Datum DATE NOT NULL,
  anzahlung_Betrag INT NOT NULL,
  buchung_NR INT NOT NULL,
  CONSTRAINT anzahlung_pk PRIMARY KEY (anzahlung_NR),
  CONSTRAINT fordert_fk FOREIGN KEY (buchung_NR) REFERENCES Buchung(buchung_ID)
);



