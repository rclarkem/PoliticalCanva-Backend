class RemoveColumnOcdIdFromVoters < ActiveRecord::Migration[6.0]
  def change
    remove_column :voters, :ocd_id, :string
  end
end
