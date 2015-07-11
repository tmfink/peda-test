peda set option debug on

b main

r

set $addr = 0x00601000
echo Patching\n
patch $addr "new string"

ni

hexdump $addr

patch $addr
hexdump $addr
