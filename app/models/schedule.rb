class Schedule < ApplicationRecord
  belongs_to :event

  # index download_links: true do
  #   column :name
  #   #column :address
  #   #column :cell
  #   column :email
  #   default_actions
  end
#end
