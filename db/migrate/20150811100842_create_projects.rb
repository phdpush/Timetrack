class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.text :project_name
      t.text :project_description

      t.timestamps null: false
    end
  end
end
