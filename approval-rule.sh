#!/bin/bash

# Cria um template de regra de aprovação que exige dois aprovadores para merges na branch master.
aws codecommit create-approval-rule-template --approval-rule-template-name "2-Approvers-Rule" --approval-rule-template-content "{
    \"Version\": \"2018-11-08\",
    \"DestinationReferences\": [\"refs/heads/master\"],
    \"Statements\": [{
        \"Type\": \"Approvers\",
        \"NumberOfApprovalsNeeded\": 2
    }]
}"

# Associa o template de regra de aprovação ao repositório RepoTeste.
aws codecommit associate-approval-rule-template-with-repository --repository-name RepoTeste --approval-rule-template-name 2-Approvers-Rule
