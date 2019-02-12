class CreateDomains < ActiveRecord::Migration[5.2]
  def change
    create_table :domains do |t|
      t.string :domain_name
      t.string :domain_status
      t.string :expires_on
      t.string :name_servers

      t.timestamps
    end
  end
end
