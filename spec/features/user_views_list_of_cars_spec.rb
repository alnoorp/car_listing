require 'spec_helper'

describe 'a user views a list of cars in the lot' do

  # Acceptance Criteria
  # I see a list of cars

  it 'views a list of cars' do
    new_car = FactoryGirl.create(:car)

    visit root_path
    expect(page).to have_content new_car.color
    expect(page).to have_content new_car.year
    expect(page).to have_content new_car.mileage
  end
end
