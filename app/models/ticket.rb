class Ticket < ActiveRecord::Base
  belongs_to :courier
  belongs_to :client
  
  attr_accessor :time_due
  
  # Calculate time due based on ordered time.
  # Service tiers are 3 hours for non-rush and 1 hour for rush
  # Expand this later to allow for client-specified due times
  def time_due
    if self.rush
      self.time_ordered + 1.hour
    else
      self.time_ordered + 3.hours
    end
  end

  def self.unassigned_jobs
    Ticket.all.select do |t|
      !t.courier_id
    end
  end

  def self.incomplete_jobs
    Ticket.all.select do |t|
      t.status != 'complete'
    end
  end

  def self.pending_jobs
    Ticket.all.select do |t|
      t.status == 'pending'
    end
  end

  def self.all_jobs_today
    now = Time.now
    Ticket.all.select do |t|
      t.time_due.today? 
    end
  end

  def self.completed_jobs_today
    Ticket.all.all_jobs_today.select do |t|
      t.status == 'completed'
    end
  end

  def unassign
    self.courier_id = nil
    self.status = 'unassigned'
    self.save
  end

  def assign(courier)
    self.courier_id = courier.id
    self.status = 'assigned'
    self.save
    'Job #' + self.id.to_s + ' assigned to ' + courier.name
  end

  def complete(pod, time=Time.now)
    self.status = 'complete'
    self.time_delivered = time
    self.pod = pod
    self.save
    'Job #' + self.id.to_s + ' completed!'
  end
end
