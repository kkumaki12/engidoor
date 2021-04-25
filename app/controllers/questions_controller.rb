class QuestionsController < ApplicationController
  include QuestionsHelper

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def list; end

  def create
    @question = current_user.questions.build(question_params)
    tag_list = params[:question][:name].split(/[[:blank:]]+/)
    if @question.save
      @question.save_tags(tag_list)
      redirect_to @question
    else
      render 'new'
    end
  end

    def show
      @question = Question.find(params[:id])
      @comment = current_user.comments.build
      @comments = Comment.all
    end
  

  private

  def question_params
    params.require(:question).permit(:title, :content, tag:[:name])
  end
end
