class CreateOpinions < ActiveRecord::Migration[6.0]
  def change
    create_table :opinions do |t|
      t.integer :auther_id
      t.text :text
      t.timestamps
      t.index :auther_id
    end
  end
end
