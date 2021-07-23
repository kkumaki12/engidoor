class Api::V1::CommentsController < ApiController
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.create(comment_params)
    puts(comment_params)
    if comment.save!
      render json: comment
    else
      render json: { status: "ERROR", data: comment.errors }
    end
  end

  def show
    comments = Comment.eager_load(:user).where(question_id: params[:id]).select("*")
    render json: comments
  end

  def comments_count
    comments_count = Comment.where(question_id: params[:id]).count
    render json: comments_count
  end

  private

  def comment_params
    params.permit(:content, :question_id, :user_id)
  end
end
