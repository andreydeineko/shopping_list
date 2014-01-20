ActiveAdmin.register Item do

	 config.batch_actions = true

  filter :category, as: :check_boxes, collection: Item::CATEGORIES
  filter :name
  filter :amount
  filter :comments
  filter :url, as: :check_boxes
  filter "Votes" do
    :cached_votes_score
  end
  
  index do

    selectable_column
    id_column
	  column :category
    column :name do |item|
      link_to(item.name, admin_item_path(item))
    end
    column :amount
    column :url
    column "Request Date", :created_at 
    column :comments do |item|
      item.comments.count
    end
    column "Likes", :cached_votes_up
    column "Dislikes", :cached_votes_down
    column "Voting summary", :cached_votes_score
    
    default_actions
  end

  show do |item|
    attributes_table do
      row :category      
      row :amount
      row "Request Date" do 
        item.created_at
      end   
      row "Likes" do
        item.cached_votes_up
      end
      row "Dislikes" do
        item.cached_votes_down
      end
      row "Voting summary" do
        item.cached_votes_score
      end
      row "Link to image/product" do
        item.url
      end
    end
    strong { link_to "Back to all items", admin_items_path }
  end
  
end
