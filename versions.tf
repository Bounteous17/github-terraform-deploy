provider "github" {
  token = var.provider_github_token
  owner = "terraformed-organization"
}

resource "github_repository" "repo-1-type-x" {
  name        = "repo-1-type-x"
  description = "This is my 1 Github repository type x"
  visibility  = "public"
  auto_init   = true
}

resource "github_branch_protection" "main" {
  repository_id = github_repository.repo-1-type-x.node_id

  pattern                         = "main"
  allows_deletions                = false
  allows_force_pushes             = false
  require_signed_commits          = true
  require_conversation_resolution = true

  required_status_checks {
    strict = true
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    restrict_dismissals             = true
    required_approving_review_count = 2
    require_last_push_approval      = true
  }
}
