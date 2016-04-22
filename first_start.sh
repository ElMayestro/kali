apt-get update
apt-get upgrade -Y
apt-get dist-upgrade -y
apt-get install python-software-properties -y
apt-get install apt-file -y
apt-file update
apt-file search add-apt-repository
cd /usr/sbin
echo '
#!/bin/bash
if [ $# -eq 1 ]
NM=`uname -a && date`
NAME=`echo $NM | md5sum | cut -f1 -d" "`
then
  ppa_name=`echo "$1" | cut -d":" -f2 -s`
  if [ -z "$ppa_name" ]
  then
    echo "PPA name not found"
    echo "Utility to add PPA repositories in your debian machine"
    echo "$0 ppa:user/ppa-name"
  else
    echo "$ppa_name"
    echo "deb http://ppa.launchpad.net/$ppa_name/ubuntu oneiric main" >> /etc/apt/sources.list
    apt-get update >> /dev/null 2> /tmp/${NAME}_apt_add_key.txt
    key=`cat /tmp/${NAME}_apt_add_key.txt | cut -d":" -f6 | cut -d" " -f3`
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $key
    rm -rf /tmp/${NAME}_apt_add_key.txt
  fi
else
  echo "Utility to add PPA repositories in your debian machine"
  echo "$0 ppa:user/ppa-name"
fi' >> add-apt-repository
chmod o+x /usr/sbin/add-apt-repository 
chown root:root /usr/sbin/add-apt-repository
/usr/sbin/add-apt-repository ppa:webupd8team/brackets
apt-get update
apt-get install brackets -y
# 1. Add the Spotify repository signing key to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
# 3. Update list of available packages
sudo apt-get update
# 4. Install Spotify
sudo apt-get install spotify-client
cd /home/g/Pictures/
mkdir Wallpapers
wget https://github.com/ElMayestro/kali/blob/master/wallpaper.jpeg
gsettings set org.gnome.desktop.background picture-uri file:///home/g/Pictures/wallpaper.jpeg
