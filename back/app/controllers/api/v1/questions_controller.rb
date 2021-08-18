class Api::V1::QuestionsController < ApiController

  attr_accessor :good

  include QuestionsHelper

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    questions = Question.where(user_id: params[:user_id])
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
    questions = Question.joins(:user).select("questions.*,users.name")
    render json: questions
  end

  def create
    question = Question.create(question_params)
    if question.save!
      render json: question
    else
      render json: { status: 'ERROR', data: question.errors }
    end
  end

  def show
    question=Question.find(params[:id])
    render json: question.as_json(include: :user)
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    render json: { status: 'SUCCESS', message: 'Deleted the question', data: question }
  end

  def best
    question = Question.joins(:best_answer).select('questions.*,best_answers.*').find(params[:id])
    render json: question
  end

  def search
      questions = Question.search(params[:search]).page(params[:page]).per(7)
      render json:questions
  end

  def solved_answers
    questions = Question.joins(:best_answer)
    render json: questions.as_json(include: :user)
  end

  def specialty
    questions = Question.where(tag: params[:tag])
    render json: questions.as_json(include: :user)
  end


  private

  def question_params
    params.permit(:title, :content, :tag, :user_id)
  end
end
