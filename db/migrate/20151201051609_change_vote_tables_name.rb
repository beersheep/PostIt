class ChangeVoteTablesName < ActiveRecord::Migration
  def change
    rename_table :vote_tables, :votes
  end
end
