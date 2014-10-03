class Degree < ActiveRecord::Base

  has_many :courses

  has_many :users

  def full_name
    (human_name.blank? ? name : human_name) + (master ? ' [M]' : '')
  end
end
