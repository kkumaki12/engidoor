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
    comments = Comment.includes(:user).where(question_id: params[:id], reply_comment: [nil, '']).select('*')
    render json: comments.as_json(include: :user)
  end

  def comments_count
    comments_count = Comment.where(question_id: params[:id]).count
    render json: comments_count
  end

  def reply
    comments = Comment.includes(:user).where(reply_comment: params[:id]).select('*')
    render json: comments.as_json(include: :user)
  end


  private

  def comment_params
    params.permit(:content, :question_id, :user_id, :reply_comment)
  end
end
