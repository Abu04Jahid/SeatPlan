require 'rails_helper'

RSpec.describe "SeatPlans", type: :request do
	let!(:seat_plans) { create_list(:seat_plan, 10) }
  let(:seat_plan_id) { seat_plans.first.id }

#Test suit for get/seat_plans

 describe 'GET /seat_plans' do
    # make HTTP get request before each example
    before { get '/seat_plans' }

   it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
 end

 describe 'GET /seat_plans/:id' do
    before { get "/seat_plans/#{seat_plan_id}" }

    context 'when the record exists' do

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end



# Test suite for POST /seat_plans
  describe 'POST /seat_plans' do
    # valid payload
    let(:valid_attributes) { { building_name: '4th science', floor_no: '2nd', room_no: '219', specific_seat_no: '21' } }

    context 'when the request is valid' do
      before { post '/seat_plans', params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/seat_plans', params: { building_name: '4th science', floor_no: '2nd' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
 
    end
  end

   # Test suite for DELETE /seat_plans/:id
  describe 'DELETE /seat_plans/:id' do
    before { delete "/seat_plans/#{seat_plan_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end
