class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def list; end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
    end

    def show
      @question = Question.find(params[:id])
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
