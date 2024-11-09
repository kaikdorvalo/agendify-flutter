# Agendify Flutter

O Agendify é um aplicativo de agendamentos de pessoas pensado para auxiliar consutórios odontológicos gerenciar os agendamentos de seus pacientes

# Como iniciar a aplicação

O desenvolvimento foi feito sem a utilização de emuladores, por meio da vm no navegador.

1. Clone o projeto com "https://github.com/kaikdorvalo/agendify-flutter.git"
2. Acesse a pasta clonada "agendify-flutter".

Temos duas pasta, a "flutter" é onde se encontra o aplicativo em flutter e a pasta "backend" é o nome servidor simulado com json-server

Para iniciar o servidor, faça:

1. Abra a pasta "backend" com o terminal e instale as dependências com o comando "npm install"
2. Inicie o servidor com o comando "npx json-server api/db.json"

Para iniciar a aplicação em flutter com a vm no navegador, faça:

1. Abra a pasta "flutter" com o terminal e digite o comando "flutter run -d chrome"

O nome "chrome" no comando indica o navegador que ele irá utlizar, podendo ser substituido. caso queira inciar com outro navegador digite no terminal o comando "flutter run". Esse comando irá listar todos os navegadores disponíveis, bastando pressionar a tecla númerica do navegador correspondente da lista que irá aparecer.

Seu navgeador deverá abrir após o aplicativo terminar se iniciar.

Para realizar o login na aplicação, utile os seguintes dados de cesso fictícios:

email: example@gmail.com
senha: 123

# Pontos de atenção

A vm do dart no navegador pode gerar alguns problemas na hora de iniciar. Caso a tela fique branca, apresente erros ou algo do tipo, faça uma atualização da página para que ela funcione.

Caso seu navegador não abra automaticamente, pode acessar o aplicativo por meio do endereço que será mostrado no terminal após o aplicativo iniciar.



