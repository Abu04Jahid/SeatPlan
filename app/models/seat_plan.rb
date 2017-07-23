class SeatPlan < ApplicationRecord

	  # validations
  validates_presence_of :building_name, :floor_no, :room_no, :specific_seat_no
end
