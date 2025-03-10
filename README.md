# Compiled-Ubuntu-Glibc
The ubuntu glibc package is compiled  to facilitate  debugging

You can compile by youself，but there may be some problems:

source code download:

* https://launchpad.net/ubuntu/+source/glibc
* http://ftp.gnu.org/gnu/glibc/

and then do that in the terminal(but as expected, you will encounter a lot of trouble and mistakes)：
```
mkdir build;cd build

# amd64：
../configure --prefix=/path_you_want  --disable-werror --enable-debug=yes
# i686：
../configure --prefix=/path_you_want --disable-werror --enable-debug=yes --host=i686-linux-gnu --build=i686-linux-gnu CC="gcc -m32" CXX="g++ -m32" 

make -j16
make install DESTDIR=/xxx/xxx/install
```
Instructions:

* The released zip pack contains amd64 and i686 architecture which is compiled by corresponding architecture glibc
* You can find libc.so and ld.so in the folder of the corresponding architecture
* If you want to patchelf elf, can use patch.py or patch.sh, but you need you install patchelf before
* For more versions, you can download them from my BaiduwebDisk:: https://pan.baidu.com/s/122s4MdDjMxFjcUIhZjLrrA?pwd=ua1e 
* Good luck to you

