class AddGeocodeToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :geo, :string
  end
end
