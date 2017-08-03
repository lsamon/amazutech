class AddContactIpAddressToContactSubmissions < ActiveRecord::Migration[5.1]
  def change
    add_column :contact_submissions, :contact_ip_address, :string
  end
end
