class CreateProjectsTools < ActiveRecord::Migration[6.0]
  def change
    create_table :projects_tools do |t|
      t.integer :project_id, optional: true
      t.integer :tool_id, optional: true
      t.boolean :favorite, default: false

      t.timestamps
    end
  end
end
