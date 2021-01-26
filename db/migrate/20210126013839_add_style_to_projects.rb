class AddStyleToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :style, :string
  end
end
