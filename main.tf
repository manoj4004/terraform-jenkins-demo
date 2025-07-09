provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "jenkins_server" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.medium"
  key_name      = "jenkins"

  subnet_id     = "subnet-0c4562377d6219710"  

  tags = {
    Name = "JenkinsServer"
  }

  user_data = <<-EOT
    #!/bin/bash
    sudo yum update -y
    sudo amazon-linux-extras enable corretto11
    sudo yum install java-11-amazon-corretto -y
    sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
    sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
    sudo yum install jenkins -y
    sudo systemctl enable jenkins
    sudo systemctl start jenkins
  EOT
}

