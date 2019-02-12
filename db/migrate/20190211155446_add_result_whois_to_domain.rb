class AddResultWhoisToDomain < ActiveRecord::Migration[5.2]
  def change
    add_column :domains, :result_whois, :string
  end
end
