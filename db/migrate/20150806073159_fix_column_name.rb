class FixColumnName < ActiveRecord::Migration
def up
    rename_column :tasks, :taskdescription, :description
  end

  def down
    rename_column :tasks, :description, :taskdescription

  end
end
