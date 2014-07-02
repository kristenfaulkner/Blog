class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title, presence: true
      t.string :url, presence: true
      t.timestamps
    end
  end
end
