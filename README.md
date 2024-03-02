![Image Alt text](/Magneticket.PNG))

![Image Alt text](/photo_2022-03-18_12-20-33.jpg "Interação pelo Celular"))


o .zip contem os arquivos personalizados para cada versão 
atualmente estamos na versão 4.4 indo para 4.5

Configuração personlizada com as seguintes mudanças:

###################################################333
D:\Magnetron\MAGNETICKET\Passaporte\magneticket_shell.4.2\TEMPORARIA\whaticket\frontend\.env
.env
REACT_APP_BACKEND_URL = http://localhost:8080/
REACT_APP_TITLE = Magneticket

######################################################

ALTERA TITULO DAS PAGINAS EM:
magneticket_shell.4.2\TEMPORARIA\whaticket\frontend\public\index.html


########################################################3
alterando link do frontend-chatbot da comu zdg para site da magntorn

/home/deployzdg/whaticket/frontend-chatbot/src/App.js

https://xn--magnetrontelecomunicaes-ibc46a.com.br/

############################################################

RETIRAR BOTOÔES DO MYSQL DIALOGFLOW ETC.. PARA TODOS


Sumir com a barra de DialogFlow, DialogFlowAudio, MYSQL e N8N
/home/deployzdg/whaticket/frontend/src/components/Ticket/index.js
Digita Esc
:set nu
linha 511 -> troque o "flex" para "none", 

Esconde a barra de id wpp, limite, importar conversas, csv, email
/home/deployzdg/whaticket/frontend/src/components/MessagesList/index.js
 index-s,js tambem OK
colocar display: none na linha 803

###############################################################3
Retirando opções do Menu lateral

BARRA LATERAL

/home/deployzdg/whaticket/frontend/src/layout/MainListItems.js

Retirar botões do menu lateral:
*chamada telefônica
*sms
*direct
*instagram
*mídia url
*mídia path

apagados por exemplo.

<ListItemLink
              to="/SMS"
              primary={i18n.t("mainDrawer.listItems.ZDGChatbot")}
        icon={<ChatIcon />}
      />
	  
	  TRECho retirado do acesso do usuario "User" para somente o admin ver em configurações avançadas MEnu inferior.

<ListItemLink
              to="/ZDGChatbot"
              primary={i18n.t("mainDrawer.listItems.ZDGChatbot")}
        icon={<ChatIcon />}
      />

OBS:A retirada do menu do chatbot para o parte de configurações faz com que o usuário "user" não visualiza-se a parte de configurações de limites de usuarios de horarios.
ficando dispnivel apenas para os usuarios "admin" para melhor gestão do negócio.

############################################################
Por segurança devemos trocar a senha do "admin"
padrão do Whaticket admin@whaticket.com de dentro do sistema.
###########################################################

===================================================
##                                              ##
##  ██████████████████████████████████████████  ##
##                                              ##
##  ███       ███ ████  ██ ███████ █████  ██    ##
##  ████     ████ █████ ██ ███████ ██     ██    ##
##  ██ ██   ██ ██ ██ ██ ██    ██   █████  ██    ##
##  ██  ██ ██  ██ ██  ████    ██   ██     ██    ##
##  ██   ███   ██ ██   ███    ██   █████  ████  ##
##                                              ## 
##  ██████████████████████████████████████████  ##
##                                              ##
##    ESSE MATERIAL FAZ PARTE DA MAGNETRON      ##
##            TELECOMUNICAÇÔES                  ##
##                                              ##
##        PIRATEAR ESSA SOLUÇÃO É CRIME.        ##
##                                              ##
## ©MAGNETRON TELECOM - magnetrontelecom.com.br ##
##                                              ##
===================================================
