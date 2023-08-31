provider "github" {
  token = var.provider_github_token
  owner = "terraformed-organization"
}

module "config" {
  source = "./config"
}

module "github_resources" {
  source = "./github"

  for_each = module.config.repos_list

  name        = each.value.name
  description = each.value.description
  visibility  = each.value.visibility
  auto_init   = each.value.auto_init
}

moved {
  from = github_branch_protection.main
  to   = module.github_resources["Repo_1_Type_X"].github_branch_protection.main
}

moved {
  from = github_repository.repo-1-type-x
  to   = module.github_resources["Repo_1_Type_X"].github_repository.repo-1-type-x
}
