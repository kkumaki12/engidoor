class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    @good = Good.new
  end

  def new
    @comment = Comment.new
  end

  def create
    @user = User.new

    if logged_in?
      @comment = current_user.comments.create(comment_params)
      if @comment.save
        redirect_back(fallback_location: root_path)
      else
        render "questions/show"
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
