require 'spec_helper'

describe Car do
  let(:blanks) { ['', nil] }

  it { should_not have_valid(:color).when(*blanks) }
  it { should have_valid(:color).when('green') }

  it { should_not have_valid(:year).when(1979, *blanks) }
  it { should have_valid(:year).when(2012) }

  it { should_not have_valid(:mileage).when(*blanks) }
  it { should have_valid(:mileage).when(50000) }

  it { should have_valid(:description).when(*blanks) }
  it { should have_valid(:description).when('This is more than a green car') }

end
