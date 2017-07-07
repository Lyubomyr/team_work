class CreateFileGroups < ActiveRecord::Migration
  def change
    create_table :file_groups do |t|
      t.string :name
      t.string :description
      t.integer :position

      t.timestamps null: false
    end
  end
end
