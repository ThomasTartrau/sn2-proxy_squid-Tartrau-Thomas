# Vagrantfile pour créer 2 VMs : une avec Squid Proxy (Debian) et une avec Debian Desktop
Vagrant.configure("2") do |config|

  # Configuration de la VM du proxy Squid sous Debian
  config.vm.define "squid_proxy" do |squid_proxy|
    squid_proxy.vm.box = "debian/bullseye64"  # Utilisation de Debian Bullseye 64 bits
    squid_proxy.vm.hostname = "squid-proxy"
    squid_proxy.vm.network "private_network", ip: "192.168.56.10"

    squid_proxy.vm.provider "virtualbox" do |vb|
      vb.name = "Squid_Server"
      vb.memory = "512"  # Allocation de 512MB de RAM
      vb.cpus = 1        # 1 CPU
    end

    # Script pour installer Squid Proxy sur la VM
    squid_proxy.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -y squid squidguard squidclient
      # Configurer Squid pour permettre à tout le monde de sortir (juste pour des tests)
      #sed -i '/http_access deny all/c\\http_access allow all' /etc/squid/squid.conf
      systemctl restart squid
    SHELL
  end

  # Configuration de la VM Debian Desktop (client)
  config.vm.define "squid_client" do |squid_client|
    squid_client.vm.box = "debian/bullseye64"
    squid_client.vm.hostname = "squid-client"
    squid_client.vm.network "private_network", ip: "192.168.56.11"

    squid_client.vm.provider "virtualbox" do |vb|
      vb.name = "Squid_Client"
      vb.memory = "2048"  # Allocation de 1GB de RAM pour la machine Desktop
      vb.cpus = 1         # 1 CPU
    end
    squid_client.vm.provision "shell", inline: <<-SHELL
      echo 'http_proxy="http://192.168.56.10:3128/"'>>/etc/environment
      echo 'https_proxy="http://192.168.56.10:3128/"'>>/etc/environment
      echo 'ftp_proxy="http://192.168.56.10:3128/"'>>/etc/environment
      echo 'no_proxy="localhost,127.0.0.1,::1"'>>/etc/environment

    SHELL
  end

end
