// Cria um repositório AWS CodeCommit.
resource "aws_codecommit_repository" "RepoTeste" {
  repository_name = "RepoTeste"  // Nome do repositório.
  description     = "Repositorio para Teste"  // Descrição do repositório.

  // Tags para o repositório.
  tags = {
    Nome   = "Repositorio-Teste"
    Squad  = "Backend"
  }
}

// Cria uma política IAM para negar pushes diretos para a branch master.
resource "aws_iam_policy" "deny_master_push" {
  name        = "DenyMasterPush"  
  description = "Deny direct pushes to master branch" 

  // Conteúdo da política.
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Action": "codecommit:GitPush",
      "Resource": "${aws_codecommit_repository.RepoTeste.arn}",
      "Condition": {
        "StringEqualsIfExists": {
          "codecommit:References": [
            "refs/heads/master"
          ]
        }
      }
    }
  ]
}
POLICY
}

// Anexa a política IAM ao grupo "Developers".
resource "aws_iam_policy_attachment" "attach_deny_master_push" {
  name       = "AttachDenyMasterPush" 
  policy_arn = aws_iam_policy.deny_master_push.arn  
  
  groups = ["Developers"]  // Nome do grupo ao qual a política será anexada.
}
