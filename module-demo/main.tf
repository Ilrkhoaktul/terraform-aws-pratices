resource "aws_iam_user" "mainUser" {
  name = "mainUser"
}

module "dbmodule" {
  source = "./db"
  dbname = "dbModule"
  
}
module "webmodule" {
  source = "./web"
  webname = "webModule"  
}

