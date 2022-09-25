/*
 Navicat Premium Data Transfer

 Source Server         : WSL Ubuntu 20.04
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : 127.0.0.1:3306
 Source Schema         : dio

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 15/09/2022 21:22:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Autorização
-- ----------------------------
DROP TABLE IF EXISTS `Autorização`;
CREATE TABLE `Autorização`  (
  `idAutorização` int NOT NULL AUTO_INCREMENT,
  `Status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Autorizado pelo cliente\nNão autorizado pelo cliente',
  PRIMARY KEY (`idAutorização`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Autorização
-- ----------------------------
INSERT INTO `Autorização` VALUES (1, 'Autorizado');
INSERT INTO `Autorização` VALUES (2, 'Não Autorizado');

-- ----------------------------
-- Table structure for Carro
-- ----------------------------
DROP TABLE IF EXISTS `Carro`;
CREATE TABLE `Carro`  (
  `idCarro` int NOT NULL AUTO_INCREMENT,
  `Modelo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Placa` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `idCliente` int NOT NULL,
  `idStatus` int NOT NULL,
  `idEquipe` int NOT NULL,
  PRIMARY KEY (`idCarro`) USING BTREE,
  INDEX `fk_Carro_Cliente_idx`(`idCliente`) USING BTREE,
  INDEX `fk_Carro_Tipo Serviço1_idx`(`idStatus`) USING BTREE,
  INDEX `fk_Carro_Equipe1_idx`(`idEquipe`) USING BTREE,
  CONSTRAINT `fk_Carro_Cliente` FOREIGN KEY (`idCliente`) REFERENCES `Cliente` (`idCliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Carro_Equipe1` FOREIGN KEY (`idEquipe`) REFERENCES `Equipe` (`idEquipe`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Carro_Tipo Serviço1` FOREIGN KEY (`idStatus`) REFERENCES `Tipo Serviço` (`idStatus`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Carro
-- ----------------------------
INSERT INTO `Carro` VALUES (1, 'Civic', 'AAA1234', 1, 1, 1);
INSERT INTO `Carro` VALUES (2, 'Gol', 'BBB1234', 2, 1, 2);
INSERT INTO `Carro` VALUES (3, 'Civic', 'CCC1234', 3, 2, 3);

-- ----------------------------
-- Table structure for Cliente
-- ----------------------------
DROP TABLE IF EXISTS `Cliente`;
CREATE TABLE `Cliente`  (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Telefone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`idCliente`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Cliente
-- ----------------------------
INSERT INTO `Cliente` VALUES (1, 'Geovanna Reis', '(11) 9-1111-1111');
INSERT INTO `Cliente` VALUES (2, 'Lucia Silva', '(22) 9-2222-2222');
INSERT INTO `Cliente` VALUES (3, 'Bruna Silva', '(33) 9-3333-3333');

-- ----------------------------
-- Table structure for Equipe
-- ----------------------------
DROP TABLE IF EXISTS `Equipe`;
CREATE TABLE `Equipe`  (
  `idEquipe` int NOT NULL AUTO_INCREMENT,
  `Nome da equipe` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`idEquipe`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Equipe
-- ----------------------------
INSERT INTO `Equipe` VALUES (1, 'Equipe João');
INSERT INTO `Equipe` VALUES (2, 'Equipe Pedro');
INSERT INTO `Equipe` VALUES (3, 'Equipe Alan');

-- ----------------------------
-- Table structure for Especialidades
-- ----------------------------
DROP TABLE IF EXISTS `Especialidades`;
CREATE TABLE `Especialidades`  (
  `idEspecialidades` int NOT NULL AUTO_INCREMENT,
  `Especialidade` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `idMecanicos` int NOT NULL,
  PRIMARY KEY (`idEspecialidades`) USING BTREE,
  INDEX `fk_Especialidades_Mecanicos1_idx`(`idMecanicos`) USING BTREE,
  CONSTRAINT `fk_Especialidades_Mecanicos1` FOREIGN KEY (`idMecanicos`) REFERENCES `Mecanicos` (`idMecanicos`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Especialidades
-- ----------------------------
INSERT INTO `Especialidades` VALUES (1, 'Motor', 1);
INSERT INTO `Especialidades` VALUES (2, 'Pintura', 2);
INSERT INTO `Especialidades` VALUES (3, 'Motor', 3);
INSERT INTO `Especialidades` VALUES (4, 'Pintura', 4);
INSERT INTO `Especialidades` VALUES (5, 'Eletricista', 5);

-- ----------------------------
-- Table structure for Mecanicos
-- ----------------------------
DROP TABLE IF EXISTS `Mecanicos`;
CREATE TABLE `Mecanicos`  (
  `idMecanicos` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Endereço` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `idEquipe` int NOT NULL,
  PRIMARY KEY (`idMecanicos`) USING BTREE,
  INDEX `fk_Mecanicos_Equipe1_idx`(`idEquipe`) USING BTREE,
  CONSTRAINT `fk_Mecanicos_Equipe1` FOREIGN KEY (`idEquipe`) REFERENCES `Equipe` (`idEquipe`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Mecanicos
-- ----------------------------
INSERT INTO `Mecanicos` VALUES (1, 'Luiz', 'Rua X, Nº 1', 1);
INSERT INTO `Mecanicos` VALUES (2, 'Souza', 'Rua Y, Nº 2', 1);
INSERT INTO `Mecanicos` VALUES (3, 'Neto', 'Rua A, Nº 3', 2);
INSERT INTO `Mecanicos` VALUES (4, 'Maycon', 'Rua B, Nº 4', 2);
INSERT INTO `Mecanicos` VALUES (5, 'Bruno', 'Rua C, Nº 5', 3);

-- ----------------------------
-- Table structure for OS
-- ----------------------------
DROP TABLE IF EXISTS `OS`;
CREATE TABLE `OS`  (
  `idOS` int NOT NULL AUTO_INCREMENT,
  `data de emissão` date NOT NULL,
  `data para conclusão` date NULL DEFAULT NULL,
  `Valor Peças` float NULL DEFAULT NULL,
  `idStatus OS` int NOT NULL,
  `idEquipe` int NOT NULL,
  `idAutorização` int NOT NULL,
  PRIMARY KEY (`idOS`) USING BTREE,
  INDEX `fk_OS_Status OS1_idx`(`idStatus OS`) USING BTREE,
  INDEX `fk_OS_Equipe1_idx`(`idEquipe`) USING BTREE,
  INDEX `fk_OS_Autorização1_idx`(`idAutorização`) USING BTREE,
  CONSTRAINT `fk_OS_Autorização1` FOREIGN KEY (`idAutorização`) REFERENCES `Autorização` (`idAutorização`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_OS_Equipe1` FOREIGN KEY (`idEquipe`) REFERENCES `Equipe` (`idEquipe`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_OS_Status OS1` FOREIGN KEY (`idStatus OS`) REFERENCES `Status OS` (`idStatus OS`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of OS
-- ----------------------------
INSERT INTO `OS` VALUES (1, '2022-09-15', '2022-10-03', 60, 1, 1, 1);
INSERT INTO `OS` VALUES (2, '2022-09-16', '2022-10-27', 70.5, 1, 2, 2);
INSERT INTO `OS` VALUES (3, '2022-09-14', '2022-09-22', 87.9, 2, 3, 1);

-- ----------------------------
-- Table structure for Serviços
-- ----------------------------
DROP TABLE IF EXISTS `Serviços`;
CREATE TABLE `Serviços`  (
  `idServiços` int NOT NULL AUTO_INCREMENT,
  `serviço` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `valor` float NOT NULL,
  `idOS` int NOT NULL,
  PRIMARY KEY (`idServiços`) USING BTREE,
  INDEX `fk_Serviços_OS1_idx`(`idOS`) USING BTREE,
  CONSTRAINT `fk_Serviços_OS1` FOREIGN KEY (`idOS`) REFERENCES `OS` (`idOS`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Serviços
-- ----------------------------
INSERT INTO `Serviços` VALUES (1, 'Lanternagem', 50.8, 1);
INSERT INTO `Serviços` VALUES (2, 'Vidraçaria', 40.6, 2);
INSERT INTO `Serviços` VALUES (3, 'Eletrico', 80.4, 3);

-- ----------------------------
-- Table structure for Status OS
-- ----------------------------
DROP TABLE IF EXISTS `Status OS`;
CREATE TABLE `Status OS`  (
  `idStatus OS` int NOT NULL AUTO_INCREMENT,
  `Status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`idStatus OS`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Status OS
-- ----------------------------
INSERT INTO `Status OS` VALUES (1, 'Andamento');
INSERT INTO `Status OS` VALUES (2, 'Finalizada');

-- ----------------------------
-- Table structure for Tipo Serviço
-- ----------------------------
DROP TABLE IF EXISTS `Tipo Serviço`;
CREATE TABLE `Tipo Serviço`  (
  `idStatus` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Tipos: consertados ou revisões  periódicas',
  PRIMARY KEY (`idStatus`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Tipo Serviço
-- ----------------------------
INSERT INTO `Tipo Serviço` VALUES (1, 'Consertato');
INSERT INTO `Tipo Serviço` VALUES (2, 'Revisão');

SET FOREIGN_KEY_CHECKS = 1;
