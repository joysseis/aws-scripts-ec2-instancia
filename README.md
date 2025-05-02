# ec2-instancia-apache

Script Bash para criar uma instância EC2 na AWS com Apache instalado automaticamente.

## 📋 O que este script faz

- Cria um **grupo de segurança** com acesso liberado à porta 80 (HTTP)
- Obtém a **AMI mais recente** do Amazon Linux 2023 (x86_64)
- Cria uma **instância EC2 t2.micro**
- Instala e inicia automaticamente o **servidor Apache (httpd)** via `user-data`

## 📁 Arquivo principal

- `criar-instancia.sh` – Script Bash que automatiza todo o processo

## 🚀 Como usar

1. **Configure o AWS CLI** (com `aws configure`) e tenha permissões EC2.
2. Crie ou use um **par de chaves** (`.pem`) existente na região desejada.
3. Altere o nome da instancia no arquivo, pares de chave e grupo de segurança.
4. Clone este repositório:

   ```bash
   git clone https://github.com/seu-usuario/ec2-instancia-apache.git
   cd ec2-instancia-apache

 No seu terminal (CloudShell ou local):

# Clone o repositório recém-criado
git clone https://github.com/SEU_USUARIO/ec2-instancia-apache.git
cd ec2-instancia-apache

# Salve o script no diretório
nano criar-instancia.sh
# (Cole o conteúdo que está no Canvas e salve)

# Dê permissão de execução (opcional)
chmod +x criar-instancia.sh

# Faça o commit e envie para o GitHub
git add criar-instancia.sh
git commit -m "Adiciona script para criação de instância EC2 com Apache"
git push origin main
