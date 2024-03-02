#!/bin/bash
# 
# functions for setting up app backend

#######################################
# sets environment variable for backend.
# Arguments:
#   None
#######################################
backend_chatbot_set_env() {
  print_banner
  printf "${WHITE} 💻 Configurando variáveis de ambiente (backend-chatbot)...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  # ensure idempotency
  frontend_chatbot_url=$(echo "${frontend_chatbot_url/https:\/\/}")
  frontend_chatbot_url=${frontend_chatbot_url%%/*}
  frontend_chatbot_url=https://$frontend_chatbot_url

  # ensure idempotency
  frontend_url=$(echo "${frontend_url/https:\/\/}")
  frontend_url=${frontend_url%%/*}
  frontend_url=https://$frontend_url

sudo su - deployzdg << EOF
  cat <<[-]EOF > /home/deployzdg/whaticket/backend-chatbot/.env
# CREDENCIAIS BD
FRONTEND_URL=${frontend_url}
CHATBOT_FRONTEND_URL=${frontend_chatbot_url}
DB_HOST=localhost
DB_DIALECT=mysql
DB_USER=${db_user}
DB_PASS=${db_pass}
DB_NAME=${db_name}
PORT=8081

# LIGAR => ok | DESLIGAR => off
CHATBOT_DEFAULT=off
DIALOGFLOW_DEFAULT=off
DIALOGFLOWAUDIO_DEFAULT=off
N8N_DEFAULT=off
GRUPO_DEFAULT=ok
WHATSAPP_AGENDAMENTO_DEFAULT=ok
AGENDAMENTO_AUTOMATICO_DEFAULT=ok

[-]EOF
EOF

  sleep 2
}

#######################################
# installs node.js dependencies
# Arguments:
#   None
#######################################
backend_chatbot_node_dependencies() {
  print_banner
  printf "${WHITE} 💻 Instalando dependências do backend do chatbot...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - deployzdg <<EOF
  cd /home/deployzdg/whaticket/backend-chatbot
  npm install
EOF

  sleep 2
}

#######################################
# starts backend using pm2 in 
# production mode.
# Arguments:
#   None
#######################################
backend_chatbot_start_pm2() {
  print_banner
  printf "${WHITE} 💻 Iniciando pm2 (backend-chatbot)...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - deployzdg <<EOF
  cd /home/deployzdg/whaticket/backend-chatbot
  pm2 start npm --name chatbot-backend -- start
  pm2 save
EOF

  sleep 2
}

#######################################
# run nginx
# Arguments:
#   None
#######################################
backend_chatbot_nginx_setup() {
  print_banner
  printf "${WHITE} 💻 Configurando nginx (backend-chatbot)...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  backend_chatbot_hostname=$(echo "${backend_chatbot_url/https:\/\/}")

sudo su - root << EOF

cat > /etc/nginx/sites-available/whaticket-backend-chatbot << 'END'
server {
  server_name $backend_chatbot_hostname;

  location / {
    proxy_pass http://127.0.0.1:8081;
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

ln -s /etc/nginx/sites-available/whaticket-backend-chatbot /etc/nginx/sites-enabled
EOF

  sleep 2
}
