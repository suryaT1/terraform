terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "6.2.2"
    }
  }
}

provider "github" {
  token= ""
}
resource "github_repository" "terraform" {
name= "terraform"
description = " terraform automation"
visibility = "public"
}
