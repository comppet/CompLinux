#!/bin/bash

#Vê se tem privilégio de ROOT
if [ "$EUID" -ne 0 ]
  then echo "Você deve ter privilégios de root para executar o "
  read
  exit
fi;

							    
add-apt-repository ppa:alexlarsson/flatpak -y               #adiciona as PPA do flatpak
add-apt-repository ppa:notepadqq-team/notepadqq -y          #adiciona as PPA do notepadqq
add-apt-repository ppa:nilarimogard/webupd8 -y              #adiciona o PPA do caffeine


wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -         #Download do chrome
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -              #Download do sublime
curl -L https://packagecloud.io/AtomEditor/atom/gpgkey | apt-key add -                     #Download do atom

#Coloca o sublime no sources.list
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
#Coloca o chrome no sources.list
sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
#Coloca o atom no sources.list
sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
#Coloca o spotify no sources.list
echo deb http://repository.spotify.com stable non-free | tee /etc/apt/sources.list.d/spotify.list
#Adiciona a chave do spotify
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410

#atualiza o apt
apt-get update;

#instala tudo
apt-get install -y --allow-unauthenticated dia gparted docker netbeans inkscape gcc g++ git synaptic aptitude banshee ssh flatpak codeblocks eclipse postgresql pgadmin3 google-chrome-stable spotify-client apt-transport-https sublime-text notepadqq atom numix-gtk-theme caffeine-plus gimp ghc eclipse geogebra swi-prolog swi-prolog-x logisim wireshark octave 

#instala o gimp
#flatpak install https://flathub.org/repo/appstream/org.gimp.GIMP.flatpakref
#flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#orientação para instalar o PostgreSQL
echo -e "Instalação feita, o próximo passo é alterar a senha do usuário postgres digitando:\n#ALTER USER postgres WITH PASSWORD 'senha';\n#\q\n"
su postgres -c psql postgres
