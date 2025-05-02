#!/bin/bash

# Configurações
NOME_INSTANCIA="instancia-nome"
PAR_CHAVE="parchave-nome"
GRUPO_SEGURANCA="grupo-nome"

echo "Criando grupo de segurança..."
SECURITY_GROUP_ID=$(aws ec2 create-security-group --group-name $GRUPO_SEGURANCA --description "Permitir HTTP" --query "GroupId" --output text)

echo "Liberando porta 80 (HTTP)..."
aws ec2 authorize-security-group-ingress --group-id $SECURITY_GROUP_ID --protocol tcp --port 80 --cidr 0.0.0.0/0

echo "Buscando AMI mais recente Amazon Linux 2023..."
AMI_ID=$(aws ssm get-parameters-by-path --path "/aws/service/ami-amazon-linux-latest" \
  --query "Parameters[?ends_with(Name, 'al2023-ami-kernel-default-x86_64')].Value" \
  --output text)

echo "Iniciando instância EC2..."
aws ec2 run-instances \
  --instance-type t2.micro \
  --image-id $AMI_ID \
  --security-group-ids $SECURITY_GROUP_ID \
  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$NOME_INSTANCIA}]" \
  --key-name $PAR_CHAVE \
  --user-data "#!/bin/bash
yum -y install httpd
systemctl enable httpd
systemctl start httpd"

echo "Instância criada com sucesso!"
