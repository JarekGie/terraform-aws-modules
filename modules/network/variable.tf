variable "project_name" {
  description = "Project identifier"
  type        = string
}
variable "region" {
  description = "AWS region"
  type        = string
}

variable "cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of CIDR blocks for the public subnets"
  type        = list(string)
  default     = []
}

variable "private_subnets" {
  description = "List of CIDR blocks for the private subnets"
  type        = list(string)
  default     = []
}

variable "availability_zones" {
  description = "List of availability zones in the region"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Enable NAT gateway for private subnets"
  type        = bool
  default     = true
}
variable "enable_internet_gateway" {
  description = "Enable NAT gateway for private subnets"
  type        = bool
  default     = true
}
variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
