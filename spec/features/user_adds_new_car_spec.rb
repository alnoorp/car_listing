require 'spec_helper'

feature 'user adds a new car', %Q{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
} do

  # Acceptance Criteria
  # * I must specify the color, year, mileage of the car
  # * Only years from 1980 and above can be specified
  # * I can optionally specify a description of the car
  # * If I enter all of the required information in the
  #   required format, the car is recorded
  # * If I do not specify all of the required information
  #   in the required formats, the car is not recorded and I am
  #   presented with errors
  # * Upon successfully creating a car, I am redirected so that I can
  #   create another car

  scenario 'required information in required format is specified'
  scenario 'year before 1980 is specified'
  scenario 'optional information is specified'
  scenario 'required information is not specified'
end
