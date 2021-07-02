class Api::V1::CommentsController < ApiController

  def index
    @comments = Comment.all
    render json: @comments
    @good = Good.new
  end

  def new
    @comment = Comment.new
  end

  def create

    if logged_in?
    @comment = current_user.comments.create(comment_params)
    if @comment.save!
      redirect_back(fallback_location: root_path)
    else
      redirect_to root_path
    end
  else
    redirect_to login_path
  end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :question_id)
  end
end

