terraform {
  backend "s3" {
    bucket         = "aamina-terraform-bucket"
    key            = "portfolio/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
