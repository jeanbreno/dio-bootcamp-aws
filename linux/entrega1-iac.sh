#!/bin/bash

echo "Criando diretórios..."

mkdir /publico /adm /ven /sec

echo "Criando grupos de usuários..."

groupadd GRP_ADM GRP_VEN GRP_SEC

echo "Criando usuários para o grupo GRP_ADM..."

for user in carlos maria joao
do 
  useradd $user -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
done

echo "Criando usuários para o grupo GRP_VEN..."

for user in debora sebastiana roberto
do
  useradd $user -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
done

echo "Criando usuários para o grupo GRP_SEC..."

for user in josefina amanda rogerio
do
  useradd $user -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
done

echo "Especificando permissões dos diretórios /adm /ven /sec...."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Execução finalizada!"
