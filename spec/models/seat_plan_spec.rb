require 'rails_helper'

# Test suite for the Seat_plan model
RSpec.describe SeatPlan, type: :model do

	before :each do
		@seat_plan = SeatPlan.new
	end
  it { should validate_presence_of(:building_name) }
  it { should validate_presence_of(:floor_no) }
  it { should validate_presence_of(:room_no) }
  it { should validate_presence_of(:specific_seat_no) }

    	it "is valid with valid attributes" do
		@seat_plan.building_name = "4th Science}"
		@seat_plan.floor_no  = "1st"
		@seat_plan.room_no      = "222"
		@seat_plan.specific_seat_no = "22"
		expect(@seat_plan).to be_valid
	end
end
