variable "repos" {
  description = "Open source organization repos list"
  type        = map(any)

  default = {
    Repo_1_Type_X = {
      name        = "repo-1-type-x"
      description = "This is my 1 Github repository type x"
      visibility  = "public"
      auto_init   = true
    }

  }
}
