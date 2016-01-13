class AddCoverToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :cover_image, :string
  end
end
