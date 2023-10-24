# AWS Labs - Configuração do CodeCommit com Terraform

Este projeto visa ajudar os iniciantes a entenderem como configurar um repositório AWS CodeCommit usando Terraform. Os arquivos de configuração incluídos neste projeto definem um repositório CodeCommit, políticas IAM e um grupo IAM. Além disso, um script shell é fornecido para configurar uma regra de aprovação que exige dois aprovadores para merges na branch master.

## Estrutura do Projeto

- `main.tf`: Configura os provedores, o backend do Terraform e a região AWS.
- `groups.tf`: Define um grupo IAM chamado "Developers".
- `CodeCommit-Repo-Teste.tf`: Define um repositório CodeCommit, uma política IAM para negar pushes diretos para a branch master e anexa essa política ao grupo "Developers".
- `approval-rule.sh`: Script shell para criar um template de regra de aprovação e associá-lo ao reposit
