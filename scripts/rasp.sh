#!/bin/bash

RASP_ENABLED=true  # RaspberryPi logo true/false

# source: http://www.raspberrypi.org/phpBB3/viewtopic.php?p=78678#p78678
if $RASP_ENABLED; then
echo "$(tput setaf 2)
   .~~.   .~~.
  '. \ ' ' / .'$(tput setaf 1)
   .~ .~~~..~.
  : .~.'~'.~. :
 ~ (   ) (   ) ~
( : '~'.~.'~' : )
 ~ .~ (   ) ~. ~
  (  : '~' :  ) $(tput sgr0)Raspberry Pi$(tput setaf 1)
   '~ .~~~. ~'
       '~'
$(tput sgr0)"
fi
