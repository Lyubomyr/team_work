class CreateFileGroupTranslation < ActiveRecord::Migration
  def up
     FileGroup.create_translation_table!({
      name: :string,
      description: :string
    }, {
      migrate_data: true
    })
  end

  def down
    FileGroup.drop_translation_table! migrate_data: true
  end
end
