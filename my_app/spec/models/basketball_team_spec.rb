require 'rails_helper'
require 'spec_helper'

  RSpec.describe BasketballTeam, type: :model do
    let(:incomplete_team) { BasketballTeam.new(city: 'New York') }

    describe BasketballTeam do
      it { should validate_presence_of(:name) }
      it { should validate_uniqueness_of(:name) }
      it { should ensure_inclusion_of(:name).in_array(['Cavaliers', 'Suns', 'Mavericks'])} #etc..
    end
  end

end
