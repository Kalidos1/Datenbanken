
/*-----------------Land--------------------*/
INSERT INTO Land VALUES ('Germany');
INSERT INTO Land VALUES ('Spain');
INSERT INTO Land VALUES ('England');
INSERT INTO Land VALUES ('Holland');

/*-----------------Touristenattraktion----------------------------*/
INSERT INTO Touristenattraktion VALUES ('Museum','Museum of Modern Art');
INSERT INTO Touristenattraktion VALUES ('Brandenburger Tor','Sehenswürdigkeit');
INSERT INTO Touristenattraktion VALUES ('Europapark','Freizeitpark');
INSERT INTO Touristenattraktion VALUES ('Ibiza','Strand');

/*-----------------Austattung--------------------*/
INSERT INTO Austattung VALUES ('Fernseher');
INSERT INTO Austattung VALUES ('Whirlpool');
INSERT INTO Austattung VALUES ('Kamin');
INSERT INTO Austattung VALUES ('Pool');
INSERT INTO Austattung VALUES ('Sofa');
INSERT INTO Austattung VALUES ('Sauna');

/*-----------------Adresse-----------*/
INSERT INTO Adresse VALUES (0,25435,'Berlin','Mustermannstrasse45');
INSERT INTO Adresse VALUES (1,13458,'Berlin','Mustermannstrasse1');
INSERT INTO Adresse VALUES (2,45982,'Barcelona','Mustermannstrasse80');
INSERT INTO Adresse VALUES (3,15345,'Barcelona','Mustermannstrasse24');
INSERT INTO Adresse VALUES (4,12312,'London','Mustermannstrasse561');
INSERT INTO Adresse VALUES (5,78655,'London','Mustermannstrasse12');
INSERT INTO Adresse VALUES (6,45674,'Madrid','Mustermannstrasse89');
INSERT INTO Adresse VALUES (7,56756,'Madrid','Mustermannstrasse199');
INSERT INTO Adresse VALUES (8,56756,'Madrid','Mustermannstrasse199');

/*-----------------Ferienwohnung--------------*/
INSERT INTO Ferienwohnung VALUES (0,'Ferienwohnung1',3,200,300,'Germany',0);
INSERT INTO Ferienwohnung VALUES (1,'Ferienwohnung2',2,400,150,'Germany',1);
INSERT INTO Ferienwohnung VALUES (2,'Ferienwohnung3',6,1000,500,'Spain',2);
INSERT INTO Ferienwohnung VALUES (3,'Ferienwohnung4',5,600,400,'Spain',3);
INSERT INTO Ferienwohnung VALUES (4,'Ferienwohnung5',3,700,200,'England',4);
INSERT INTO Ferienwohnung VALUES (5,'Ferienwohnung6',1,300,100,'England',5);
INSERT INTO Ferienwohnung VALUES (6,'Ferienwohnung7',4,400,400,'Spain',6);
INSERT INTO Ferienwohnung VALUES (7,'Ferienwohnung8',7,800,700,'Spain',7);
INSERT INTO Ferienwohnung VALUES (8,'Ferienwohnung9',7,800,700,'Spain',8);

/*-----------------Bild--------------------*/
INSERT INTO Bild VALUES (0,2);
INSERT INTO Bild VALUES (1,4);
INSERT INTO Bild VALUES (2,7);
INSERT INTO Bild VALUES (3,0);

/*-----------------LiegtInDerNähe----------------------------*/
INSERT INTO LiegtInDerNähe VALUES (1000,'Brandenburger Tor',0);
INSERT INTO LiegtInDerNähe VALUES (20000,'Ibiza',3);
INSERT INTO LiegtInDerNähe VALUES (10000,'Museum',4);
INSERT INTO LiegtInDerNähe VALUES (49999,'Europapark',1);

/*-----------------hat--------------------*/
INSERT INTO hat VALUES ('Fernseher',0);
INSERT INTO hat VALUES ('Whirlpool',3);
INSERT INTO hat VALUES ('Kamin',1);
INSERT INTO hat VALUES ('Pool',2);
INSERT INTO hat VALUES ('Sofa',3);
INSERT INTO hat VALUES ('Pool',7);
INSERT INTO hat VALUES ('Kamin',2);
INSERT INTO hat VALUES ('Kamin',4);
INSERT INTO hat VALUES ('Sauna',6);
INSERT INTO hat VALUES ('Sauna',3);
INSERT INTO hat VALUES ('Kamin',3);
INSERT INTO hat VALUES ('Sauna',7);
INSERT INTO hat VALUES ('Sauna',2);
INSERT INTO hat VALUES ('Sauna',8);

/*-----------------Kunde--------------------*/
INSERT INTO Kunde VALUES ('max@mustermann.de','Mustermann','max123','DE67 1111','Y','Germany',0);
INSERT INTO Kunde VALUES ('max123@mustermann.de','Mustermann123','hallo123','SP77 1111','N','Spain',2);
INSERT INTO Kunde VALUES ('max1@mustermann.de','Mustermann1','nicu123','EN63 1112','N','England',4);
INSERT INTO Kunde VALUES ('max2@mustermann.de','Mustermann2','pw123','DE62 1121','Y','Germany',1);
INSERT INTO Kunde VALUES ('max3@mustermann.de','Mustermann3','123456','EN68 1341','Y','England',5);

/*-----------------Buchung--------------------*/
INSERT INTO Buchung VALUES (0,TO_DATE('2019/12/10','yyyy/mm/dd'),TO_DATE('2019/12/10','yyyy/mm/dd'),
TO_DATE('2019/12/17','yyyy/mm/dd'),4,TO_DATE('2019/12/17','yyyy/mm/dd'),0,2000,TO_DATE('2019/12/10','yyyy/mm/dd'),'max@mustermann.de',2);
INSERT INTO Buchung VALUES (1,TO_DATE('2019/06/05','yyyy/mm/dd'),TO_DATE('2019/06/06','yyyy/mm/dd'),
TO_DATE('2019/06/20','yyyy/mm/dd'),2,TO_DATE('2019/06/20','yyyy/mm/dd'),1,3000,TO_DATE('2019/06/20','yyyy/mm/dd'),'max123@mustermann.de',5);
INSERT INTO Buchung VALUES (2,TO_DATE('2019/10/15','yyyy/mm/dd'),TO_DATE('2019/10/16','yyyy/mm/dd'),
TO_DATE('2019/10/20','yyyy/mm/dd'),3,TO_DATE('2019/10/16','yyyy/mm/dd'),2,500,TO_DATE('2019/10/16','yyyy/mm/dd'),'max1@mustermann.de',0);
INSERT INTO Buchung VALUES (3,TO_DATE('2019/09/01','yyyy/mm/dd'),TO_DATE('2019/09/02','yyyy/mm/dd'),
TO_DATE('2019/09/06','yyyy/mm/dd'),5,TO_DATE('2019/09/01','yyyy/mm/dd'),3,100,TO_DATE('2019/09/01','yyyy/mm/dd'),'max2@mustermann.de',3);
INSERT INTO Buchung VALUES (4,TO_DATE('2019/04/20','yyyy/mm/dd'),TO_DATE('2019/04/21','yyyy/mm/dd'),
TO_DATE('2019/04/25','yyyy/mm/dd'),1,TO_DATE('2019/04/20','yyyy/mm/dd'),4,1000,TO_DATE('2019/04/20','yyyy/mm/dd'),'max3@mustermann.de',7);
INSERT INTO Buchung VALUES (5,TO_DATE('2019/12/10','yyyy/mm/dd'),TO_DATE('2019/12/10','yyyy/mm/dd'),
TO_DATE('2019/12/17','yyyy/mm/dd'),5,TO_DATE('2019/12/17','yyyy/mm/dd'),0,2000,TO_DATE('2019/12/10','yyyy/mm/dd'),'max123@mustermann.de',2);
INSERT INTO Buchung VALUES (6,TO_DATE('2019/12/10','yyyy/mm/dd'),TO_DATE('2019/12/10','yyyy/mm/dd'),
TO_DATE('2019/12/17','yyyy/mm/dd'),3,TO_DATE('2019/12/17','yyyy/mm/dd'),0,2000,TO_DATE('2019/12/10','yyyy/mm/dd'),'max123@mustermann.de',2);
INSERT INTO Buchung VALUES (7,TO_DATE('2018/11/02','yyyy/mm/dd'),TO_DATE('2018/11/02','yyyy/mm/dd'),
TO_DATE('2018/11/15','yyyy/mm/dd'),3,TO_DATE('2018/11/15','yyyy/mm/dd'),0,2000,TO_DATE('2018/11/20','yyyy/mm/dd'),'max123@mustermann.de',6);
INSERT INTO Buchung VALUES (8,TO_DATE('2018/11/02','yyyy/mm/dd'),TO_DATE('2018/11/02','yyyy/mm/dd'),
TO_DATE('2018/11/15','yyyy/mm/dd'),3,TO_DATE('2018/11/15','yyyy/mm/dd'),0,2000,TO_DATE('2018/11/20','yyyy/mm/dd'),'max123@mustermann.de',3);
INSERT INTO Buchung VALUES (9,TO_DATE('2019/09/01','yyyy/mm/dd'),TO_DATE('2019/09/02','yyyy/mm/dd'),
TO_DATE('2019/09/06','yyyy/mm/dd'),5,TO_DATE('2019/09/01','yyyy/mm/dd'),3,100,TO_DATE('2019/09/01','yyyy/mm/dd'),'max2@mustermann.de',7);
/*-----------------Anzahlung--------------------*/
INSERT INTO Anzahlung VALUES (0,TO_DATE('2019/12/10','yyyy/mm/dd'),300,0);
INSERT INTO Anzahlung VALUES (1,TO_DATE('2019/06/05','yyyy/mm/dd'),500,1);
INSERT INTO Anzahlung VALUES (2,TO_DATE('2019/10/15','yyyy/mm/dd'),200,2);
INSERT INTO Anzahlung VALUES (3,TO_DATE('2019/09/01','yyyy/mm/dd'),100,3);
INSERT INTO Anzahlung VALUES (4,TO_DATE('2019/04/20','yyyy/mm/dd'),700,4);
