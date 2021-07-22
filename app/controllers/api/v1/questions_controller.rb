class Api::V1::QuestionsController < ApiController

  attr_accessor :good

  include QuestionsHelper

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    questions = Question.joins(:user).where(user_id: params[:user_id])
    render json: questions
  end

  def new
    if logged_in?
      @question = Question.new
    else
      redirect_to login_pat
    end
  end

  def list
    questions = Question.joins(:user).select("questions.*,users.name").page(params[:page]).per(7)
    render json: questions
  end

  def create
    question = Question.create(question_params)
    puts(question_params)
    if question.save!
      render json: question
    else
      render json: { status: 'ERROR', data: question.errors }
    end
  end

  def show
    question = Question.joins(:user).select("questions.*, users.*").find(params[:id])
    render json: question
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end

  def best
    question = Question.joins(:best_answer).select('questions.*,best_answers.*').find(params[:id])
    render json: question
  end


  private

  def question_params
    params.permit(:title, :content,:tag,:user_id)
  end
end
