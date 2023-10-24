terraform {
  // Especifica os provedores necessários e suas versões.
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.70.0"
    }
  }
  // Configura o backend para armazenar o estado do Terraform no S3.
  backend "s3" {
    bucket = "lilith-tfstate"  // Nome do bucket S3.
    key    = "aws-labs-codecommit/lilith-tfstate"  // Chave sob a qual o estado será armazenado.
    region = "us-east-1"  // Região do bucket S3.
  }
}

// Configura o provedor AWS.
provider "aws" {
  region = "us-east-1"  
}

// Recupera informações sobre a identidade do chamador AWS no seu computador.
data "aws_caller_identity" "current" {
}
