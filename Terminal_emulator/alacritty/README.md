темы
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

запуск Alacritty сильно потребляет лимиты иксов
узнать лимит
grep -i "max clients" /var/log/Xorg.0.log

проверить занятость иксов
sudo ss -x src "*/tmp/.X11-unix/*" | awk '{print $NF}' | cut -d: -f1 | sort | uniq -c | sort -nr | wc -l
sudo lsof -U | grep -E 'X11-unix' | wc -l

увеличить лимит X-сервера до 1024 клиентов
echo -e 'Section "ServerFlags"\n Option "MaxClients" "1024"\nEndSection' | sudo tee /etc/X11/xorg.conf.d/99-maxclients.conf

завершить зомби и убрать лимиты
pkill -9 alacritty && pkill -9 tabbed
