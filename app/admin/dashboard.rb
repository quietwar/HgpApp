ActiveAdmin.register_page "Dashboard" do
  #before_action authenticate_admin!

  menu priority: 1,

  label: proc{ I18n.t("HGP.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Cohorts" do
          table_for Cohort.order("id desc").limit(10) do
            ul do

              #li link_to(post.title, admin_post_path(post))
            end
          end
        end
      end

      column do
        panel "Geniuses" do
          para "Welcome to the Hidden Genius Project!"
        end
       end
     end
    end
  end # content
#end
