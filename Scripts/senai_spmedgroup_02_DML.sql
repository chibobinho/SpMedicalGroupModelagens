USE SP_MEDICAL_GROUP
GO

INSERT INTO CLINICA (nomeFantasiaClinica, razaoSocialClinica, enderecoClinica, horarioAbreClinica, horarioFechaClinica, cnpjClinica)
VALUES ('Clinica Fares', 'SP Medical Group', 'Av. Barão Limeira, 532, São Paulo, SP', '08:00', '20:00', '86400902000130')

INSERT INTO ESPECIALIDADE (nomeEspeci)
VALUES ('Acupuntura'), 
	   ('Anestesiologia'), 
	   ('Angiologia'), 
	   ('Cardiologia'), 
	   ('Cirurgia Cardiovascular'), 
	   ('Cirurgia da Mão'), 
	   ('Cirurgia do Aparelho Digestivo'), 
	   ('Cirurgia Geral'), 
	   ('Cirurgia Pediátrica'), 
	   ('Cirurgia Plástica'), 
	   ('Cirurgia Torácica'), 
	   ('Cirurgia Vascular'), 
	   ('Dermatologia'), 
	   ('Radioterapia'), 
	   ('Urologia'), 
	   ('Pediatria'), 
	   ('Psiquiatria')

INSERT INTO TIPOUSUARIO(sigla, tipoUsuario)
VALUES ('ADM', 'Administrador'),
	   ('PAC', 'Paciente'),
	   ('MED', 'Médico')

INSERT INTO USUARIO (email, sigla, nomeUsuario, senhaUsuario)
VALUES ('rafael.pecanha@spmedicalgroup.com.br', 'MED', 'Rafael', '111'),
	   ('jaime.palilo@spmedicalgroup.com.br', 'MED', 'Jaime', '222'),
	   ('davi.soares@spmedicalgroup.com.br', 'MED', 'Davi', '333'), 
	   ('yurichiba1@gmail.com', 'PAC', 'Yuri', '444'),
	   ('henrique.megazord@outlook.com', 'PAC', 'Henrique', '555'),
	   ('grande.mateus@gmail.com', 'PAC', 'Mateus', '666'),
	   ('pedro.gueiros@outlook.com', 'ADM', 'Pedro', '777'),
	   ('dietrich17@gmail.com', 'PAC', 'Laura', '888'),
	   ('emanuele.pacheco@outlock.com', 'PAC', 'Emanuele', '999'),
	   ('aymbere.ponzetto@conexaodigital.com', 'ADM', 'Renato', '100')

INSERT INTO MEDICO (idClinica, idEspecialidade, email, nomeMed, crmMed)
VALUES (1, 4, 'rafael.pecanha@spmedicalgroup.com.br', 'Rafael Peçanha', '54356-SP'),
       (1, 6, 'jaime.palilo@spmedicalgroup.com.br', 'Jaime Palilo', '53452-SP'),
	   (1, 1, 'davi.soares@spmedicalgroup.com.br', 'Davi Soares', '65463-SP')

INSERT INTO PACIENTE (email, nomePac, dataNascPac, telefonePac, rgPac, cpfPac, enderecoPac)
VALUES ('yurichiba1@gmail.com', 'Yuri Mitsugui Chiba', '24/12/2004', '1134567654', '43522543-5', '94839859000', 'Rua Estado de Israel 240, São Paulo, Estado de São Paulo, 04022-000'),
	   ('henrique.megazord@outlook.com', 'Henrique Ohnesorge Costa', '10/03/2005', '11987656543', '32654345-7', '73556944057', 'Av. Paulista, 1578 - Bela Vista, São Paulo - SP, 01310-200'),
	   ('grande.mateus@gmail.com', 'Mateus Elias Barros', '18/03/2005', '11972084453', '54636525-3', '16839338002', 'Av. Ibirapuera - Indianópolis, 2927, São Paulo - SP, 04029-200'),
	   ('pedro.gueiros@outlook.com', 'Pedro Bueno Gueiros', '24/03/2004', '1134566543', '54366362-5', '14332654765', 'R. Vitória, 120 - Vila Sao Jorge, Barueri - SP, 06402-030'),
	   ('dietrich17@gmail.com', 'Laura Barros Villar Dietrich', '23/07/2004', '1176566377', '53254444-1', '91305348010', 'R. Ver. Geraldo de Camargo, 66 - Santa Luzia, Ribeirão Pires - SP, 09405-380'),
	   ('emanuele.pacheco@outlock.com', 'Emanuele Pacheco da Rocha', '05/03/2003', '11954368769', '54566266-7', '79799299004', 'Alameda dos Arapanés, 945 - Indianópolis, São Paulo - SP, 04524-001'),
	   ('aymbere.ponzetto@conexaodigital.com', 'Renato Ponzetto Aymbere', '21/03/2007', '13771913039', '54566266-8', '13771913039', 'R Sao Antonio, 232 - Vila Universal, Barueri - SP, 06407-140')

INSERT INTO CONSULTA(idMedico, idPaciente, situacao, dataConsulta)
VALUES (1,1,'Realizada','20/01/2020 15:00'),
	   (3,2,'Cancelada','06/01/2020 10:00'),
	   (2,1,'Realizada','07/02/2020 11:00'),
	   (3,3,'Realizada','06/02/2018 10:00'),
	   (1,5,'Cancelada','07/02/2019 11:00'),
	   (3,6,'Agendada','08/03/2020 15:00')

--Importei a tabela de situacao
SELECT * FROM SITUACAO