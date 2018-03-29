class Message < ApplicationRecord
  belongs_to :user
  # belongs_to :room, required: false
  #
  #   validates :body, presence: true

    after_create_commit { BroadcastMessageJob.perform_later self  }
    # private
    #
    # def broadcast_message
    #   MessageBroadcastJob.perform_later(self)
    # end
  end
#   default_scope { order(created_at: :desc).limit(20) }
# end
