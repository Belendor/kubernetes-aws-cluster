resource "aws_instance" "worker" {
  count = var.ec2_count_workers

  ami                    = "ami-0caef02b518350c8b"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.generated_key.key_name
  subnet_id              = module.vpc.public_subnets[count.index % length(module.vpc.public_subnets)]
  vpc_security_group_ids = [aws_security_group.my-sg.id]
  user_data = templatefile("${path.module}/worker-script.sh", {
    file_content = "Worker online"
  })

  tags = {
    Name = "kubernetes-worker-node"
  }
}
