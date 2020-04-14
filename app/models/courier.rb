class Courier < ActiveRecord::Base
  has_many :tickets
  has_many :clients, through: :tickets

  def incomplete_tickets_by_courier
    self.tickets.select do |t|
      t.status != 'complete'
    end
  end
end
