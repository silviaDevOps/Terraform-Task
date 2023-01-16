variable "common_tags" {
  default = {

    Environment = "Test"
    Project     = "VPC_Task"
    Team        = "DevOps"
    Created_by  = "Silvia_Bursuc"
  }
  description = "Additional resource tags"
  type        = map(string)
}