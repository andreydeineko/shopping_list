ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Recent Items" do
          ul do
            Item.order("created_at desc").limit(7).map do |item|
              li link_to(item.name, admin_item_path(item))
            end
          end
        end
      end
    end  

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end

    # section "Recently requested items" do
    #   table_for Item.order("created_at desc").limit(7) do |item|
    #     column :name do |product|
    #       link_to item.name, [:admin, item]
    #     end
    #     column :created_at
    #   end
    #   strong { link_to "View all items", admin_items_path }
    # end
  end # content
end
