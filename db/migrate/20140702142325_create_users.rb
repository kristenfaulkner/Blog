class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, presence: true
      t.string :password, presence: true
      t.string :token
      t.timestamps
    end
  end
end
