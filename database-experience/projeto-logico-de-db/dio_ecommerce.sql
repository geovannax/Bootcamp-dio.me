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

 Date: 15/09/2022 20:15:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Cartões
-- ----------------------------
DROP TABLE IF EXISTS `Cartões`;
CREATE TABLE `Cartões`  (
  `idCartões` int NOT NULL AUTO_INCREMENT,
  `Número` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Data Validade` date NOT NULL,
  `Nome do cartão` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Cliente_idCliente` int NOT NULL,
  PRIMARY KEY (`idCartões`, `Cliente_idCliente`) USING BTREE,
  INDEX `fk_Cartões_Cliente1_idx`(`Cliente_idCliente`) USING BTREE,
  CONSTRAINT `fk_Cartões_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `Cliente` (`idCliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Cartões
-- ----------------------------
INSERT INTO `Cartões` VALUES (2, '1111 1111 1111 1111', '2022-09-15', 'João Silva', 1);
INSERT INTO `Cartões` VALUES (3, '2222 2222 2222 2222', '2022-09-29', 'Maria Silva', 2);
INSERT INTO `Cartões` VALUES (4, '3333 3333 3333 3333', '2022-10-12', 'Livia Silva', 3);

-- ----------------------------
-- Table structure for Categoria
-- ----------------------------
DROP TABLE IF EXISTS `Categoria`;
CREATE TABLE `Categoria`  (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `Categoria` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`idCategoria`) USING BTREE,
  INDEX `Categoria`(`Categoria`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Categoria
-- ----------------------------
INSERT INTO `Categoria` VALUES (3, 'Carro');
INSERT INTO `Categoria` VALUES (2, 'Esporte');
INSERT INTO `Categoria` VALUES (1, 'Geek');

-- ----------------------------
-- Table structure for Cliente
-- ----------------------------
DROP TABLE IF EXISTS `Cliente`;
CREATE TABLE `Cliente`  (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Identificação` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `idCliente Tipo` int NOT NULL,
  PRIMARY KEY (`idCliente`) USING BTREE,
  INDEX `Nome`(`Nome`) USING BTREE,
  INDEX `fk_Cliente_Cliente Tipo1_idx`(`idCliente Tipo`) USING BTREE,
  CONSTRAINT `fk_Cliente_Cliente Tipo1` FOREIGN KEY (`idCliente Tipo`) REFERENCES `Cliente Tipo` (`idCliente Tipo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Cliente
-- ----------------------------
INSERT INTO `Cliente` VALUES (1, 'João Silva', 'Teste 1', 1);
INSERT INTO `Cliente` VALUES (2, 'Maria Silva', 'Teste 2', 1);
INSERT INTO `Cliente` VALUES (3, 'Livia Silva', 'Teste 3', 2);

-- ----------------------------
-- Table structure for Cliente Endereço
-- ----------------------------
DROP TABLE IF EXISTS `Cliente Endereço`;
CREATE TABLE `Cliente Endereço`  (
  `idCliente Endereço` int NOT NULL AUTO_INCREMENT,
  `CEP` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Número` int NOT NULL,
  `Referência` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Complemento` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `idTipo Endereço` int NOT NULL,
  PRIMARY KEY (`idCliente Endereço`, `idTipo Endereço`) USING BTREE,
  INDEX `fk_Cliente Endereço_Tipo Endereço1_idx`(`idTipo Endereço`) USING BTREE,
  CONSTRAINT `fk_Cliente Endereço_Tipo Endereço1` FOREIGN KEY (`idTipo Endereço`) REFERENCES `Tipo Endereço` (`idTipo Endereço`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Cliente Endereço
-- ----------------------------
INSERT INTO `Cliente Endereço` VALUES (1, '11.111-11', 111, 'Padaria', 'Casa A', 1);
INSERT INTO `Cliente Endereço` VALUES (2, '22.222-22', 222, 'Bar', 'Apartamento 101', 1);
INSERT INTO `Cliente Endereço` VALUES (3, '33.333-33', 333, 'Matriz', 'Loja', 2);

-- ----------------------------
-- Table structure for Cliente Físico
-- ----------------------------
DROP TABLE IF EXISTS `Cliente Físico`;
CREATE TABLE `Cliente Físico`  (
  `idCliente Físico` int NOT NULL AUTO_INCREMENT,
  `CPF` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `RG` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Cliente_idCliente` int NOT NULL,
  PRIMARY KEY (`idCliente Físico`, `Cliente_idCliente`) USING BTREE,
  INDEX `fk_Cliente Físico_Cliente1_idx`(`Cliente_idCliente`) USING BTREE,
  CONSTRAINT `fk_Cliente Físico_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `Cliente` (`idCliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Cliente Físico
-- ----------------------------
INSERT INTO `Cliente Físico` VALUES (2, '111.111.111-11', '11.111.111-11', 1);
INSERT INTO `Cliente Físico` VALUES (3, '222.222.222-22', '22.222.222-22', 2);

-- ----------------------------
-- Table structure for Cliente Juridico
-- ----------------------------
DROP TABLE IF EXISTS `Cliente Juridico`;
CREATE TABLE `Cliente Juridico`  (
  `idCliente Juridico` int NOT NULL AUTO_INCREMENT,
  `CNPJ` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Cliente_idCliente` int NOT NULL,
  PRIMARY KEY (`idCliente Juridico`, `Cliente_idCliente`) USING BTREE,
  INDEX `fk_Cliente Juridico_Cliente1_idx`(`Cliente_idCliente`) USING BTREE,
  CONSTRAINT `fk_Cliente Juridico_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `Cliente` (`idCliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Cliente Juridico
-- ----------------------------
INSERT INTO `Cliente Juridico` VALUES (1, '33.333.333/0001-33', 3);

-- ----------------------------
-- Table structure for Cliente Tipo
-- ----------------------------
DROP TABLE IF EXISTS `Cliente Tipo`;
CREATE TABLE `Cliente Tipo`  (
  `idCliente Tipo` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`idCliente Tipo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Cliente Tipo
-- ----------------------------
INSERT INTO `Cliente Tipo` VALUES (1, 'PF');
INSERT INTO `Cliente Tipo` VALUES (2, 'PJ');

-- ----------------------------
-- Table structure for Entrega
-- ----------------------------
DROP TABLE IF EXISTS `Entrega`;
CREATE TABLE `Entrega`  (
  `idEntrega` int NOT NULL AUTO_INCREMENT,
  `Codigo de Rastreio` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `idStatus Entrega` int NOT NULL,
  PRIMARY KEY (`idEntrega`) USING BTREE,
  INDEX `fk_Entrega_Status Entrega1_idx`(`idStatus Entrega`) USING BTREE,
  CONSTRAINT `fk_Entrega_Status Entrega1` FOREIGN KEY (`idStatus Entrega`) REFERENCES `Status Entrega` (`idStatus Entrega`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Entrega
-- ----------------------------
INSERT INTO `Entrega` VALUES (1, 'BR11111111111', 1);
INSERT INTO `Entrega` VALUES (2, 'BR22222222222', 2);
INSERT INTO `Entrega` VALUES (3, 'BR33333333333', 3);

-- ----------------------------
-- Table structure for Estoque
-- ----------------------------
DROP TABLE IF EXISTS `Estoque`;
CREATE TABLE `Estoque`  (
  `idEstoque` int NOT NULL AUTO_INCREMENT,
  `CEP` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Número` int NOT NULL,
  PRIMARY KEY (`idEstoque`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Estoque
-- ----------------------------
INSERT INTO `Estoque` VALUES (1, '11.111-11', 101);
INSERT INTO `Estoque` VALUES (2, '22.222-22', 102);

-- ----------------------------
-- Table structure for Fornecedor
-- ----------------------------
DROP TABLE IF EXISTS `Fornecedor`;
CREATE TABLE `Fornecedor`  (
  `idFornecedor` int NOT NULL AUTO_INCREMENT,
  `Razão Social` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CNPJ` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`idFornecedor`) USING BTREE,
  INDEX `CNPJ`(`CNPJ`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Fornecedor
-- ----------------------------
INSERT INTO `Fornecedor` VALUES (1, 'Fornecedor 1', '11.111.111/0001-11');
INSERT INTO `Fornecedor` VALUES (2, 'Fornecedor 2', '22.222.222/0001.22');

-- ----------------------------
-- Table structure for Pagamento
-- ----------------------------
DROP TABLE IF EXISTS `Pagamento`;
CREATE TABLE `Pagamento`  (
  `idPagamento` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'CARTÃO\nBOLETO\nPIX\n',
  PRIMARY KEY (`idPagamento`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Pagamento
-- ----------------------------
INSERT INTO `Pagamento` VALUES (1, 'Cartão Credito');
INSERT INTO `Pagamento` VALUES (2, 'Cartão Debito');
INSERT INTO `Pagamento` VALUES (3, 'Boleto');
INSERT INTO `Pagamento` VALUES (4, 'Pix');

-- ----------------------------
-- Table structure for Pedido
-- ----------------------------
DROP TABLE IF EXISTS `Pedido`;
CREATE TABLE `Pedido`  (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `Descrição` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Frete` float NOT NULL,
  `idCliente` int NOT NULL,
  `idPagamento` int NOT NULL,
  `idEntrega` int NOT NULL,
  PRIMARY KEY (`idPedido`) USING BTREE,
  INDEX `fk_Pedido_Cliente_idx`(`idCliente`) USING BTREE,
  INDEX `fk_Pedido_Pagamento1_idx`(`idPagamento`) USING BTREE,
  INDEX `fk_Pedido_Entrega1_idx`(`idEntrega`) USING BTREE,
  CONSTRAINT `fk_Pedido_Cliente` FOREIGN KEY (`idCliente`) REFERENCES `Cliente` (`idCliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Pedido_Entrega1` FOREIGN KEY (`idEntrega`) REFERENCES `Entrega` (`idEntrega`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Pedido_Pagamento1` FOREIGN KEY (`idPagamento`) REFERENCES `Pagamento` (`idPagamento`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Pedido
-- ----------------------------
INSERT INTO `Pedido` VALUES (1, 'Teste 1', 1.5, 1, 1, 1);
INSERT INTO `Pedido` VALUES (2, 'Teste 2 ', 2.5, 2, 2, 2);
INSERT INTO `Pedido` VALUES (3, 'Teste 3 ', 3.5, 3, 3, 3);

-- ----------------------------
-- Table structure for Produto
-- ----------------------------
DROP TABLE IF EXISTS `Produto`;
CREATE TABLE `Produto`  (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `Descrição` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Valor` float NOT NULL,
  PRIMARY KEY (`idProduto`) USING BTREE,
  INDEX `Valor`(`Valor`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Produto
-- ----------------------------
INSERT INTO `Produto` VALUES (1, 'Mangá X', 15.9);
INSERT INTO `Produto` VALUES (2, 'Bola ', 30.48);
INSERT INTO `Produto` VALUES (3, 'Retrovisor', 101.9);

-- ----------------------------
-- Table structure for Relação Categoria Produto
-- ----------------------------
DROP TABLE IF EXISTS `Relação Categoria Produto`;
CREATE TABLE `Relação Categoria Produto`  (
  `idCategoria` int NOT NULL,
  `idProduto` int NOT NULL,
  PRIMARY KEY (`idCategoria`, `idProduto`) USING BTREE,
  INDEX `fk_Categoria_has_Produto_Produto1_idx`(`idProduto`) USING BTREE,
  INDEX `fk_Categoria_has_Produto_Categoria1_idx`(`idCategoria`) USING BTREE,
  CONSTRAINT `fk_Categoria_has_Produto_Categoria1` FOREIGN KEY (`idCategoria`) REFERENCES `Categoria` (`idCategoria`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Categoria_has_Produto_Produto1` FOREIGN KEY (`idProduto`) REFERENCES `Produto` (`idProduto`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Relação Categoria Produto
-- ----------------------------

-- ----------------------------
-- Table structure for Relação Cliente Endereço
-- ----------------------------
DROP TABLE IF EXISTS `Relação Cliente Endereço`;
CREATE TABLE `Relação Cliente Endereço`  (
  `idCliente` int NOT NULL,
  `idCliente Endereço` int NOT NULL,
  PRIMARY KEY (`idCliente`, `idCliente Endereço`) USING BTREE,
  INDEX `fk_Cliente_has_Cliente Endereço_Cliente Endereço1_idx`(`idCliente Endereço`) USING BTREE,
  INDEX `fk_Cliente_has_Cliente Endereço_Cliente1_idx`(`idCliente`) USING BTREE,
  CONSTRAINT `fk_Cliente_has_Cliente Endereço_Cliente Endereço1` FOREIGN KEY (`idCliente Endereço`) REFERENCES `Cliente Endereço` (`idCliente Endereço`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Cliente_has_Cliente Endereço_Cliente1` FOREIGN KEY (`idCliente`) REFERENCES `Cliente` (`idCliente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Relação Cliente Endereço
-- ----------------------------
INSERT INTO `Relação Cliente Endereço` VALUES (1, 1);
INSERT INTO `Relação Cliente Endereço` VALUES (2, 2);
INSERT INTO `Relação Cliente Endereço` VALUES (3, 3);

-- ----------------------------
-- Table structure for Relação Fornecedor Produto
-- ----------------------------
DROP TABLE IF EXISTS `Relação Fornecedor Produto`;
CREATE TABLE `Relação Fornecedor Produto`  (
  `idFornecedor` int NOT NULL,
  `idProduto` int NOT NULL,
  PRIMARY KEY (`idFornecedor`, `idProduto`) USING BTREE,
  INDEX `fk_Fornecedor_has_Produto_Produto1_idx`(`idProduto`) USING BTREE,
  INDEX `fk_Fornecedor_has_Produto_Fornecedor1_idx`(`idFornecedor`) USING BTREE,
  CONSTRAINT `fk_Fornecedor_has_Produto_Fornecedor1` FOREIGN KEY (`idFornecedor`) REFERENCES `Fornecedor` (`idFornecedor`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Fornecedor_has_Produto_Produto1` FOREIGN KEY (`idProduto`) REFERENCES `Produto` (`idProduto`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Relação Fornecedor Produto
-- ----------------------------
INSERT INTO `Relação Fornecedor Produto` VALUES (1, 1);
INSERT INTO `Relação Fornecedor Produto` VALUES (2, 2);

-- ----------------------------
-- Table structure for Relação Pedido Produto
-- ----------------------------
DROP TABLE IF EXISTS `Relação Pedido Produto`;
CREATE TABLE `Relação Pedido Produto`  (
  `idPedido` int NOT NULL,
  `idProduto` int NOT NULL,
  `Quantidade` int NOT NULL,
  PRIMARY KEY (`idPedido`, `idProduto`) USING BTREE,
  INDEX `fk_Pedido_has_Produto_Produto1_idx`(`idProduto`) USING BTREE,
  INDEX `fk_Pedido_has_Produto_Pedido1_idx`(`idPedido`) USING BTREE,
  INDEX `Quantidade`(`Quantidade`) USING BTREE,
  CONSTRAINT `fk_Pedido_has_Produto_Pedido1` FOREIGN KEY (`idPedido`) REFERENCES `Pedido` (`idPedido`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Pedido_has_Produto_Produto1` FOREIGN KEY (`idProduto`) REFERENCES `Produto` (`idProduto`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Relação Pedido Produto
-- ----------------------------
INSERT INTO `Relação Pedido Produto` VALUES (1, 1, 1);
INSERT INTO `Relação Pedido Produto` VALUES (2, 2, 2);
INSERT INTO `Relação Pedido Produto` VALUES (3, 3, 3);

-- ----------------------------
-- Table structure for Relação Produto Estoque
-- ----------------------------
DROP TABLE IF EXISTS `Relação Produto Estoque`;
CREATE TABLE `Relação Produto Estoque`  (
  `idProduto` int NOT NULL,
  `idEstoque` int NOT NULL,
  `Quantidade` int NOT NULL,
  PRIMARY KEY (`idProduto`, `idEstoque`) USING BTREE,
  INDEX `fk_Produto_has_Estoque_Estoque1_idx`(`idEstoque`) USING BTREE,
  INDEX `fk_Produto_has_Estoque_Produto1_idx`(`idProduto`) USING BTREE,
  INDEX `Quantidade`(`Quantidade`) USING BTREE,
  CONSTRAINT `fk_Produto_has_Estoque_Estoque1` FOREIGN KEY (`idEstoque`) REFERENCES `Estoque` (`idEstoque`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Produto_has_Estoque_Produto1` FOREIGN KEY (`idProduto`) REFERENCES `Produto` (`idProduto`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Relação Produto Estoque
-- ----------------------------
INSERT INTO `Relação Produto Estoque` VALUES (1, 1, 10);
INSERT INTO `Relação Produto Estoque` VALUES (2, 2, 20);

-- ----------------------------
-- Table structure for Relação Terceiro - Vendedor Produto
-- ----------------------------
DROP TABLE IF EXISTS `Relação Terceiro - Vendedor Produto`;
CREATE TABLE `Relação Terceiro - Vendedor Produto`  (
  `idTerceiro - Vendedor` int NOT NULL,
  `idProduto` int NOT NULL,
  `Quantidade` int NOT NULL,
  PRIMARY KEY (`idTerceiro - Vendedor`, `idProduto`) USING BTREE,
  INDEX `fk_Terceiro - Vendedor_has_Produto_Produto1_idx`(`idProduto`) USING BTREE,
  INDEX `fk_Terceiro - Vendedor_has_Produto_Terceiro - Vendedor1_idx`(`idTerceiro - Vendedor`) USING BTREE,
  INDEX `Quantidade`(`Quantidade`) USING BTREE,
  CONSTRAINT `fk_Terceiro - Vendedor_has_Produto_Produto1` FOREIGN KEY (`idProduto`) REFERENCES `Produto` (`idProduto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Terceiro - Vendedor_has_Produto_Terceiro - Vendedor1` FOREIGN KEY (`idTerceiro - Vendedor`) REFERENCES `Terceiro - Vendedor` (`idTerceiro - Vendedor`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Relação Terceiro - Vendedor Produto
-- ----------------------------
INSERT INTO `Relação Terceiro - Vendedor Produto` VALUES (1, 3, 30);

-- ----------------------------
-- Table structure for Status Entrega
-- ----------------------------
DROP TABLE IF EXISTS `Status Entrega`;
CREATE TABLE `Status Entrega`  (
  `idStatus Entrega` int NOT NULL AUTO_INCREMENT,
  `Status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`idStatus Entrega`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Status Entrega
-- ----------------------------
INSERT INTO `Status Entrega` VALUES (1, 'Preparando');
INSERT INTO `Status Entrega` VALUES (2, 'A caminho');
INSERT INTO `Status Entrega` VALUES (3, 'Entregue');

-- ----------------------------
-- Table structure for Terceiro - Vendedor
-- ----------------------------
DROP TABLE IF EXISTS `Terceiro - Vendedor`;
CREATE TABLE `Terceiro - Vendedor`  (
  `idTerceiro - Vendedor` int NOT NULL AUTO_INCREMENT,
  `Razão Social` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CEP` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Número` int NOT NULL,
  PRIMARY KEY (`idTerceiro - Vendedor`) USING BTREE,
  INDEX `Razão Social`(`Razão Social`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Terceiro - Vendedor
-- ----------------------------
INSERT INTO `Terceiro - Vendedor` VALUES (1, 'Fornecedor Terceiro', '33.333-33', 103);

-- ----------------------------
-- Table structure for Tipo Endereço
-- ----------------------------
DROP TABLE IF EXISTS `Tipo Endereço`;
CREATE TABLE `Tipo Endereço`  (
  `idTipo Endereço` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Casa/Serviço\n',
  PRIMARY KEY (`idTipo Endereço`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Tipo Endereço
-- ----------------------------
INSERT INTO `Tipo Endereço` VALUES (1, 'Casa');
INSERT INTO `Tipo Endereço` VALUES (2, 'Trabalho');

SET FOREIGN_KEY_CHECKS = 1;
