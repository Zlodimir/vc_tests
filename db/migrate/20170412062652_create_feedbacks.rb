class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.string :email, null: false
      t.string :text, null: false
    end
  end
end
