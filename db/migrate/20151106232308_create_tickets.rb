class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets
    add_column :tickets, :aid, :string
    add_column :tickets, :date, :datetime
    add_column :tickets, :trader_name, :string
    add_column :tickets, :trader_address, :string
    add_column :tickets, :client_name, :string
    add_column :tickets, :authorization_number, :string
    add_column :tickets, :type_of_card, :string
    add_column :tickets, :tvr, :string
    add_column :tickets, :vat, :float
    add_column :tickets, :amount, :float
  end
end
