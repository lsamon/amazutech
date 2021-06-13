class CreateContactResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_responses do |t|
      t.string :name
      t.string :email, null: false
      t.string :subject, null: false
      t.text :message, null: false
      t.string :ip_address

      t.timestamps
    end
  end
end
