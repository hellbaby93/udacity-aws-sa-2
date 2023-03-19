
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "udacity_t2" {
  count         = 4
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnets[0]

  tags = {
    Name  = "Udacity T2"
    Count = count.index + 1
  }
}

# resource "aws_instance" "udacity_m4" {
#   count         = 2
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = "m4.large"
#   subnet_id     = module.vpc.public_subnets[0]

#   tags = {
#     Name  = "Udacity M4"
#     Count = count.index + 1
#   }
# }

