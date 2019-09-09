class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
  @messages = Message.order(created_at: :asc)
  end

  def index
  @messages = Message.order(created_at: :asc)
  end
end
