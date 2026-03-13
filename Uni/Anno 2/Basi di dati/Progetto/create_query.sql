CREATE DATABASE progetto_basi;
USE progetto_basi;
create table SEDE_AMA(
    codice_sede INT AUTO_INCREMENT PRIMARY KEY,
    indirizzo VARCHAR(100) NOT NULL,
    cap SMALLINT NOT NULL
);
create table CLIENTE(
    codice_fiscale VARCHAR(16) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cognome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(64) NOT NULL,
    numero_telefono INT NOT NULL,
    indirizzo VARCHAR(100),
    cap SMALLINT,
    token_spid VARCHAR(24),
    data_nascita DATE NOT NULL
);

create table LISTA_CAP(
    codice_sede INT PRIMARY KEY,
    CAP SMALLINT NOT NULL,
    FOREIGN KEY(codice_sede) REFERENCES SEDE_AMA(codice_sede)
);


create table LAVORATORE(
    CID_lavoratore INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cognome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(64) NOT NULL,
    data_nascita DATE NOT NULL,
    ruolo ENUM('in_sede', 'corriere')
);

create table PRENOTAZIONE(
    codice_prenotazione INT AUTO_INCREMENT PRIMARY KEY,
    foto TEXT NOT NULL,
    descrizione TEXT,
    tipologia_servizio VARCHAR(100) NOT NULL,
    data_prenotazione DATE NOT NULL,
    orario_prenotazione TIME NOT NULL,
    stato_prenotazione VARCHAR(100) NOT NULL,
    costo_prenotazione DECIMAL(8,2) NOT NULL,
    codice_fiscale VARCHAR(16) NOT NULL,
    codice_sede INT NOT NULL,
    CID_lavoratore INT NOT NULL,
    FOREIGN KEY (codice_fiscale) REFERENCES CLIENTE(codice_fiscale),
    FOREIGN KEY (codice_sede) REFERENCES SEDE_AMA(codice_sede),
    FOREIGN KEY (CID_lavoratore) REFERENCES LAVORATORE(CID_lavoratore)
);

create table VALUTAZIONE(
    codice_prenotazione INT PRIMARY KEY,
    voto TINYINT NOT NULL,
    CHECK (voto BETWEEN 1 AND 5),
    commento VARCHAR(200),
    FOREIGN KEY(codice_prenotazione) REFERENCES PRENOTAZIONE(codice_prenotazione)
);

create table VEICOLO(
    targa VARCHAR(7) PRIMARY KEY,
    tipologia VARCHAR(30),
    CID_lavoratore INT,
    carico_massimo DECIMAL(8,2),
    stato ENUM ('disponibile','occupato','manutenzione'),
    FOREIGN KEY (CID_lavoratore) REFERENCES LAVORATORE(CID_lavoratore)
);

create table TURNO(
    id_turno INT AUTO_INCREMENT PRIMARY KEY,
    data_turno DATE NOT NULL,
    orario_inizio TIME NOT NULL,
    orario_fine TIME NOT NULL,
    pausa_inizio TIME NOT NULL,
    pausa_fine TIME NOT NULL
);

create table TURNO_SETTIMANALE(
    CID_lavoratore INT,
    id_turno INT,
    PRIMARY KEY(CID_lavoratore, id_turno),
    FOREIGN KEY (CID_lavoratore) REFERENCES LAVORATORE(CID_lavoratore),
    FOREIGN KEY (id_turno) REFERENCES TURNO(id_turno)
);

create table ORARIO(
    id_orario INT AUTO_INCREMENT PRIMARY KEY,
    orario_inizio TIME NOT NULL,
    orario_fine TIME NOT NULL,
    inizio_pausa TIME NOT NULL,
    fine_pausa TIME NOT NULL,
    data DATE NOT NULL
);

create table ORARIO_SETTIMANALE(
    id_orario INT,
    codice_sede INT,
    PRIMARY KEY(id_orario,codice_sede),
    FOREIGN KEY (id_orario) REFERENCES ORARIO(id_orario),
    FOREIGN KEY (codice_sede) REFERENCES SEDE_AMA(codice_sede)
);