class CreateAliases < ActiveRecord::Migration
  def change
    create_table :aliases do |t|
      t.string :alias
      t.string :target

      t.timestamps
    end
  end
end
