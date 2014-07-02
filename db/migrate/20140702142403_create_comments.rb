class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :link_id, presence: true
      t.text :body, presence: true
      t.timestamps
    end
  end
end
