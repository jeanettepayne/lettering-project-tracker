class RemoveTypeFromProjects < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :type, :string
  end
end
