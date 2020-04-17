class Client < ActiveRecord::Base
  has_many :tickets
  has_many :couriers, through: :tickets

  def self.clients_with_incomplete_tickets
    Client.all.select do |c|
      c.tickets.any?{|t| t.status != 'complete'}
    end
  end

  def incomplete_tickets_by_client
    Ticket.all.incomplete_jobs.select do |t|
      t.client_id == self.id
    end
  end

  def has_contact_info
    self.contact_person && self.contact_phone
  end
end
