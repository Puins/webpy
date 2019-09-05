#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

NAME=git
GITDIR=/root/.ssh/$NAME/
CONFIG=/root/.ssh/config

if [ ! -f $CONFIG ]; then
   for i in `ls $GITDIR|grep '.pub'`
	do
	    pub=(`cat $GITDIR$i | tr ',' ' '`)
	    tmp=${i##*_}
	    user=${tmp%.*}
	    email=${pub[2]}
	    host="Host ${user}"
	    hostname="HostName github.com"
	    uuser="User ${user}"
	    email="#Email ${email}"
	    pk="PreferredAuthentications publickey"
	    ifile="IdentityFile ${GITDIR}${i%.*}"
	    nn=""
	    echo $email>>$CONFIG
	    echo $host>>$CONFIG
	    echo $hostname>>$CONFIG
	    echo $uuser>>$CONFIG
	    echo $pk>>$CONFIG
	    echo $ifile>>$CONFIG
	    echo $nn>>$CONFIG
	done
    echo "${CONFIG} is created success!"   
fi

case "$1" in
        'lnump')
                 git config user.name "lnump"
                 git config user.email "hnjumeng@163.com"
                 git config credential.helper 'store --file=/root/.ssh/git/id_rsa_lnump.pub'
                ;;
        'puins')
		git config user.name "puins"
		git config user.email "849812002@qq.com"
		git config credential.helper 'store --file=/root/.ssh/git/id_rsa_puins.pub'
                ;;
        *)
esac
