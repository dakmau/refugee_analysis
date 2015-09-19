class AddSentimentToPost < ActiveRecord::Migration
  def change
    add_column :posts, :positivity, :float
  end
end
