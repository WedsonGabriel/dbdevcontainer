CREATE TABLE Pessoa (
    cpf char(11) PRIMARY KEY, 
    email varchar(50) NOT NULL,
    nome varchar(150) NOT NULL,
    data_nasc date NOT NULL,
    endereco varchar(300) NOT NULL,
    telefone varchar(15) NULL,
    CONSTRAINT pessoa_un UNIQUE(email, nome)
);

CREATE TABLE Paciente(
    cpf_pessoa char(11),
    senha varchar(20) NOT NULL,
    plano_saude BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT paciente_pk PRIMARY KEY (cpf_pessoa),
    CONSTRAINT paciente_pessoa_fk FOREIGN KEY (cpf_pessoa) REFERENCES Pessoa(cpf)
);