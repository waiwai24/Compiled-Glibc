import os

version="2.31"

file_name= 'test'
arch = 'amd64'
libc_name="libc-"+version+".so"
ld_name="ld-"+version+".so"

os.system("cp /glibc/{}/{}/lib/{} .".format(version,arch,libc_name))
os.system("cp /glibc/{}/{}/lib/{} .".format(version,arch,ld_name))
os.system("chmod 777 "+libc_name)
os.system("chmod 777 "+ld_name)

for file_name in list(os.walk("."))[0][2]:
	if "." not in file_name:
		os.system("patchelf --replace-needed libc.so.6 ./{} ./{}".format(libc_name,file_name))
		os.system("patchelf --set-interpreter ./{} ./{}".format(ld_name,file_name))
