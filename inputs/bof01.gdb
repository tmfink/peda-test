peda set option debug on
peda help
checksec
aslr

b main
r

asmsearch ret bof
asmsearch nop
context
distance 10 20
dumpargs
elfheader
elfsymbol
peda gennop 10
getfile
getpid
hexdump 0x00400000
hexprint 0x00400000
jmpcall
nearpc
peda pattern create 50
pdisass
pltbreak
procinfo
readelf
ropgadget
searchmem "bof"
peda shellcode generate x86/linux exec
peda show

skeleton argv
peda skip
peda start
stepuntil call
vmmap
xprint 78+8
xrefs main


echo You should see results\n
shellcode search beep
