ActiveAdmin.register User do
  
  config.batch_actions = true
  
  filter :name
  filter :email
  filter :created_at

  index do
    selectable_column
    id_column
    column :name
    column :email
    column "Date of registration", :created_at
    column :admin

    default_actions
  end
  
end
