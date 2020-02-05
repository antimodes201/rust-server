#!/bin/bash
# Start Script for Rust
APPID=258550

/steamcmd/steamcmd.sh +login anonymous +force_install_dir /app +app_update ${APPID} +quit

# check if settings.cfg exist
if [ ! -f /app/settings.cfg ]
then
	cp /scripts/settings.cfg /app/settings.cfg
fi

cd /app
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)

# Set server launch settings
string=string.tmp
cat settings.cfg|grep -v \# |awk -F= '{print $1,$2}'|while read arg val
do
	if [ ! -z "${val}" ]
	then
		printf "+${arg} ${val} " >> ${string}
	fi
done
string=`cat ${string}`
rm string.tmp

#./RustDedicated -batchmode -nographics ${string} -logfile logs/`date +%m%d%Y%H%M`.log
echo './RustDedicated -batchmode -nographics' ${string} '-logfile logs/'`date +%m%d%Y%H%M`'.log' > startRust.sh
chmod +x startRust.sh
./startRust.sh


#https://umod.org/games/rust/download/develop