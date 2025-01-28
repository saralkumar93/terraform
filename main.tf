resource "aws_instance" "ec2" {
    ami = "ami-00bb6a80f01f03502"
    instance_type = "t2.micro"
    tags = {
      Name = "terraform-server"
    }
  
}

