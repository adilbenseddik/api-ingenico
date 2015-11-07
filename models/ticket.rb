class Ticket < ActiveRecord::Base
  validates :aid, presence: true
  validates :date, presence: true
  validates :trader_name, presence: true
  validates :trader_address, presence: true
  validates :client_name, presence: true
  validates :authorization_number, presence: true
  validates :type_of_card, presence: true
  validates :tvr, presence: true
  validates :vat, presence: true
  validates_numericality_of :vat, :greater_than => 0
  validates :amount, presence: true
  validates_numericality_of :amount, :greater_than => 0
end
