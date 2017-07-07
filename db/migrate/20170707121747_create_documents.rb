class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.string :file
      t.integer :position
      t.references :file_group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
