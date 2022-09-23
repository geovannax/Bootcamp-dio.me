<div align="center">

# 📄 Anotações Bootcamp - Database Experience 🎲
## 🔑 Palavras chave para fixação do conteúdo e pontos importantes. 

</div>

### 📌 Contextualização - O que são Banco de dados? 

- Conjunto de dados que transmitem informações
- Representação do mundo real 

### 📌 SGBD -  Sistema de gerenciamento de Banco de dados 

- **Definição:** Tipo de dados, estrutura, quais são as regras
  - Entidades mapeadas para um tipo de estrutura 
  - Descrevem os dados contidos no banco. 
- **Construção:** Inserção de dados 
  - Determina como será feito o acesso a dados 
- **Manipulação:** Gerar relatórios, recuperação.
  - Updates,  consulta de informações, retornar os dados. 
- **Compartilhamento:** Simultaneidade 

*DD - Linguagem de definição de dados*

### 📌 Modelo Relacional 

Um banco de dados relacional é um tipo de banco de dados que armazena e fornece acesso a pontos de dados relacionados entre si. Bancos de dados relacionais são baseados no modelo relacional, uma maneira intuitiva e direta de representar dados em tabelas. Em um banco de dados relacional, cada linha na tabela é um registro com uma ID exclusiva chamada chave. As colunas da tabela contém atributos dos dados e cada registro geralmente tem um valor para cada atributo, facilitando o estabelecimento das relações entre os pontos de dados.

### Storage & Buffer 

- Gerenciamento de armazenamento 
  - Ex.: Movimentar do HD para a memória principal 
- Gerenciamento de Buffer 
  - Ex.: Memória para armazenar páginas de dados
  - Contadores para monitorar a E/S física
  - Extensão do pool de buffers para estender o cache do buffer usando o armazenamento rápido não volátil
  
### 📌 SGBDs mais utilizados pelo mercado 
<p> 1° Oracle - Pioneiro, adotado por grandes corporações. <p/> 
<p> 2° MySQL - Mantido pela Oracle, Open Source. <p/> 
<p> 3° SQL Server - mantido pela Microsoft. <p/>  
<p> 4° PostgreSQL - Open Source <p/>
<p> 5° MongoDB - NoSQL<p/>

### 📌 Tipos de SGBDs NoSQL

- Documentos 
- Wide-Columns 
- Key-Value
- Grafos 
- Orientado a Objeto 

### 📌 Características MongoDB - Orientado a documento 

- Baixa curva de aprendizado
- Baseado em JSON 
- Escalabilidade horizontal 
- Multiplataforma 
- Transações ACID para multi-documentos 
- Consultas - Suporta Javascript 

### 📌 Explorando a abordagem de um SGBD - Isolamento, Auto-descrição, Compartilhamento e Visões 

**Características principais:** Abstração, Auto descritivo, compartilhamento e Visões.
- Natureza Auto Descritiva: 
  - Descrição da estrutura e Constraints 
  - DB Schema
- Isolamento entre Programa/Data e Abstração 
  - Independencia do programa e dados 
- Suporte a múltiplas visões dos dados
  - Fornece perspectivas distintas de um mesmo conjunto de dados 
  - Table Views 
  
### 📌 Compartilhamento de dados e processamento de transações multiusuários. 

**Concurrency Control (Controle de concorrência):** Mecanismo utilizado para permitir acesso concorrente 

*OLTP - Online Transaction Process | Transações de processos em tempo real*

<table>
 <tr> 
   <td>
   
   - Acesso ao SGBD  
   - Cálculo Lógico 
   - Unidade de trabalho 
   
   </td>
   
   <td>
   
   - App Multi User 
   - Gerenciador: Transações concorrentes 
   
   </td>
 </tr>
<table>

 <div align="center">
 
 **EXECUÇÃO SEM INTERFERÊNCIAS ⬅️ ATOMICIDADE**
 
 Executa todo o processo ou cancela a operação 
 </div> 

### 📌 Explorando abordagem de SGBDS - Atores, Workes nos bastidores, vantagens e quando não utilizar.

- **Atores:** Perfis definidos para cenários mais complexos, como em Big Organization.
  - Os atores podem ser Adms, Designers e o usuário final. 
- **Atores Designers:** 
  - Identifica os dados e requisitos 
  - Representação e estrutura 
  - Fase preliminar 
- **Atores - Usuários Finais:**   
  - Acesso categorizado 
  - Pode ser usuário: Casual, ingênuo, sofisticado, Standalone 

**Workes em Background**

- **Background-** Fora do contexto de BD, mantém o SGBD disponível 

**Vantagens de utilizar SGBDS:**
- Promove controle de redundância 
- Restrição de acesso 
- Provém persistência 
- Caching, Buffering, indexação 
- Backup e Recovery 

**Quando não usar um SGBD?**

- Aplicações muito simples, bem definidas onde não haverá nenhuma mudança.
- Aplicações em tempo real, que são terrivelmente prejudicadas pela sobrecarga (overhead) causada pelo uso de um SGBD;
- Investimentos iniciais altos (como compra de hardware e software)

### 📌 Modelagem de Dados 

Possui foco na descrição e relacionamento dos elementos que compõem a representação 


<table>
 <tr> 
 
   <td> 
   
   **Mini mundo**
   
   - Delimitação do contexto dos dados 
   ➡️</td>
  
   <td>
   
   **Alto nivél**
   
   - Requisitos p/ a criação do modelo 
   ➡️</td>
   
   <td>
   
   **Esquema**
   
   - Definição da estrtura relacional 
   ➡️</td>
   
   <td>
   
   **SGBD**
   
   - Implementando SGBD - Criando DB</td>
   
 </tr>
</table> 

*UML - Linguagem de Modelagem Unificada* (Efeito cascata)

## ALGUNS COMANDOS BÁSICOS SQL

- **show databases:** Mostrar todos os bancos existentes
- **create database:** Criar um banco
- **use "banco":** Acessar base de dados
- **show tables:** Exibir as tabelas da base de dados 
- **drop database "banco":** Exclui o banco em questão 
- **create table "periodicos":** Criando tabelas 
- **alter table:** Comando para realizar alterações na estrtura da tabela
- **insert into:** Para inserir dados na tabela 
- **Select * from:** Mostrar tabela completa 

**Exemplificando:**

```

CREATE DATABASE example;
CREATE TABLE periodicos (
    id integer,
    nome varchar(120),
    issn integer,
    PRIMARY KEY (id) /Chave Primaria/
);

```



