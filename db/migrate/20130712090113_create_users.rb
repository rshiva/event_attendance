class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :mobile
      t.string :twitter_handle
      t.string :company
      t.references :event


      t.timestamps
    end
  end
end
