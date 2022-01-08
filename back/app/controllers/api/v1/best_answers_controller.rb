module Api
  module V1
    class BestAnswersController < ApiController
      def create
        comment = Comment.find(params[:comment_id])
        question_id = comment.question_id
        binding.pry
        best_answer = BestAnswer.new(question_id: question_id, comment_id: params[:comment_id])
        if best_answer.save
          render json: best_answer, status: :created
        else
          render json: { status: 400 }
        end
      end

      def show
        best_answers = BestAnswer.joins(:question).select("best_answers.*,questions.*")
        render json: best_answers
      end
    end
  end
end
