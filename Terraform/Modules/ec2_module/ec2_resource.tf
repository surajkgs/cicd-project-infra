data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"] # Canonical
}
output "ami_id" {
    value = "aws_ami.ubuntu.id"
}

data "template_file" "user_data" {
  template = file("${path.module}/templates/user-data.sh.tpl")

  vars = {
    DB_CONFIG_PATH     = "/var/home/test"
  }
  
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  associate_public_ip_address = true
  availability_zone = var.availability_zone_var
  key_name = var.key_pair_name_var
  subnet_id = var.subnet_id_var
  vpc_security_group_ids = [var.security_groups_var]
  user_data = data.template_file.user_data.rendered
  tags = {
    Name = var.instance_name_var
  }
}


