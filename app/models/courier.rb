require 'pry'

class Courier < ActiveRecord::Base
  has_many :tickets
  has_many :clients, through: :tickets

  def self.active_couriers
    Courier.all.select do |c|
      c.active
    end
  end

  def toggle_active_for_courier
    if self.active
      self.active = false
    else
      self.active = true
    end
    self.save
  end

  def incomplete_tickets_by_courier
    self.tickets.select do |t|
      t.status != 'complete'
    end
  end

  def get_courier_tickets_by_date_range(first,last)
    self.tickets.select do |t|
      t.time_ordered > first && t.time_ordered < last
    end
  end

  def clear_couriers

  end

  def last_drop

  end

end
