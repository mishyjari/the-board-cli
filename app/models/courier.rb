class Courier < ActiveRecord::Base
  has_many :tickets
  has_many :clients, through: :tickets
end
