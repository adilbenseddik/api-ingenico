class AddQrcodeToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :qrcode, :string
  end
end
