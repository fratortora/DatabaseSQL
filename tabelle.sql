use vgclass;
create table studenti(
cf_studente varchar(16) primary key,
nome varchar(50),
cognome varchar(50),
password varchar(200) not null
);
create table docenti(
cf_docente varchar(16) primary key,
nome varchar(50),
cognome varchar(50),
password varchar(200) not null
);
create table classi(
id_classe int,
classe varchar(5),
materia varchar(20),
cf_docente varchar(16),
password varchar(20),
primary key(id_classe),
foreign key(cf_docente) references docenti(cf_docente)
);
create table classi_studenti(
id_classe int,
cf_studente varchar(16),
tot_monete int,
password varchar(20),
primary key(id_classe),
foreign key(id_classe) references classi(id_classe),
foreign key(cf_studente) references studenti(cf_studente)
);
create table videogiochi(
codice_vg varchar(20) primary key,
link varchar(200),
titolo varchar(100),
descrizione_breve varchar(160),
descrizione_lunga TEXT,
argomento varchar(200),
unique(link)
);
create table livelli(
num_livello int,
codice_vg varchar(20),
premio int,
primary key(num_livello,codice_vg),
foreign key(codice_vg) references videogiochi(codice_vg)
);
create table classi_videogiochi(
id_classe int,
codice_vg varchar(20),
primary key(id_classe,codice_vg),
foreign key(id_classe) references classi(id_classe),
foreign key(codice_vg) references videogiochi(codice_vg)
);
create table livelli_studenti_c(
id_classe int,
cf_studente varchar(16),
num_livello int,
codice_vg varchar(20),
primary key(cf_studente,id_classe,num_livello,codice_vg),
foreign key(id_classe) references classi_studenti(id_classe),
foreign key(cf_studente) references classi_studenti(cf_studente),
foreign key(num_livello) references livelli(num_livello),
foreign key(codice_vg) references livelli(codice_vg)
);
