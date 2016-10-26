class CreateNameGeneration < ActiveRecord::Migration
  def change
    create_table :name_generations do |t|
      t.string :name
      t.text :domains_info
    end
  end
end
