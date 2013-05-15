class Daate < ActiveRecord::Base
  attr_accessible :day, :event, :month, :year

  validates :day, :presence => true,
    :numericality => { :only_integer => true,
      :greater_than_or_equal_to => 1,
      :less_than_or_equal_to => 31 }
  validates :month, :presence => true,
    :numericality => { :only_integer => true,
      :greater_than_or_equal_to => 1,
      :less_than_or_equal_to => 12 }
  validates :year, :presence => true,
    :numericality => { :only_integer => true,
      :greater_than_or_equal_to => 2000 }
  validates :event, :presence => true
end
