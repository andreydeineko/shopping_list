ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do


    # Here is an example of a simple dashboard with columns and panels.
    #
  columns do
    column do
      panel "Recently Added Items" do
        ul do
          Item.order("created_at desc").limit(10).map do |item|
            li link_to(item.name, admin_item_path(item))
          end
        end
      strong { link_to "View all items", admin_items_path }
      end
    end
  end

=begin

    panel "Recently requested items" do
      ul do
        Item.order("created_at desc").limit(7) do |item|
         li link_to(item.name, admin_item_path(item))
        end
      column :created_at
      end
      strong { link_to "View all items", admin_items_path }
    end
=end

  end # content
end
