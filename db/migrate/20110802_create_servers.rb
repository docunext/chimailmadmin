class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :server
      t.string :description
      t.integer :server_type_id
      t.string :host_name

      t.timestamps
    end
  end
end
