#####脚本使用#####
#使用默认"1234qwer"为密码
#bash openssh.sh
####
#自定义密码(passwd改为你需要设置的密码)
#bash openssh.sh passwd

#sshd_config配置文件备份
cp /etc/ssh/sshd_config > /etc/ssh/sshd_config.bak

#修改配置
sed -i "s/PasswordAuthentication.*/PasswordAuthentication yes/g" /etc/ssh/sshd_config
sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config

#重启SSH
service ssh restart && service sshd restart && systemctl restart ssh && systemctl restart sshd && /etc/init.d/ssh restart && /etc/init.d/sshd restart

#设置root密码
if [ ! $1 ];then
	pwd="1234qewr"
else
  pwd=$1
fi
echo root:$pwd | chpasswd
