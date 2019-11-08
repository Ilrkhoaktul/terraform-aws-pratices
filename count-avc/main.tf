module "instances" {
  source = "./ec2"
  servers =  ["web","db","app"]
  
}

output "public_ips" {
  value = "${module.instances.public_ip}"
}

