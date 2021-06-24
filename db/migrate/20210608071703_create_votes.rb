class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :votable, polymorphic: true, index: true, null: false
      t.boolean :upvote

      t.timestamps
    end
  end
end
