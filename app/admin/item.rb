ActiveAdmin.register Item do

	  config.batch_actions = true
  
  filter :category
  filter :name
  filter :amount
  filter :url
  
  index do
    selectable_column
    id_column
	column :category
    column :name
    column :amount
    column :url
    column "Request Date", :created_at 
    
    default_actions
  end
  
end
