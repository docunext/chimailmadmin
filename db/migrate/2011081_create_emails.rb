class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :address
      t.integer :domain_id
      t.string :first_name
      t.string :last_name
      t.integer :quota
      t.string :maildir
      t.boolean :active

      t.timestamps
    end
  end
end
