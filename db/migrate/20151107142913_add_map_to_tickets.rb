class AddMapToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :map, :text
    remove_column :tickets, :qrcode
    add_column :tickets, :qrcode, :text
  end
end
