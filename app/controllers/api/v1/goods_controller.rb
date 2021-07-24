class Api::V1::GoodsController < ApiController

  before_action :set_comment

  def index
    @good = Good.find_by(user_id: current_user.id, comment_id: params[:comment_id])
  end

  def create
    @good = Good.create(user_id: current_user.id, comment_id: params[:comment_id])
    @good.save
  end

  def destroy
    @good = Good.find_by(user_id: current_user.id, comment_id: params[:comment_id])
    @good.destroy
  end

  def set_comment
    @comment = Comment.find_by(id: params[:comment_id])
  end
end
