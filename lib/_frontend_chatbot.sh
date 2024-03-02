#!/bin/bash
# 
# functions for setting up app backend

#######################################
# sets environment variable for frontend.
# Arguments:
#   None
#######################################
frontend_chatbot_set_env() {
  print_banner
  printf "${WHITE} 💻 Configurando variáveis de ambiente (frontend-chatbot)...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  # ensure idempotency
  backend_chatbot_url=$(echo "${backend_chatbot_url/https:\/\/}")
  backend_chatbot_url=${backend_chatbot_url%%/*}
  backend_chatbot_url=https://$backend_chatbot_url

  # ensure idempotency
  backend_url=$(echo "${backend_url/https:\/\/}")
  backend_url=${backend_url%%/*}
  backend_url=https://$backend_url

sudo su - deployzdg << EOF
  cat <<[-]EOF > /home/deployzdg/whaticket/frontend-chatbot/.env
  REACT_APP_BACKEND_URL=${backend_chatbot_url}
  REACT_APP_URL=${backend_url}
[-]EOF
EOF

  sleep 2
}

#######################################
# installs node.js dependencies
# Arguments:
#   None
#######################################
frontend_chatbot_node_dependencies() {
  print_banner
  printf "${WHITE} 💻 Instalando dependências do frontend do chatbot...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - deployzdg <<EOF
  cd /home/deployzdg/whaticket/frontend-chatbot
  npm install
  npx browserslist@latest --update-db
EOF

  sleep 2
}

#######################################
# compiles frontend code
# Arguments:
#   None
#######################################
frontend_chatbot_node_build() {
  print_banner
  printf "${WHITE} 💻 Compilando o código do frontend do módulo de Chatbot...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - deployzdg <<EOF
  cd /home/deployzdg/whaticket/frontend-chatbot
  npm run build
EOF

  sleep 2
}

#######################################
# starts frontend using pm2 in 
# production mode.
# Arguments:
#   None
#######################################
frontend_chatbot_start_pm2() {
  print_banner
  printf "${WHITE} 💻 Iniciando pm2 (frontend-chatbot)...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - deployzdg <<EOF
  cd /home/deployzdg/whaticket/frontend-chatbot
  pm2 start npm --name chatbot-frontend -- start
  pm2 save
EOF

  sleep 2
}

#######################################
# run nginx
# Arguments:
#   None
#######################################
frontend_chatbot_nginx_setup() {
  print_banner
  printf "${WHITE} 💻 Configurando nginx (frontend-chatbot)...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  frontend_chatbot_hostname=$(echo "${frontend_chatbot_url/https:\/\/}")

sudo su - root << EOF

cat > /etc/nginx/sites-available/whaticket-frontend-chatbot << 'END'
server {
  server_name $frontend_chatbot_hostname;

  location / {
    proxy_pass http://127.0.0.1:3000;
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

ln -s /etc/nginx/sites-available/whaticket-frontend-chatbot /etc/nginx/sites-enabled
EOF

  sleep 2
}
