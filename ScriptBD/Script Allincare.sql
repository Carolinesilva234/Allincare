CREATE DATABASE Allincare;
USE Allincare;

CREATE TABLE Transportadora(
	idTransportadora INT PRIMARY KEY AUTO_INCREMENT,
	cnpjTransportadora VARCHAR(20),
	nomeFantasia VARCHAR(40),
    nomeRepresentante VARCHAR(40),
	razaoSocial VARCHAR(40),
	login VARCHAR(100),
	telefone VARCHAR(11),
	senha VARCHAR(18),
	cepEndereco VARCHAR(10),
	numEndereco INT
);

CREATE TABLE Veiculo(
	idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
    fkTransportadora INT,
    FOREIGN KEY (fkTransportadora) REFERENCES Transportadora(idTransportadora),
	gps VARCHAR(1),
    CHECK (gps = 'V' OR gps = 'F'),
	placa VARCHAR(10),
	qtdLotes INT,
    qtdSensores INT,
	modelo VARCHAR(20)
);

CREATE TABLE Dispositivo(
	idDispositivo INT PRIMARY KEY AUTO_INCREMENT,
    fkVeiculo INT,
    FOREIGN KEY (fkVeiculo) REFERENCES Veiculo(idVeiculo),
	nomeDispositivo VARCHAR(60),
    localidade VARCHAR(40),
	ativo VARCHAR(1),
    CHECK (ativo = "V" OR ativo = "F")
);

CREATE TABLE Sensor(
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
	fkDispositivo INT,
    FOREIGN KEY (fkDispositivo) REFERENCES Dispositivo(idDispositivo),
    tipoSensor VARCHAR(40),
    nomeSensor VARCHAR(50),
	descricaoSensor VARCHAR(50)
);

CREATE TABLE Registro(
	idRegistro INT PRIMARY KEY AUTO_INCREMENT,
	fkSensor INT,
    FOREIGN KEY (fkSensor) REFERENCES Sensor(idSensor),
    valorTemperatura VARCHAR(40),
	dataHora DATETIME DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM Transportadora;
SELECT * FROM Veiculo;
SELECT * FROM Dispositivo;
SELECT * FROM Sensor;
SELECT * FROM Registro;