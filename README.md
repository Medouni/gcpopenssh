# 谷歌云GCP开启ROOT SSH登陆

首先浏览器连上SSH

一、切换到ROOT用户并启用ROOT SSH登陆
```
sudo -i
```
```
sed -i "s/PermitRootLogin\ no/PermitRootLogin\ yes/g" /etc/ssh/sshd_config && sed -i "s/PasswordAuthentication\ no/PasswordAuthentication\ yes/g" /etc/ssh/sshd_config
```

二、重启SSH服务
Centos
```
service sshd restart
```
Debian/ubuntu
```
/etc/init.d/ssh restart
```

三、设置ROOT密码
```
passwd
然后输入两次密码，不会显示，不要输错
```


四、重启（也许不用重启，也许要）
```
reboot
```

