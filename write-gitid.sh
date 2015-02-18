#!/bin/sh
# Write hd.id File

Os=`uname -s`

if [ "$Os" = "Darwin" ]; then
    DATEBIN=gdate
else
    DATEBIN=date
fi

hg parent --template '\\def\\HgNode\{{node|short}}\n\\def\\HgDate\{{date|isodate}}\n\\def\\HgAuthor\{{author|person}}\n\\def\\HgRevision\{{rev}}\n' > hg.id
hg parent --template '{date|isodate}' | xargs -I var_d $DATEBIN -d "var_d" +\\def\\HgNiceDate{%-d.\ %B\ %Y\ um\ %H:%M\ Uhr} >> hg.id
