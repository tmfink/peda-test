peda set option debug on

b main
r

set $addr = 0x00600000
set $dump_len = 64
set $tmp_dump_file = "/tmp/peda-test-dumpfile"

echo Printing memory\n
hexdump $addr

echo Dumping memory\n
dumpmem /tmp/peda-test-dumpfile $addr $addr+$dump_len

echo Comparing memory (should match)\n
cmpmem $addr $addr+$dump_len /tmp/peda-test-dumpfile

shell echo this should not match > /tmp/peda-test-badfile
echo File should not match\n
cmpmem $addr $addr+$dump_len /tmp/peda-test-badfile

echo substr test\n
substr "ELF"
substr "abc"

set $xor_str = 0x400001
echo Testing xormem\n
echo Before\n
hexdump $xor_str

echo Doing XOR...\n
xormem $xor_str $xor_str+3 '\x1d\x03\x14'

echo After\n
hexdump $xor_str
