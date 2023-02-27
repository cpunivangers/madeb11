DIRSVG=$(basename $(pwd))

cd ..

tar zcvf $DIRSVG.tar.gz $DIRSVG

PATH_SAMI="$HOME/UA_Personnels/DDN/DDN-SAMI/SitesUniversite/IUT"
echo "rsync -av --progress --delete  $DIRSVG $PATH_SAMI/ansible/"
rsync -av --progress --delete  $DIRSVG $PATH_SAMI/ansible/

PATH_UABOX=$(grep "localPath" ~/.config/ownCloud/owncloud.cfg | grep "Logiciels" | cut -d= -f2)

if [ -z "$PATH_UABOX" ] ; then
	exit 1
fi

echo $DIRSVG.tar.gz $PATH_UABOX/ansible/
cp -f $DIRSVG.tar.gz $PATH_UABOX/ansible/

echo $DIRSVG/files/update_madeb11.sh $PATH_UABOX
cp -f $DIRSVG/files/update_madeb11.sh $PATH_UABOX

echo "rsync -av --progress --delete  $DIRSVG $PATH_UABOX/ansible/"
rsync -av --progress --delete  $DIRSVG $PATH_UABOX/ansible/

