create database ficha_e;
use ficha_e;


/*----------SCRIPT PARA USUARIO----------*/
CREATE TABLE TB_USUARIO (
  ID_USUARIO int(11) NOT NULL AUTO_INCREMENT,
  USUARIO varchar(45) NOT NULL,
  SENHA varchar(45) NOT NULL,
  CONFIRMAR_SENHA varchar(45) NOT NULL,
  PERFIL_ACESSO varchar(20) NOT NULL,
  STATUS_USUARIO varchar(20) NOT NULL,
  ID_TIPO_USUARIO int(11) NOT NULL,
  CPF varchar(11) NOT NULL,
  ENDERECO varchar(120) NOT NULL,
  TELEFONE varchar(45) NOT NULL,
  NOME varchar(120) DEFAULT NULL,
  EMAIL varchar(120) DEFAULT NULL,
  DATA_INCLUSAO datetime DEFAULT NULL,
  PRIMARY KEY (ID_USUARIO,CPF),
  UNIQUE KEY CPF_UNIQUE  (CPF),
  CONSTRAINT U_USERNAME UNIQUE (USUARIO)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Tabela Tipo Usuario
CREATE TABLE TB_TIPO_USUARIO (
  ID_TIPO_USUARIO int(11) NOT NULL AUTO_INCREMENT,
  NOME varchar(20) NOT NULL,
  DESCRICAO varchar(120) DEFAULT NULL,
  DATA_INCLUSAO datetime DEFAULT NULL,
  PRIMARY KEY (ID_TIPO_USUARIO)
);

-- Inserts
INSERT INTO TB_TIPO_USUARIO VALUES
('1', 'Nutricionista', 'Responsavel pela parte tecnica', '2015-10-01 00:00:00');
INSERT INTO TB_TIPO_USUARIO VALUES
('2', 'Gerente', '', '2015-10-01 00:00:00');
INSERT INTO TB_TIPO_USUARIO VALUES
('3', 'Estagiario', '', '2015-10-01 00:00:00');
INSERT INTO TB_TIPO_USUARIO VALUES
('4', 'Funcionario', '', '2015-10-01 00:00:00');
INSERT INTO TB_TIPO_USUARIO VALUES
('5', 'Proprietario', '', '2015-10-01 00:00:00');

INSERT INTO TB_USUARIO
(ID_USUARIO,USUARIO,SENHA, CONFIRMAR_SENHA, PERFIL_ACESSO,STATUS_USUARIO,ID_TIPO_USUARIO, CPF,ENDERECO,TELEFONE,NOME,EMAIL,DATA_INCLUSAO)
VALUES
('10', 'admin', 'admin', 'admin', 'ADMINISTRADOR', 'ATIVO', '1', '89547042718', 'r. pitangueiras, n88', '82828787','Raissa', 'email.bacana@gmail.com', '2015-10-01 00:00:00');


/*----------SCRIPT PARA INGRDIENTES----------*/
CREATE TABLE `TB_INGREDIENTES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_EMPRESA` int(11) DEFAULT NULL COMMENT 'Será necessário para quando tiver empresas',
  `COD` int(11) NOT NULL,
  `DESCRICAO` varchar(140) NOT NULL,
  `CARBOIDRATOS` decimal(10,2) DEFAULT NULL,
  `KCAL_CARBOIDRATOS` decimal(10,2) DEFAULT NULL,
  `PROTEINAS` decimal(10,2) DEFAULT NULL,
  `KCAL_PROTEINAS` decimal(10,2) DEFAULT NULL,
  `LIPIDIOS` decimal(10,2) DEFAULT NULL,
  `KCAL_LIPIDIOS` decimal(10,2) DEFAULT NULL,
  `FATOR_CORRECAO` decimal(10,2) DEFAULT NULL,
  `INDICE_COCCAO` decimal(10,2) DEFAULT NULL,
  `CUSTO` decimal(10,2) DEFAULT NULL,
  `UNIDADE_MEDIDA` varchar(140) NOT NULL,
  `DATA_INSERCAO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `COD_UNIQUE` (`COD`),
  KEY `IX_IDS` (`ID_EMPRESA`,`COD`),
  KEY `IX_DATA` (`DATA_INSERCAO`,`COD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*----------UNIDADE DE MEDIDA----------*/
-- Tabela Unidade Medida Caseira
CREATE TABLE `TB_UNIDADE_MEDIDA_CASEIRA` (
  `ID_UNIDADE_MEDIDA_CASEIRA` INT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(120) NULL ,
  `SIGLA` VARCHAR(10) NULL ,
  PRIMARY KEY (`ID_UNIDADE_MEDIDA_CASEIRA`)  );

 -- Tabela Unidade Medida 
CREATE TABLE `TB_UNIDADE_MEDIDA` (
  `ID_UNIDADE_MEDIDA` INT NOT NULL AUTO_INCREMENT ,
  `UNIDADE_MEDIDA` VARCHAR(60) NULL ,
  `MEDIDA_CONVERSAO` VARCHAR(60) NULL ,
  `SIGLA_UNIDADE_MEDIDA` VARCHAR(10) NULL ,
  `FATOR_CONVERSAO` DOUBLE NULL  ,
  PRIMARY KEY (`ID_UNIDADE_MEDIDA`) );
  
  
  /*----------EMPRESA----------*/
  CREATE TABLE TB_EMPRESA (
  ID_EMPRESA int(11) NOT NULL AUTO_INCREMENT,
  CNPJ varchar(45) NOT NULL,
  TELEFONE varchar(45) NOT NULL,
  NOME varchar(45) NOT NULL,
  ENDERECO varchar(20) NOT NULL,
  CIDADE varchar(20) NOT NULL,
  UF char(2) NOT NULL,
  RAZAO_SOCIAL VARCHAR(45) NOT NULL,
  RESPONSAVEL varchar(11) NOT NULL,
  LOGO varchar(255),
  DATA_INCLUSAO datetime DEFAULT NULL,
  PRIMARY KEY (ID_EMPRESA,CNPJ),
  UNIQUE KEY CPF_UNIQUE  (CNPJ),
  CONSTRAINT U_USERNAME UNIQUE (NOME)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

INSERT INTO TB_EMPRESA
(ID_EMPRESA, CNPJ, TELEFONE, NOME, ENDERECO, CIDADE, UF, RAZAO_SOCIAL, RESPONSAVEL, LOGO, DATA_INCLUSAO)
VALUES
('10', '17338792000101', '5199677239', 'Go Horse Solu��es', 'r. das empresas, 69', 'Ponta Grossa', 'RS', 'Socialista Racional', 'Hortencia', null, '2015-10-01 00:00:00');


/*----------SCRIPT FICHA ----------*/

CREATE TABLE `TB_FICHA` (
  `ID_FICHA` INT NOT NULL AUTO_INCREMENT,
  `ID_EMPRESA` INT  NULL,
  `NOME` VARCHAR(45) NULL,
  `RENDIMENTO` VARCHAR(45) NULL,
  `FOTO` VARCHAR(255) NULL,
  `MODO_PREPARO` TEXT(2048) NULL,
  `MONTAGEM` TEXT(2048) NULL,
  `ORIENTACOES_ARMAZENAMENTO` TEXT(2048) NULL,
  `TIPO_FICHA` CHAR(1) NOT NULL,
  -- Tabela Ficha (aspectos exclusivos da completa): serao omitidos da simplificada
  `TEXTURA` TEXT(1024) NULL,
  `SABOR` TEXT(1024) NULL,
  `APRESENTACAO` TEXT(1024) NULL,
  PRIMARY KEY (`ID_FICHA`));

-- TABELA ITEM DA FICHA
CREATE TABLE `TB_FICHA_ITEM` (
  `ID_FICHA_ITEM` INT NOT NULL AUTO_INCREMENT,
  `ID_UNIDADE_MEDIDA` INT(11) NOT NULL,
  `ID_MEDIDA_CASEIRA` INT(11) NOT NULL,
  `ID_INGREDIENTE` INT(11) NOT NULL,
  `ID_FICHA` INT NOT NULL,
  `QUANTIDADE_UNIDADE_MEDIDA` INT NULL,
  `QUANTIDADE_MEDIDA_CASEIRA` INT NULL,
  -- Item da ficha (aspectos exclusivos da completa): serao omitidos da simplificada
  `PER_CAPITA` decimal(10,2) DEFAULT NULL,-- N�o sabemos exatamente o que � :v
  `VALOR_UNIT` decimal(10,2) DEFAULT NULL,
  
   PRIMARY KEY (`ID_FICHA_ITEM`),
    FOREIGN KEY (`ID_UNIDADE_MEDIDA`) REFERENCES `FICHA_E`.`TB_UNIDADE_MEDIDA` (`ID_UNIDADE_MEDIDA`),
    FOREIGN KEY (`ID_MEDIDA_CASEIRA`) REFERENCES `FICHA_E`.`TB_UNIDADE_MEDIDA_CASEIRA` (`ID_UNIDADE_MEDIDA_CASEIRA`),
    FOREIGN KEY (`ID_INGREDIENTE`) REFERENCES `FICHA_E`.`TB_INGREDIENTES` (`ID`),
    FOREIGN KEY (`ID_FICHA`) REFERENCES `FICHA_E`.`TB_FICHA` (`ID_FICHA`)
	);