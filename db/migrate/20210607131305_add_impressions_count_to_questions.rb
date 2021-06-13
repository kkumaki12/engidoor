class AddImpressionsCountToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :impressions_count,:integer, nill: false, default: 0
    
  end
end
