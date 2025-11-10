module "management_group" {
  source      = "./modules/management_group"
  name        = "az104-mg1"
  display_name = "az104-mg1"
}

module "helpdesk_group" {
  source      = "./modules/ad_group"
  display_name = "Help Desk"
  description  = "Help Desk support group"
}

module "vm_contributor_role" {
  source       = "./modules/role_assignment"
  scope_id     = module.management_group.management_group_id
  principal_id = module.helpdesk_group.group_object_id
  role_name    = "Virtual Machine Contributor"
}

module "custom_support_role" {
  source       = "./modules/role_assignment"
  scope_id     = module.management_group.management_group_id
  principal_id = module.helpdesk_group.group_object_id
  role_name    = "Custom Support Request"

  permissions = [
    "*/read",
    "Microsoft.Support/*/read",
    "Microsoft.Support/*/write"
  ]
  not_actions = [
    "Microsoft.Support/register/action"
  ]
}
