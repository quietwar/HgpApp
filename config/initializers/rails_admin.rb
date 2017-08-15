RailsAdmin.config do |config|

  ### Popular gems integration
  # config.configure_with(:import) do |config|
  #     config.logging = true
  #   end
  ## == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :user
   end
   config.current_user_method(&:current_user)

   config.main_app_name = ["HGP"]
  # or something more dynamic
  config.main_app_name = Proc.new { |controller| [ "HGP - #{controller.params[:action].try(:titleize)}" ] }


  ## == Cancan ==
  # config.authorize_with :cancan
  config.authorize_with do
    redirect_to main_app.root_path unless current_user.is_admin?
  end



  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    #new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show

  private
    def confirmation_period_valid?
      return true
    end
  end
end
