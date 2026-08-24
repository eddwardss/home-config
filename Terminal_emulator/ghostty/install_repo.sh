mkdir -p /etc/apt/keyrings
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x0721fdf5fecb88dc6920361657c8ef455ceae491" -o /etc/apt/keyrings/mkasberg-ghostty.asc
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/mkasberg-ghostty.asc] https://ppa.launchpadcontent.net/mkasberg/ghostty-ubuntu/ubuntu noble main" | sudo tee /etc/apt/sources.list.d/mkasberg-ghostty.list
