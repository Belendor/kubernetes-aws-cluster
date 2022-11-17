variable "region" {
  description = "The region Terraform deploys your instances"
  type        = string
  default     = "eu-central-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "ec2_count_master" {
  description = "Number of EC2 instances"
  type        = number
  default     = 1
}

variable "ec2_count_workers" {
  description = "Number of EC2 instances"
  type        = number
  default     = 0
}

variable "rules" {
  type = list(object({
    port        = number
    proto       = string
    cidr_blocks = list(string)
  }))

  default = [
    {
      port        = 80
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 22
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 6443
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 443
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 8443
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
