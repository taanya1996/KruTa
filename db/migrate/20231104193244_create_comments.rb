class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.timestamps

      t.references :user, null: false, foreign_key: true
      t.references :tweet, null: false, foreign_key: true
    end
  end
end
