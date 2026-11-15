-- NSERT INTO, UPDATE e DELETE FROM 

INSERT INTO agendamento.pessoa(nome, email, cpf, data_nasc, endereco, telefone)
VALUES
    ('Pedro I', 'pp@email.com', '002','1479-01-10', 'R. Vasco', NULL),
    ('Pedro II', 'ps@email.com', '003', '1516-02-10', 'R. Flamengo', 5501),
    ('D João VI', 'dj@email.com', '001', '1415-12-01', 'R. Portugal', NULL),
    ('JJ Xavier', 'jj@email.com', '004', '1746-11-12', 'R. Minas', 5502);

INSERT INTO agendamento.medico(cpf_pessoa, crm)
VALUES
  ('001', '111'),
  ('004', '112');

INSERT INTO agendamento.Paciente(cpf_pessoa, senha, plano_saude)
VALUES
    ('002', 'senha1', 'FALSE'),
    ('003', 'senha2', 'TRUE');

INSERT INTO agendamento.especialidade(descricao)
VALUES 
    ('Pediatra'),
    ('Cardiologista'),
    ('Ortopedista');
