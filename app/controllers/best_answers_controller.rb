class BestAnswersController < ApplicationController

    def create
        comment = Comment.find(params[:comment_id])
        question_id = comment.question_id
        @best_answer = BestAnswer.create(question_id: question_id, comment_id: params[:comment_id])
        @best_answer.save
        redirect_to root_path
    end
end
