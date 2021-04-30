class GoodsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @good = Good.create(user_id: current_user.id, comment_id: params[:comment_id])
    @good.save
  end

  def destroy
    @good = Good.find_by(user_id: current_user.id, comment_id: params[:comment_id])
    @good.destroy
  end
end
