CREATE DATABASE Allincare;
USE Allincare;

CREATE TABLE Transportadora(
	idTransportadora INT PRIMARY KEY AUTO_INCREMENT,
	cnpjTransportadora VARCHAR(20),
	nomeFantasia VARCHAR(40),
    nomeRepresentante VARCHAR(40),
	razaoSocial VARCHAR(40),
	login VARCHAR(100),
	senha VARCHAR(18)
);

CREATE TABLE EnderecoTransp(
	idEnd INT PRIMARY KEY AUTO_INCREMENT,
    fkTransportadora INT,
    FOREIGN KEY (fkTransportadora) REFERENCES Transportadora(idTransportadora),
    cepEnd VARCHAR(10),
    numEnd INT,
    complementoEnd VARCHAR(40)
);

CREATE TABLE ContatoTransp(
	idContato INT PRIMARY KEY AUTO_INCREMENT,
    fkTransportadora INT,
    FOREIGN KEY (fkTransportadora) REFERENCES Transportadora(idTransportadora),
    numeroContato BIGINT
); 

CREATE TABLE Veiculo(
	idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
    fkTransportadora INT,
    FOREIGN KEY (fkTransportadora) REFERENCES Transportadora(idTransportadora),
	gps VARCHAR(1),
    CHECK (gps = 'V' OR gps = 'F'),
	placa VARCHAR(10),
	qtdLotesVacina INT,
    qtdDispositivos INT,
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
SELECT * FROM EnderecoTransp;
SELECT * FROM ContatoTransp;
SELECT * FROM Veiculo;
SELECT * FROM Dispositivo;
SELECT * FROM Sensor;
SELECT * FROM Registro;

INSERT INTO Transportadora
VALUES (NULL,'11.111.111/0001-11','FreteBras','Larissa Freitas','FreteBras Internet e Serviços LTDA','fretebras@gmail.com','123frete'),
		(NULL,'22.222.222/0001-22','Loggi','Fabiano Rodrigues','Loggi Tecnologia LTDA','loggi@gmail.com','123loggi'),
        (NULL,'33.333.333/0001-33','Lalamove','Cecília Almeida','LALAMOVE TECNOLOGIA (BRASIL) LTDA','lalamove@gmail.com','123lalamove');
        
INSERT INTO EnderecoTransp
VALUES (NULL,'1','89872-000','123','12º Andar'),
		(NULL,'2','89843-000','87','Bloco 5'),
        (NULL,'3','89859-000','3245','3º Andar');
        
INSERT INTO ContatoTransp
VALUES (NULL,'1','11954678342'),
		(NULL,'1','11923779342'),
        (NULL,'2','1192338342'),
        (NULL,'2','11954627653'),
        (NULL,'3','11922278342');
        
INSERT INTO Veiculo
VALUES (NULL,'1','V','QPR3C77','50','2','VUC'),
		(NULL,'1','V','ASD4G56','100','2','Caminhão ¾'),
        (NULL,'2','V','LKJ1O98','150','2','Toco'),
        (NULL,'2','V','BGC5H90','200','2','Truck'),
        (NULL,'3','V','OKJ7L43','250','2','Carreta'),
        (NULL,'3','V','UHJ9M32','300','2','Caminhão combinado');
        
INSERT INTO Dispositivo
VALUES (NULL,'1','Arduíno UNO','Carroceria','V'),
		(NULL,'1','Arduíno UNO','Traseira','V'),
        (NULL,'2','Arduíno UNO','Carroceria','V'),
        (NULL,'2','Arduíno UNO','Traseira','V'),
        (NULL,'3','Arduíno UNO','Carroceria','V'),
        (NULL,'3','Arduíno UNO','Traseira','V');
        
INSERT INTO Sensor
VALUES (NULL,'1','LM35','Temperatura',NULL),
		(NULL,'1','LM35','Temperatura',NULL),
        (NULL,'2','LM35','Temperatura',NULL),
        (NULL,'2','LM35','Temperatura',NULL),
        (NULL,'3','LM35','Temperatura',NULL),
        (NULL,'3','LM35','Temperatura',NULL);
        
INSERT INTO Registro
VALUES (NULL,'1','32°',CURRENT_TIMESTAMP),
		(NULL,'1','3°',CURRENT_TIMESTAMP),
        (NULL,'2','12°',CURRENT_TIMESTAMP),
        (NULL,'2','40°',CURRENT_TIMESTAMP),
        (NULL,'3','7°',CURRENT_TIMESTAMP),
        (NULL,'3','15°',CURRENT_TIMESTAMP);
