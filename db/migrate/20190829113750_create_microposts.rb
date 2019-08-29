class CreateMicroposts < ActiveRecord::Migration[5.2]
  def change
    create_table :microposts do |t|

      t.string :title
      t.text :body
      t.integer :user_id
      t.timestamps
    end
  end
end
