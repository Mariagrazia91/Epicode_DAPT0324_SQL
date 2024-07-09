Create Schema W2D2_ES1_Fac;

USE W2D2_ES1_Fac;

-- Creazione tabella Store

CREATE TABLE Store(
CodiceStore INT primary KEY, 
IndirizzoFisico VARCHAR(100), 
Numero_di_Telefono varchar(100)
);

-- Creazione tabella Impiegato
CREATE TABLE Impiegato(
CodiceFiscale VARCHAR (16) primary KEY,
Nome VARCHAR (100),
Titolo_di_studio VARCHAR (100),
Recapito VARCHAR (100)
);

-- Creazione Tabella Servizio_Impiegato

CREATE TABLE Servizio_Impiegato ( 
CodiceFiscale VARCHAR (16), 
CodiceStore INT,
Data_Inizio DATE, 
Data_Fine DATE,
Carica VARCHAR(100),
FOREIGN KEY (CodiceFiscale) REFERENCES Impiegato (CodiceFiscale),
FOREIGN KEY (CodiceStore) REFERENCES Store (CodiceStore)
);

-- Creazione Tabella Videogioco

CREATE TABLE Videogioco (
Titolo VARCHAR(100),
Sviluppatore VARCHAR(100),
Anno_di_distribuzione INT,
Prezzo decimal (4,2),
Genere VARCHAR(100),
RemakeDi VARCHAR(100)
);
-- Select * from Videogioco;
-- Popolamento tabella store 

insert into STORE (CodiceStore,IndirizzoFisico,Numero_di_Telefono) values
(1, "Via Roma 123, Milano", "+39 02 1234567"),
    (2,"Corso Italia 456, Roma","+39 06 7654321"),
    (3,"Piazza San Marco 789, Venezia","+39 041 9876543"),
    (4,"Viale degli Ulivi 234, Napoli","+39 081 3456789"),
    (5,"Via Torino 567, Torino","+39 011 8765432"),
    (6,"Corso Vittorio Emanuele 890, Firenze","+39 055 2345678"),
    (7,"Piazza del Duomo 123, Bologna","+39 051 8765432"),
    (8,"Via Garibaldi 456, Genova","+39 010 2345678"),
    (9,"Lungarno Mediceo 789, Pisa","+39 050 8765432"),
    (10,"Corso Cavour 101, Palermo","+39 091 2345678");

Select * from STORE;









