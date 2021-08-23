CREATE DATABASE SP_MEDICAL_GROUP
GO

USE SP_MEDICAL_GROUP
GO

CREATE TABLE CLINICA(
	idClinica INT PRIMARY KEY IDENTITY(1,1),
	nomeFantasiaClinica VARCHAR(30) NOT NULL UNIQUE,
	razaoSocialClinica VARCHAR(30) NOT NULL,
	enderecoClinica VARCHAR(200) NOT NULL UNIQUE,
	horarioAbreClinica TIME,
	horarioFechaClinica TIME,
	cnpjClinica VARCHAR(14) NOT NULL UNIQUE
)
GO

CREATE TABLE ESPECIALIDADE(
	idEspecialidade SMALLINT PRIMARY KEY IDENTITY(1,1),
	nomeEspeci VARCHAR(31) NOT NULL UNIQUE
)
GO

CREATE TABLE TIPOUSUARIO(
	sigla VARCHAR(3) PRIMARY KEY NOT NULL,
	tipoUsuario VARCHAR(20) NOT NULL UNIQUE
)
GO

CREATE TABLE USUARIO(
	email VARCHAR(256) PRIMARY KEY NOT NULL,
	sigla VARCHAR(3) FOREIGN KEY REFERENCES TIPOUSUARIO(sigla) NOT NULL,
	nomeUsuario VARCHAR(30) NOT NULL UNIQUE,
	senhaUsuario VARCHAR(30) NOT NULL UNIQUE
)
GO

CREATE TABLE MEDICO(
	idMedico INT PRIMARY KEY IDENTITY(1,1),
	idClinica INT FOREIGN KEY REFERENCES CLINICA(idClinica),
	idEspecialidade SMALLINT FOREIGN KEY REFERENCES ESPECIALIDADE(idEspecialidade),
	email VARCHAR(256) FOREIGN KEY REFERENCES USUARIO(email),
	nomeMed VARCHAR(100) NOT NULL,
	crmMed VARCHAR(8) NOT NULL UNIQUE
)
GO

CREATE TABLE PACIENTE(
	idPaciente INT PRIMARY KEY IDENTITY(1,1),
	email VARCHAR(256) FOREIGN KEY REFERENCES USUARIO(email),
	nomePac VARCHAR(100) NOT NULL,
	dataNascPac DATE NOT NULL,
	telefonePac VARCHAR(13),
	rgPac VARCHAR(10) NOT NULL UNIQUE,
	cpfPac VARCHAR(11) NOT NULL UNIQUE,
	enderecoPac VARCHAR(200) NOT NULL 
)
GO

CREATE TABLE SITUACAO(
	situacao VARCHAR(10) PRIMARY KEY
)

CREATE TABLE CONSULTA(
	idConsulta INT PRIMARY KEY IDENTITY(1,1),
	idMedico INT FOREIGN KEY REFERENCES MEDICO(idMedico),
	idPaciente INT FOREIGN KEY REFERENCES PACIENTE(idPaciente),
	situacao VARCHAR(10) FOREIGN KEY REFERENCES SITUACAO(situacao) NOT NULL,
	dataConsulta DATETIME NOT NULL,
	valor MONEY DEFAULT '50.00',
	descricao VARCHAR(200)
)
GO

CREATE PROCEDURE MedicoPorEspecialidade
    @idEspecialidade INT
AS
BEGIN
    SELECT COUNT(*) FROM Medico
    INNER JOIN Especialidade
    ON Medico.idEspecialidade = Especialidade.idEspecialidade
    WHERE Medico.idEspecialidade = @idEspecialidade
END

CREATE PROCEDURE CalcularIdade
    @idPaciente INT = NULL
AS

BEGIN
    DECLARE @DataNascPac DATE
    SET @DataNascPac = (SELECT dataNascPac FROM PACIENTE
                     WHERE idPaciente = @idPaciente)
    DECLARE @Idade TINYINT
    SET @Idade = DATEDIFF( YEAR, @DataNascPac, GETDATE() )

    PRINT @Idade
END