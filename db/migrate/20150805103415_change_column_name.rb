class ChangeColumnName < ActiveRecord::Migration
  def up
  	change_column :tasks, :dateworked, :date
  end
  def down
  	change_column :tasks, :dateworked, :integer
  end
end