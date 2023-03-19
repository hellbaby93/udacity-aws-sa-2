variable "env_var" {
    type = map(string)
    default = {
        greeting = "greeting"
    }
}

variable "tags" {
    type = map(string)
    default = {
        created_by = "terraform"
        env = "udacity"
    }

}