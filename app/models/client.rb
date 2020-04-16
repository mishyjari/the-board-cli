class Client < ActiveRecord::Base
  has_many :tickets
  has_many :couriers, through: :tickets

  def self.clients_with_incomplete_tickets
    Client.all.select do |c|
      c.tickets.any?{|t| t.status != 'complete'}
    end
  end
end
