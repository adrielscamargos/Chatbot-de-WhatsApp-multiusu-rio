## SCRIPT BASH DE INSTALAÇÂO AUTOMATIZADA ##
![SCRIPT nuvem OK Magneticket](https://github.com/adrielscamargos/Chatbot-de-WhatsApp-multiusu-rio/assets/34457423/fbdcd389-8f69-4912-884f-ee4b56739e89)
## PAINEL DO MAGNETICKET ##
![Magneticket](https://github.com/adrielscamargos/Chatbot-de-WhatsApp-multiusu-rio/assets/34457423/f65d9d6a-1cc5-4a39-ba33-d44be42c881b)
## INTERAÇÂO NO WHATSAPP DO USUÀRIO ##
![photo_2022-03-18_12-20-33](https://github.com/adrielscamargos/Chatbot-de-WhatsApp-multiusu-rio/assets/34457423/fd40b235-9a11-4963-9c3d-89cd479b89df)
## LIB DO VENOMBOT RODANDO NO BACK END ##
![Projeto venom ok](https://github.com/adrielscamargos/Chatbot-de-WhatsApp-multiusu-rio/assets/34457423/79f01e00-0971-4591-9379-220460a489c3)
![MAGNETICKET NOTIFICAÇÂO](https://github.com/adrielscamargos/Chatbot-de-WhatsApp-multiusu-rio/assets/34457423/b56d655e-33b3-4621-a5f0-4acc0f940dc7)
![Login pelo celular no Magneticket](https://github.com/adrielscamargos/Chatbot-de-WhatsApp-multiusu-rio/assets/34457423/c104e276-f5be-4b53-ac49-4759ab784dd3)
![Magneticket-site](https://github.com/adrielscamargos/Chatbot-de-WhatsApp-multiusu-rio/assets/34457423/f26c4277-624e-48f8-b133-c63b53db8748)
![Magneticket-site (2)](https://github.com/adrielscamargos/Chatbot-de-WhatsApp-multiusu-rio/assets/34457423/a141fbbe-7c20-4759-a529-4f2c1bb46049)
![transferencia de ticket no Magneticket 2 0](https://github.com/adrielscamargos/Chatbot-de-WhatsApp-multiusu-rio/assets/34457423/622dffa7-0d06-4a15-b154-38184c0587dd)
![Tela do whaticket 1](https://github.com/adrielscamargos/Chatbot-de-WhatsApp-multiusu-rio/assets/34457423/efabe5c7-4948-450b-bfa9-be05f09e8db4)
![NOVO MAGNETICKET OK COM TAGS E MENU LATERAL com novas APIS](https://github.com/adrielscamargos/Chatbot-de-WhatsApp-multiusu-rio/assets/34457423/9a41956a-2de9-4376-9359-864043f939da)
![Magneticket conversando pelo celular no painel web](https://github.com/adrielscamargos/Chatbot-de-WhatsApp-multiusu-rio/assets/34457423/3124bc06-43d6-4a46-9d94-29d74f48b37b)
![Atendimento de chatbot da Magnetron mensagem com nome do usuário](https://github.com/adrielscamargos/Chatbot-de-WhatsApp-multiusu-rio/assets/34457423/42beb88e-18d8-47ba-a9d6-1d4e9de2c869)
![chat3](https://github.com/adrielscamargos/Chatbot-de-WhatsApp-multiusu-rio/assets/34457423/014dd916-d650-424c-9d17-abed2d66db10)
![Quantidade de usuários acessando sistema criados pelo admin](https://github.com/adrielscamargos/Chatbot-de-WhatsApp-multiusu-rio/assets/34457423/a9a2cab6-e211-4284-8a94-9c92f50db2c7)


https://github.com/adrielscamargos/Chatbot-de-WhatsApp-multiusu-rio/assets/34457423/c53cb706-50bd-4be7-b0e1-3cdd7c2351fa


Alterado por Adriel Silva Camargos
09/06/2023 ás 17:34

## CRIAR SUBDOMINIO E APONTAR PARA O IP DA SUA VPS ##

SUB 1: FRONTEND DO WHATICKET > appwhaticket.magnetrontelecom.com.br
SUB 2: BACKEND DO WHATICKET > apiwhaticket.magnetrontelecom.com.br
SUB 3: FRONTEND DO CHATBOT > appchatbot.magnetrontelecom.com.br
SUB 4: BACKEND DO CHATBOT > apichatbot.magnetrontelecom.com.br

## CHECAR PROPAGAÇÃO DO DOMÍNIO ##

https://dnschecker.org/

## COPIAR A PASTA PARA ROOT E RODAR OS COMANDOS ABAIXO ##

sudo chmod +x ./whaticket_passaporte_shell/whaticket
cd ./whaticket_passaporte_shell
sudo ./whaticket


===================================================

## APÓS A INSTALAÇÃO ##

## INSTALAR O CHROME (CASO VOCÊ RECEBA ERRO NA HORA DE COLAR A SENHA DO DEPLOYZDG / RECEBA ERRO NO QRCODE)
sudo su deployzdg
cd ~
sudo apt install -y ./google-chrome-stable_current_amd64.deb
pm2 restart 0

## ATIVAR FIREWALL ##

sudo ufw enable
y
enter

================================================

## MANUAL
## INSTALAR O WHATICKET

sudo apt update
sudo apt upgrade
sudo su root
cd ~
apt install mysql-server
mysql --version
sudo systemctl status mysql
sudo mysql -u root

mysql> CREATE DATABASE whaticket CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
mysql> USE mysql;
mysql> UPDATE user SET plugin='mysql_native_password' WHERE User='root';
mysql> FLUSH PRIVILEGES;
mysql> exit;

service mysql restart
sudo su root
adduser deployzdg
usermod -aG sudo deployzdg
su deployzdg
sudo apt update && sudo apt upgrade
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt install apt-transport-https ca-certificates curl software-properties-common
sudo apt update
sudo usermod -aG mysql ${USER}
su - ${USER}
cd ~
conectar com o usuario deployzdg e enviar a pasta via ftp
sudo apt install unzip
unzip whaticket.zip
cp whaticket/backend/.env.example whaticket/backend/.env
nano whaticket/backend/.env

NODE_ENV=
BACKEND_URL=https://api.atendimento.converteja.com.br
FRONTEND_URL=https://atendimento.converteja.com.br
PROXY_PORT=443
PORT=8080
CHROME_BIN=/usr/bin/google-chrome-stable
DIALOG_FLOW_JSON=zdg-9un9-0aba54d6e44c.json
DIALOG_FLOW_PROJECT_ID=zdg-9un9
DIALOG_FLOW_LANGUAGE=pt-br
DIALOG_FLOW_STATUS=off
VONAGE_APIKEY=4542a449
VONAGE_APISECRET=Tb2yD2lq9y6kP0Dg
VONAGE_APPLICATIONID=d72e7e96-2f75-46a3-8e13-e11b9d239856
GROUPS=off
EMAIL_SERVICE=gmail
EMAIL_USER=zdgads@gmail.com
EMAIL_PASS=enousbucwhhkkiyx
EMAIL_FROM=zdgads@gmail.com
EMAIL_TO=zapdasgalaxias@gmail.com
N8N=off
N8N_WEBHOOK=https://jqaur1m11ongj279cq9g0hes.hooks.n8n.cloud/webhook/549feb55-7df0-4f7e-a8e6-2eefd0c3551a

DB_DIALECT=mysql
DB_HOST=localhost
DB_USER=root
DB_PASS=
DB_NAME=whaticket

JWT_SECRET=3123123213123
JWT_REFRESH_SECRET=75756756756

sudo apt-get install -y libgbm-dev wget unzip fontconfig locales gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
cd whaticket/backend
npm install
npx sequelize db:migrate
npx sequelize db:seed:all
sudo npm install -g pm2
pm2 start dist/server.js --name whaticket-backend
pm2 startup ubuntu -u deployzdg
sudo env PATH=$PATH:/usr/bin pm2 startup ubuntu -u deployzdg --hp /home/deployzdg
cd ../frontend
npm install --force
nano .env

REACT_APP_BACKEND_URL = https://api.atendimento.converteja.com.br
PORT=3003

npm run build
pm2 start server.js --name whaticket-frontend
pm2 save
pm2 list

sudo apt install nginx
sudo rm /etc/nginx/sites-enabled/default
sudo nano /etc/nginx/sites-available/wt-frontend

server {
  server_name atendimento.converteja.com.br;

  location / {
    proxy_pass http://127.0.0.1:3333;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_cache_bypass $http_upgrade;
  }
  }
sudo cp /etc/nginx/sites-available/wt-frontend /etc/nginx/sites-available/wt-backend
sudo nano /etc/nginx/sites-available/wt-backend

server {
  server_name api.atendimento.converteja.com.br;

  location / {
    proxy_pass http://127.0.0.1:8080;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_cache_bypass $http_upgrade;
  }
  }
  
cd /etc/nginx/sites-available/
ls
sudo ln -s /etc/nginx/sites-available/wt-frontend /etc/nginx/sites-enabled
sudo ln -s /etc/nginx/sites-available/wt-backend /etc/nginx/sites-enabled
sudo nginx -t
sudo service nginx restart
sudo nano /etc/nginx/nginx.conf

client_max_body_size 50M; 
# HANDLE BIGGER UPLOADS
 
sudo nginx -t
sudo service nginx restart
sudo apt-get install snapd
sudo snap install notes

sudo snap install --classic certbot
sudo certbot --nginx

==============================================================

## INSTALAR O MÓDULO DE CHATBOT

cd ~
cd whaticket
cd backend-chatbot
npm install
pm2 start npm --name chatbot-backend -- start

cd ../frontend-chatbot
npm install
nano .env
REACT_APP_BACKEND_URL = https://api.chatbot.converteja.com.br
pm2 start npm --name chatbot-frontend -- start

pm2 save
pm2 list
sudo nano /etc/nginx/sites-available/chatbotwt-frontend

server {
  server_name chatbot.converteja.com.br;

  location / {
    proxy_pass http://127.0.0.1:3000;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_cache_bypass $http_upgrade;
  }
   }
   
sudo cp /etc/nginx/sites-available/chatbotwt-frontend /etc/nginx/sites-available/chatbotwt-backend
sudo nano /etc/nginx/sites-available/chatbotwt-backend

server {
  server_name api.chatbot.converteja.com.br;

  location / {
    proxy_pass http://127.0.0.1:8081;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_cache_bypass $http_upgrade;
  }
  }
  
cd /etc/nginx/sites-available/
ls
sudo ln -s /etc/nginx/sites-available/chatbotwt-frontend /etc/nginx/sites-enabled
sudo ln -s /etc/nginx/sites-available/chatbotwt-backend /etc/nginx/sites-enabled
sudo nginx -t
sudo service nginx restart
sudo certbot --nginx

==============================================================

## IZING em Produção

https://github.com/adrielscamargos/Chatbot-de-WhatsApp-multiusu-rio/assets/34457423/10a1e376-0bd3-4f5a-abef-fe79ddb366a2




https://github.com/adrielscamargos/Chatbot-de-WhatsApp-multiusu-rio/assets/34457423/66a65c7b-3dbb-42de-853d-a60b006a3da5




