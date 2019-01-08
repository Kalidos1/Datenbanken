drop table Ferienwohnung cascade constraints;
drop table Land cascade constraints;
drop table Bild cascade constraints;
drop table Touristenattraktion cascade constraints;
drop table LiegtInDerNähe cascade constraints;
drop table hat cascade constraints;
drop table Austattung cascade constraints;
drop table Kunde cascade constraints;
drop table Adresse cascade constraints;
drop table Anzahlung cascade constraints;
drop table Buchung cascade constraints;
drop table StornierteBuchung cascade constraints;

/* Quasi "Papierkorb leehren" */
purge recyclebin;