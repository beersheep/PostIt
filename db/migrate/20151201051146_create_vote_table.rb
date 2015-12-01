class CreateVoteTable < ActiveRecord::Migration
  def change
    create_table :vote_tables do |t|
      t.boolean :vote
      t.string :voteable_type
      t.integer :voteable_id
      t.timestamps 
    end
  end
end
