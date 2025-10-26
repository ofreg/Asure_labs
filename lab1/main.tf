module "user" {
  source = "./modules/user"
  user_principal_name = "az104-user1@ofreg13gmail.onmicrosoft.com"
  display_name        = "az104-user1"
  mail_nickname       = "az104-user1"
  password            = "TempP@ssw0rd123!"
  job_title           = "IT Lab Administrator"
  department          = "IT"
  usage_location      = "US"
}

module "invitation" {
  source = "./modules/invitation"
  user_email_address = "ruterdoglif@gmail.com"
  redirect_url       = "https://portal.azure.com"
  user_display_name  = "External User"
  additional_recipients = ["ruterdoglif@gmail.com"]
}

module "group" {
  source = "./modules/group"

  display_name = "IT Lab Administrators"
  lab_user_id  = module.user.user_object_id
  external_user_id = module.invitation.user_id
}
