class Api::V1::BestAnswersController < ApiController

  def create
    comment = Comment.find(params[:comment_id])
    question_id = comment.question_id
    @best_answer = BestAnswer.create(question_id: question_id, comment_id: params[:comment_id])
    @best_answer.save
end

def show
  best_answers = BestAnswer.joins(:question).select('best_answers.*,questions.*')
  render json:best_answers
end


