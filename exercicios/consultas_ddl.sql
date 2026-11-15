CREATE SCHEMA IF NOT EXISTS agendamento;

CREATE TABLE agendamento.Pessoa (
    cpf char(11) PRIMARY KEY, 
    email varchar(50) NOT NULL,
    nome varchar(150) NOT NULL,
    data_nasc date NOT NULL,
    endereco varchar(300) NOT NULL,
    telefone varchar(15) NULL,
    CONSTRAINT pessoa_un UNIQUE(email, nome)
);

CREATE TABLE agendamento.Paciente (
    cpf_pessoa char(11),
    senha varchar(20) NOT NULL,
    plano_saude BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT paciente_pk PRIMARY KEY(cpf_pessoa),
    CONSTRAINT paciente_pessoa_fk FOREIGN KEY(cpf_pessoa) REFERENCES agendamento.Pessoa(cpf)
);

CREATE TABLE agendamento.Medico (
    cpf_pessoa char(11),
    crm varchar(10) UNIQUE NOT NULL,
    CONSTRAINT medico_pk PRIMARY KEY(cpf_pessoa),
    CONSTRAINT medico_pessoa_fk FOREIGN KEY(cpf_pessoa) REFERENCES agendamento.Pessoa(cpf)
);

CREATE TABLE agendamento.Agendamento (
    cpf_paciente char(11),
    cpf_medico char(11),
    dh_consulta timestamp,
    dh_agendamento timestamp NOT NULL DEFAULT current_timestamp,
    valor_consulta float NOT NULL DEFAULT(0.0),
    CONSTRAINT agendamento_pk PRIMARY KEY(cpf_paciente, cpf_medico, dh_consulta),
    CONSTRAINT agendamento_paciente_fk FOREIGN KEY(cpf_paciente) REFERENCES agendamento.Paciente(cpf_pessoa),
    CONSTRAINT agendamento_medico_fk FOREIGN KEY(cpf_medico) REFERENCES agendamento.Medico(cpf_pessoa)
);

CREATE TABLE agendamento.Especialidade (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    descricao varchar(300) NOT NULL
);

CREATE TABLE agendamento.MedicoEspecialidade (
    cpf_medico char(11),
    id_especialidade integer,
    CONSTRAINT medico_especialidade_pk PRIMARY KEY(cpf_medico, id_especialidade),
    CONSTRAINT medico_fk FOREIGN KEY(cpf_medico) REFERENCES agendamento.Medico(cpf_pessoa),
    CONSTRAINT id_especialidade_fk FOREIGN KEY(id_especialidade) REFERENCES agendamento.Especialidade(id)
);