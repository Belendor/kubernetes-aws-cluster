output "public_ec2_ips_master" {
  value = [
    for instance in aws_instance.master :  join("", ["http://", instance.public_ip])
  ]
}

output "public_ec2_ips_workers" {
  value = [
    for instance in aws_instance.master :  join("", ["http://", instance.public_ip])
  ]
}
