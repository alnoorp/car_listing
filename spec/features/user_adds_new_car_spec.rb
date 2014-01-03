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

  scenario 'required information in required format is specified' do
    visit root_path
    click_link 'Add New Car'
    fill_in 'Color', with: 'red'
    fill_in 'Year', with: 2012
    fill_in 'Mileage', with: 40000
    fill_in 'Description', with: 'More than a red car'
    click_button 'Save Car'

    expect(page).to have_content('New car successfully added')
    expect(page).to have_content('red')
    expect(page).to have_content(2012)
    expect(page).to have_content(40000)
    expect(page).to have_content('Add New Car')
  end

  scenario 'year before 1980 is specified' do
    visit root_path
    click_link 'Add New Car'
    fill_in 'Color', with: 'blue'
    fill_in 'Year', with: 1979
    fill_in 'Mileage', with: 200000
    click_button 'Save Car'

    within '.input.car_year' do
      expect(page).to have_content('must be greater than or equal to 1980')
    end
  end

  scenario 'required information is not specified' do
    visit root_path
    click_link 'Add New Car'
    click_button 'Save Car'

    within '.input.car_color' do
      expect(page).to have_content "can't be blank"
    end

    within '.input.car_year' do
      expect(page).to have_content "can't be blank"
    end

    within '.input.car_mileage' do
      expect(page).to have_content "can't be blank"
    end
  end
end
