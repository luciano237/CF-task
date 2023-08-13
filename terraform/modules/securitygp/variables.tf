variable "myvpc" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {
    Project   = "coalfire"
    env       = "stage"
    Terraform = true
  }
}
