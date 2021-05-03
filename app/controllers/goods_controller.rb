class GoodsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @good = Good.find_by(user_id: current_user.id, comment_id: params[:comment_id])
  end

  def create
    @comment = Comment.find_by(id: params[:comment_id])
    @good = Good.create(user_id: current_user.id, comment_id: params[:comment_id])
    @good.save
  end

  def destroy
    @comment = Comment.find_by(id: params[:comment_id])
    @good = Good.find_by(user_id: current_user.id, comment_id: params[:comment_id])
    @good.destroy
  end

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
end
