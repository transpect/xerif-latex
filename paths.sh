#!/bin/bash

XINDY=/usr/local/texlive/2024/bin/x86_64-linux/xindy
THISHOST=$(hostname -s)

if [ -f "$XINDY" ]; then
    XINDY=/usr/local/texlive/2024/bin/x86_64-linux/xindy
fi

if [ "$THISHOST" = "igor" ]; then
    XINDY=/usr/local/texlive/2017/bin/x86_64-linux/xindy
elif [ "$THISHOST" = "transcript-test" ]; then
    XINDY=/usr/local/texlive/2024/bin/x86_64-linux/xindy
elif [ "$THISHOST" = "transcript-prod" ]; then
    XINDY=/usr/local/texlive/2019early/bin/x86_64-linux/xindy
elif [ "$THISHOST" = "transpect" ]; then
    XINDY=/usr/local/texlive/2024/bin/x86_64-linux/xindy
elif [ "$THISHOST" = "merlin" ]; then
    XINDY=/usr/local/texlive/2024/bin/x86_64-linux/xindy
else
    XINDY=$(which xindy)
fi

# dependencies for accessibility
# export LUAINPUTS=.:ltpdfa:
# export CLUAINPUTS=.:ltpdfa//:
# export TEXINPUTS=.:ltpdfa:
# export T1FONTS=.:ltpdfa:
# export TFMFONTS=.:ltpdfa:
# export ENCFONTS=.:ltpdfa:
# export DVIPSHEADERS=.:suppl:
# echo "tex input path: $TEXINPUTS"
echo "xindy path: $XINDY"
