class ChangeBestCommentsToBestAnswers < ActiveRecord::Migration[6.1]
  def change
    rename_table :best_comments, :best_answers
  end
end
