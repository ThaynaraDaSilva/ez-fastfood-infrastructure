# Introdução

Este repositório contém a **configuração da infraestrutura AWS** para os microsserviços **order-ms**, **payment-ms**, **catalog-ms** e **user-ms** do projeto **ez-fastfood**. Toda a infraestrutura, incluindo rede, computação, banco de dados e mensageria, é provisionada via Terraform, garantindo uma gestão eficiente e modular.

Os principais recursos provisionados incluem:

- **Rede**: VPC, Internet Gateway, Subnets, NAT e Rotas.
- **Computação**: AWS EKS e seus Nodes.
- **Balanceamento de Carga**: Application Load Balancer (ALB).
- **Segurança**: Security Groups para controle de acesso.
- **Banco de Dados**: 
  - AWS RDS Postgres para os microsserviços **order-ms**, **payment-ms** e **catalog-ms**.
  - AWS Document para o microsserviço **user-ms**.
= **Mensageria**: AWS SQS para fila de pagamento, utilizada por order-ms e payment-ms.

## Desenho de Arquitetura

## Video de apresentação da arquitetura

## Pré requisitos
1. Credenciais AWS para permitir o provisionamento de recursos. No pipeline configurado no GitHub Actions, as credenciais foram armazenadas como secret variables para evitar exposição direta no código:
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
  
2. Execução da pipeline de criação de infraestrutura

3. Execução manual do arquivo **postgres-dbs.sql**, disponível no repositório: https://github.com/ThaynaraDaSilva/ez-fastfood-infrastructure. A execução deve ocorrer uma única vez, logo após a criação do recurso de banco de dados e antes de subir os microsserviços.


## Commands

aws eks update-kubeconfig --region us-east-1 --name ez-fastfood-cluster-dev

kubectl get pods
kubectl get nodes
kubectl get services

