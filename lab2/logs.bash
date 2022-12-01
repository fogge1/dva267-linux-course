cd $HOME
mkdir Logs
cp /var/log/*.log ./Logs
tar --create --file ./Logs/Logs.tar ./Logs/*
gzip ./Logs/Logs.tar
rm ./Logs/*.log
ls ./Logs/
