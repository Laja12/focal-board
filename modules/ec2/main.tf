resource "aws_instance" "my_aws_instance" {
  ami                    = var.ami_value
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = true
  key_name               = var.key_name

  root_block_device {
    volume_size = 15
    volume_type = "gp2"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
              sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
              sudo apt-get update -y
              sudo apt-get install -y docker-ce
              sudo systemctl start docker
              sudo systemctl enable docker
              sudo docker run -d --name focalboard -p 8000:8000 mattermost/focalboard
              EOF

  tags = {
    Name = "my-aws-instance"
  }
}
