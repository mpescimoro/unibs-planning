class Degree < ActiveRecord::Base

  has_many :courses

  def full_name
    "#{name}" + (master ? ' [M]' : '')
  end
end
