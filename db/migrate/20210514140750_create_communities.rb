class CreateCommunities < ActiveRecord::Migration[6.1]
  def change
    create_table :communities do |t|
      t.string :name
      t.string :url
      t.text :description
      t.integer :total_members
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
