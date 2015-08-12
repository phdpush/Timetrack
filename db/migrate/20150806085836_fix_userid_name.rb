class FixUseridName < ActiveRecord::Migration
def up
    rename_column :tasks, :userid, :user_id
  end

  def down
    rename_column :tasks, :user_id, :userid

  end
end
