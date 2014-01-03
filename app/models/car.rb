class Car < ActiveRecord::Base
  validates :year, presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 1980 }
end
