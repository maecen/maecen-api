class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.integer :project_id
      t.integer :cost, default: 800

      t.timestamps null: false
    end
  end
end
