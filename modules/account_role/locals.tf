locals {
  user_role_grants = flatten([
    for user_name, role_names in var.user_role_assignments : [
      for role_name in role_names : {
        user_name = user_name
        role_name = role_name
      }
    ]
  ])
}

#Test from Ganesh Repository
#Branch Testing.
