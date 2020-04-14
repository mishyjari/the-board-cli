class AddDetailsToClient < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :contact_person, :string
    add_column :clients, :contact_phone, :string
  end
end
