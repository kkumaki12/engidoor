class AddImpressionsCountToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :impressions_count, nill: false :integer, default: 0
    
  end
end
