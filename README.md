# vultr

https://n1xaus.substack.com/p/cheap-linux-vps

Signup to [Vultr](https://www.vultr.com/?ref=9019554)

.

Goto your own terminal and generate an SSH key.

$ ```ssh-keygen -t ed25519```

$ ```cd ~/.ssh/; cat id_ed25519.pub```

Grab your key and add it to your SSH Keys in Vultr.

Deploy your instance: Location (Pick One), OS (Ubuntu), Power (1 CPU, 2GB RAM) && select your SSH key.

Launch


```
wget https://raw.githubusercontent.com/n1xaus/vultr/main/setup.sh
```
```
chmod a+x setup.sh
```
```
./setup.sh
```
