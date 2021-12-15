output "public-server" {
  description = "Public IP of public server"
  value       = aws_instance.my_public_server.public_ip
}
output "pvtadd-public-server" {
  description = "public address of the first instance"
  value       = aws_instance.my_public_server.private_ip
}
output "pvt-server-1st" {
  description = "private address of the first instance"
  value       = aws_instance.pvt_first_server.private_ip
}

output "pvt-server-2nd" {
  description = "private address of the first instance"
  value       = aws_instance.pvt_second_server.private_ip
}

output "pvt-server-3rd" {
  description = "private address of the first instance"
  value       = aws_instance.pvt_third_server.private_ip
}

output "pvt-server-4th" {
  description = "private address of the first instance"
  value       = aws_instance.pvt_fourth_server.private_ip
}

output "pvt-server-5th" {
  description = "private address of the first instance"
  value       = aws_instance.pvt_fifth_server.private_ip
}
output "image_id" {
    value = "${data.aws_ami.my_aws_ami.id}"
}
