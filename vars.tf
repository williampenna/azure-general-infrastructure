# SECRETS, PLEASE PROVIDE THESE VALUES IN A TFVARS FILE
variable "SUBSCRIPTION_ID" {}
variable "TENANT_ID" {}
variable "AZURE_DEVOPS_PERSONAL_TOKEN" {}
variable "AZURE_DEVOPS_ORG_SERVICE_URL" {}

# GLOBAL VARIABLES
variable "RESOURCE_GROUP" {
  default = "test-event-hub"
}
variable "LOCATION" {
  default = "eastus2"
}
