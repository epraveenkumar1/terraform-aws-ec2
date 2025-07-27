# key pair(login)
resource "aws_key_pair" "my_key" {
  key_name   = "terra_key_ec2"
  public_key = file("terra-key-ec2.pub")
}


# VPC & Security Group
resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "my_security_group" {
  name = "automate-sg-new"
  description = "this will add a TF generated security group"
  vpc_id = aws_default_vpc.default.id  # interpolation

  # inbound rules
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH Open"
  }

  ingress {
    from_port = 8000
    to_port = 8000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Flask App Open"
  }

  # outbound rules
  egress {
    from_port   = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All access open outbound"
  }

  tags = {
    Name = "automate-sg-new"
  }
}

# ec2 instance
resource "aws_instance" "my_instance" {
  # count = 2
  for_each = tomap({
    TWS-Junoon-automate-micro = "t2.micro",
    TWS-Junoon-automate-medium = "t2.medium",
    TWS-Junoon-automate-small = "t2.small"
  }) # meta argument

  depends_on = [ aws_security_group.my_security_group, aws_key_pair.my_key ]

  key_name = aws_key_pair.my_key.key_name   
  security_groups = [aws_security_group.my_security_group.name]

  # instance_type = "t2.micro"
  instance_type = each.value

  ami = var.ec2_ami_id  #ubuntu

  # If we want to run any shell script (install) at the first time creation of instance
  user_data = file("install_nginx.sh")

  root_block_device {
    volume_size = var.env == "prd" ? 20 : var.ec2_default_root_storage_size
    volume_type = "gp3"
  }

  tags = {
    # Name = "TWS-Junoon-automate"
    Name = each.key
  }
}