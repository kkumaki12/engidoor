module Api
  module V1
    class QuestionsController < ApiController
      attr_accessor :good

      before_action :set_question, only: %i[show destroy]

      rescue_from ActiveRecord::RecordNotFound do |_exception|
        render json: { error: "404 not found" }, status: :not_found
      end

      def index
        questions = Question.where(user_id: params[:user_id])
        render json: questions.as_json(include: :best_answer)
      end

      def new
        if logged_in?
          @question = Question.new
        else
          redirect_to login_path
        end
      end

      def list
        questions = Question.eager_load(:user).select("questions.*,users.name")
        render json: questions.as_json(include: :user)
      end

      def create
        question = Question.create(question_params)
        if question.save!
          render json: question
        else
          render json: { status: "ERROR", data: question.errors }
        end
      end

      def show
        render json: @question.as_json(include: :user)
      end

      def destroy
        @question.destroy
        render json: { status: "SUCCESS", message: "Deleted the question", data: @question }
      end

      def best
        question = Question.joins(:best_answer).select("questions.*,best_answers.*").find(params[:id])
        render json: question.as_json(include: :user)
      end

      def search
        questions = Question.joins(:user).search(params[:search]).page(params[:page]).per(7)
        render json: questions.as_json(include: :user)
      end

      def solved_questions
        questions = Question.joins(:best_answer, :user).select("questions.*,users.name")
        render json: questions.as_json(include: :user)
      end

      def unsolved_questions
        questions = Question.where(user_id: params[:user_id])
        unsolved_questions = questions.where.missing(:best_answer)
        render json: unsolved_questions
      end

      def specialty
        questions = Question.joins(:user).where(tag: params[:tag]).select("questions.*,users.name")
        render json: questions.as_json(include: :user)
      end

      private

      def set_question
        @question = Question.find(params[:id])
      end

      def question_params
        params.permit(:title, :content, :tag, :user_id)
      end
    end
  end
end
