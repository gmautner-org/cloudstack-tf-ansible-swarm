terraform {
  backend "s3" {
    bucket                      = "gmautner-org-terraform-states"
    region                      = "us-east-2"
  }
}
