resource "aws_instance" "main" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
  vpc_security_group_ids = [var.security_group_id]

  root_block_device {
    volume_size = 15
    volume_type = "gp2"
  }

  user_data = <<-EOF
               #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              service docker start
              docker run -d --name focalboard -p 8000:8000 mattermost/focalboard
              EOF
  tags = {
    Name = "main-instance"
  }
}
