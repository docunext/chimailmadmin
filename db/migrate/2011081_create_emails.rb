class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :address
      t.string :domain_id

      t.timestamps
    end
  end
end
