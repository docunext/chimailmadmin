class ServersAndDomainsJoinTable < ActiveRecord::Migration
  def up
    create_table :domains_servers, :id => false do |t|
      t.integer :server_id
      t.integer :domain_id
    end

  end

  def down
    drop_table :domains_servers
  end
end
