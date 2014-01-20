ActiveAdmin.register Item do

	  config.batch_actions = true

  filter :category
  filter :name
  filter :amount
  filter :comments
  filter :url
  
  index do
    selectable_column
    id_column
	column :category
    column :name
    column :amount
    column :url
    column "Request Date", :created_at 
    column "Likes", :cached_votes_up
    column "Dislikes", :cached_votes_down
    column "Voting summary", :cached_votes_score
    
    default_actions
  end
  
end
