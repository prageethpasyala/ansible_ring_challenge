resource "aws_security_group" "my_app_sg" {
  name        = "my_app_sg"
  description = "Allow access to my Server"
  vpc_id      = aws_vpc.main_vpc.id

    # INBOUND RULES
  ingress {
    description      = "SSH from my mac"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "SSH from my VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["192.168.0.0/16"]
  }

  ingress {
    description      = "HTTP from Any"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "HTTPS from Any"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
      description = "Allow access to the world"
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my_app_sg"
  }
}

data "aws_ami" "my_aws_ami" {
    owners = ["099720109477"]
    most_recent = true
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    }
}








# EC2 - PUBLIC
resource "aws_instance" "my_public_server" {
    # ami = data.aws_ami.my_aws_ami.id
    ami = "ami-08ca3fed11864d6bb"
    instance_type = var.instance_type
    key_name = var.keypair_name
    subnet_id = aws_subnet.public_a.id
    vpc_security_group_ids = [ aws_security_group.my_app_sg.id ]
    associate_public_ip_address = true

                user_data = <<-EOF
                 #!/bin/bash
                  ########################################
                  ##### USE THIS WITH AMAZON LINUX 2 #####
                  ########################################

                  # get admin privileges
                  sudo su
                  # install httpd (Linux 2 version)
                  apt update -y
                  apt upgrade -y
                  apt install apache2 -y
                  ufw allow OpenSSH
                  ufw allow 'Apache Full'
                  sudo systemctl start apache2
                  sudo systemctl reload apache2
                 
                  echo "Hello World from $(hostname -f)" > /var/www/html/index.html
                 EOF

tags = {
    Name = "PUBLIC_Server"
  }
}

# EC2 - PRIVATE
resource "aws_instance" "pvt_first_server" {
    ami = data.aws_ami.my_aws_ami.id
    instance_type = var.instance_type
    key_name = var.keypair_name
    subnet_id = aws_subnet.private_a.id
    vpc_security_group_ids = [ aws_security_group.my_app_sg.id ]

  tags = {
    Name = "Private_first_server"
  }            

}


resource "aws_instance" "pvt_second_server" {
    ami = data.aws_ami.my_aws_ami.id
    instance_type = var.instance_type
    key_name = var.keypair_name
    subnet_id = aws_subnet.private_b.id
    vpc_security_group_ids = [ aws_security_group.my_app_sg.id ]

    tags = {
    Name = "Private_second_server"
  }  
}

resource "aws_instance" "pvt_third_server" {
    ami = data.aws_ami.my_aws_ami.id
    instance_type = var.instance_type
    key_name = var.keypair_name
    subnet_id = aws_subnet.private_c.id
    vpc_security_group_ids = [ aws_security_group.my_app_sg.id ]

    tags = {
    Name = "Private_third_server"
  }  
}

resource "aws_instance" "pvt_fourth_server" {
    ami = data.aws_ami.my_aws_ami.id
    instance_type = var.instance_type
    key_name = var.keypair_name
    subnet_id = aws_subnet.private_d.id
    vpc_security_group_ids = [ aws_security_group.my_app_sg.id ]

    tags = {
    Name = "Private_fourth_server"
  }  
}

resource "aws_instance" "pvt_fifth_server" {
    ami = data.aws_ami.my_aws_ami.id
    instance_type = var.instance_type
    key_name = var.keypair_name
    subnet_id = aws_subnet.private_e.id
    vpc_security_group_ids = [ aws_security_group.my_app_sg.id ]

    tags = {
    Name = "Private_fifth_server"
  }  
}


# AMI ID
# INSTANCE TYPE
# KEYPAIR
# SUBNET - Private
# SECURITY GROUPS
# USER-DATA template (optional)

# TASK:
# NEW EC2 in Public subnet
# Check the public IP Address exists or add the EIP to the server
# SSH using the keypair to the new public server
# ssh -i ~/.ssh/private_key ec2-user@<IP_PUBLIC_SERVER>
# Try to copy your private key to the public server and connect to the private server.
# scp -i ~/.ssh/ta-lab-key.pem ~/.ssh/ta-lab-key.pem ec2-user@<IP_PUBLIC_SERVER>:/home/users/ec2-user/




