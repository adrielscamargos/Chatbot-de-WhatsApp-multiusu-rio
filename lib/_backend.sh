#!/bin/bash
# 
# functions for setting up app backend

#######################################
# creates mysql db
# Arguments:
#   None
#######################################
backend_mysql_create() {
  print_banner
  printf "${WHITE} 💻 Criando banco de dados...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - root <<EOF
  sudo mysql -u root
  CREATE DATABASE ${db_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
  USE mysql;
  UPDATE user SET plugin='mysql_native_password' WHERE User='${db_user}';
  FLUSH PRIVILEGES;
  ALTER USER '${db_user}'@'localhost' IDENTIFIED BY '${db_pass}';
  exit;
  service mysql restart
EOF

  sleep 2
}

#######################################
# sets environment variable for backend.
# Arguments:
#   None
#######################################
backend_set_env() {
  print_banner
  printf "${WHITE} 💻 Configurando variáveis de ambiente (backend)...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  # ensure idempotency
  backend_url=$(echo "${backend_url/https:\/\/}")
  backend_url=${backend_url%%/*}
  backend_url=https://$backend_url

  # ensure idempotency
  frontend_url=$(echo "${frontend_url/https:\/\/}")
  frontend_url=${frontend_url%%/*}
  frontend_url=https://$frontend_url

  # ensure idempotency
  frontend_chatbot_url=$(echo "${frontend_chatbot_url/https:\/\/}")
  frontend_chatbot_url=${frontend_chatbot_url%%/*}
  frontend_chatbot_url=https://$frontend_chatbot_url

sudo su - deployzdg << EOF
  cat <<[-]EOF > /home/deployzdg/whaticket/backend/.env
NODE_ENV=
BACKEND_URL=${backend_url}
FRONTEND_URL=${frontend_url}
FRONTEND_URL_CHATBOT=${frontend_chatbot_url}
PROXY_PORT=443
PORT=8080

# CREDENCIAIS BD
DB_HOST=localhost
DB_DIALECT=mysql
DB_USER=${db_user}
DB_PASS=${db_pass}
DB_NAME=${db_name}
CHROME_BIN=/usr/bin/google-chrome-stable

# LIGAR => on | DESLIGAR => off
DIALOG_FLOW_STATUS=off
GROUPS=on
N8N=off

# CREDENCIAIS DIALOGFLOW
DIALOG_FLOW_JSON=zdg-9un9-0aba54d6e44c.json
DIALOG_FLOW_PROJECT_ID=zdg-9un9
DIALOG_FLOW_LANGUAGE=pt-br

# CREDENCIAIS VONAGE API
VONAGE_APIKEY=4542a449
VONAGE_APISECRET=Tb2yD2lq9y6kP0Dg
VONAGE_APPLICATIONID=d72e7e96-2f75-46a3-8e13-e11b9d239856

# CREDENCIAIS GMAIL
EMAIL_SERVICE=gmail
EMAIL_USER=zdgads@gmail.com
EMAIL_PASS=xkdraifnpmtejehr
EMAIL_FROM=zdgads@gmail.com
EMAIL_TO=zapdasgalaxias@gmail.com

# CREDENCIAIS N8N
N8N_WEBHOOK=https://jqaur1m11ongj279cq9g0hes.hooks.n8n.cloud/webhook/549feb55-7df0-4f7e-a8e6-2eefd0c3551a

# SECRETS
JWT_SECRET=${jwt_secret}
JWT_REFRESH_SECRET=${jwt_refresh_secret}
[-]EOF
EOF

  sleep 2
}

#######################################
# installs node.js dependencies
# Arguments:
#   None
#######################################
backend_node_dependencies() {
  print_banner
  printf "${WHITE} 💻 Instalando dependências do backend...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - deployzdg <<EOF
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt install -y ./google-chrome-stable_current_amd64.deb
  cd /home/deployzdg/whaticket/backend
  npm install
EOF

  sleep 2
}

#######################################
# updates backend code
# Arguments:
#   None
#######################################
backend_update() {
  print_banner
  printf "${WHITE} 💻 Atualizando o backend...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - deployzdg <<EOF
  cd /home/deployzdg/whaticket
  npm r whatsapp-web.js
  npm i whatsapp-web.js
  pm2 restart all
EOF

  sleep 2
}

#######################################
# runs db migrate
# Arguments:
#   None
#######################################
backend_db_migrate() {
  print_banner
  printf "${WHITE} 💻 Executando db:migrate...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - deployzdg <<EOF
  cd /home/deployzdg/whaticket/backend
  npx sequelize db:migrate
EOF

  sleep 2
}

#######################################
# runs db seed
# Arguments:
#   None
#######################################
backend_db_seed() {
  print_banner
  printf "${WHITE} 💻 Executando db:seed...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - deployzdg <<EOF
  cd /home/deployzdg/whaticket/backend
  npx sequelize db:seed:all
EOF

  sleep 2
}

#######################################
# starts backend using pm2 in 
# production mode.
# Arguments:
#   None
#######################################
backend_start_pm2() {
  print_banner
  printf "${WHITE} 💻 Iniciando pm2 (backend)...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - deployzdg <<EOF
  cd /home/deployzdg/whaticket/backend
  pm2 start dist/server.js --name whaticket-backend
EOF

  sleep 2
}

#######################################
# updates frontend code
# Arguments:
#   None
#######################################
backend_nginx_setup() {
  print_banner
  printf "${WHITE} 💻 Configurando nginx (backend)...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  backend_hostname=$(echo "${backend_url/https:\/\/}")

sudo su - root << EOF

cat > /etc/nginx/sites-available/whaticket-backend << 'END'
server {
  server_name $backend_hostname;

  location / {
    proxy_pass http://127.0.0.1:8080;
    proxy_http_version 1.1;
    proxy_set_header Upgrade \$http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host \$host;
    proxy_set_header X-Real-IP \$remote_addr;
    proxy_set_header X-Forwarded-Proto \$scheme;
    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    proxy_cache_bypass \$http_upgrade;
  }
}
END

ln -s /etc/nginx/sites-available/whaticket-backend /etc/nginx/sites-enabled
EOF

  sleep 2
}
