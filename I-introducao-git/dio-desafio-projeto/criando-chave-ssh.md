## _*Criando chave SSH:*_
Primeiro execute o seguinte comando:

--> *ssh-keygen - C "seu-email"*   (Neste exemplo o tipo da criptografia será atribuida automaticamente, por padrão o tipo RSA)
 ou 
--> *ssh-keygen -t ed25519 -C "seu-email"* (Neste exemplo usa o parametro -t para especificar o tipo da criptogradia que nesse caso é ed255190.
A chave pública e privada será gerada dentro da pasta oculta .ssh que por padrão estará alocada dentro da sua pasta pessoal,  no diretório home.
Exemplo: Caso utilize o windows, sua chave será criada no diretório  /c/Users/seu-nome-de-usuario, a pasta oculta será encontrada lá. Caso utilize o Linux, sua chave será criada no diretório  /home/seu-nome-de-usuario, a pasta oculta será encontrada lá.
Dica: Você pode consultar o caminho atual utilizando o comando *pwd*
A chave SSH foi criada, agora você prescisa inicializar o agente.

## _*Inicializando o agente:*_ 

Primeiro você irá navegar até o diretório .ssh, utilizando o comando *cd /especifiqueCaminho*
Estando no diretório irá executar o seguinte comando: 
--> *eval $(ssh-agent -s)*
O agente foi criado, agora é necessario atribuir a chave ao agente. 

## _*Atribuindo a chave ao agente*_

Do diretório .ssh, execute o comando ls para listar o arquivo das chaves publicas e privado.
Caso tiver criado com o *tipo RSA*, os arquivos apareceram como *id_rsa* e *id_rsa.pub*
Caso tiver criado com o *tipo ed25519*, os arquivos apareceram como *id_ed25519* e *id_ed25519.pub*

Execute o comando: 
--> *ssh-add id_rsa* (no caso do tipo RSA)
ou
--> *ssh-add id_ed25519* (no caso do tipo ed25519)

