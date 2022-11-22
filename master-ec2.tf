resource "aws_instance" "master" {
  count = var.ec2_count_master

  ami                    = var.ec2_ami
  instance_type          = var.ec2_type_master
  key_name               = aws_key_pair.generated_key.key_name
  subnet_id              = module.vpc.public_subnets[count.index % length(module.vpc.public_subnets)]
  vpc_security_group_ids = [aws_security_group.my-sg.id]
  user_data = templatefile("${path.module}/master-script.sh", {
    file_content = "Master online"
  })

  tags = {
    Name = "kubernetes-master-node"
  }
}
