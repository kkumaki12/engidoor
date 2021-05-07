class QuestionsController < ApplicationController
  attr_accessor :good

  include QuestionsHelper

  def index
    @questions = Question.all
    @comment = Comment.new
    @good = Good.new
  end

  def new
    if logged_in?
      @question = Question.new
    else
      redirect_to login_path
    end
  end

  def list
    @questions = Question.search(params[:search]).page(params[:page]).per(7)
  end

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
    @comment = Comment.new
    @comments = Comment.all
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, tag: [:name])
  end
end
