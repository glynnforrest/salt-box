install_osx:
	./bin/install_osx.sh
	make configure_minion

configure_minion:
	sudo cp conf/minion /etc/salt/minion
	sudo sed -i '' "s|_ROOT_|`pwd`|" /etc/salt/minion
