peda set option debug on

b main
r

echo Testing pattern create\n
pattern create 200

echo Testing pattern offset, should find offset 185\n
pattern_offset 'AYAAuAAZAAvAAwA'
echo Should find offset at 197\n
pattern offset 0x415941417541415a41417641417741

echo Testing pattern search\n
set $r9 = 0x4162414146414130
echo Should find R9+0 at offset 42\n
pattern_search

echo Testing pattern patch\n
set $rw_var = 0x00601000
pattern_patch $rw_var 20
x/s $rw_var

echo Testing pattern arg\n
pattern arg 20
show args

echo Testing pattern env\n
pattern_env test_env 50
show environment

echo Testing lookup address\n
lookup address

echo Testing lookup pointer\n
lookup pointer

echo Testing strings\n
strings 0x00601000 0x00602000 4
strings mapped 5
