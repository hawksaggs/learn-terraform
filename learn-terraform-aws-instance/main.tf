terraform {
  cloud {
    organization = "neuproelectro-learn"
    workspaces {
      name = "learn-terraform"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws" // Fetch from terraform registry
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

/**
 A provider is a plugin that Terraform uses to create and manage your resources.
*/
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

/**
the resource type and resource name form a unique ID for the resource
*/
resource "aws_instance" "app_server" {
  ami           = "ami-06eecef118bbf9259" //"ami-0022f774911c1d690"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
