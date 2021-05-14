class CreateBestComments < ActiveRecord::Migration[6.1]
  def change
    create_table :best_comments do |t|
      t.references :question, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
