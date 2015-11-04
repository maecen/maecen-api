class AddTeaserToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :teaser, :string
    add_column :projects, :homepage, :string
  end
end
