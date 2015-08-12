class AddColumnName < ActiveRecord::Migration
  def change
  	add_column :tasks, :userid, :integer
  end
end
