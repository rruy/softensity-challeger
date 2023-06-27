require 'rails_helper'

RSpec.describe Api::TicketsController, type: :controller do
  describe 'POST #create' do
    let(:ticket_params) do
      {
        request_number: '09252012-00001',
        sequence_number: '2421',
        request_type: 'Normal',
        request_action: 'Restake',
        date_times: {
          response_due_date_time: '2011/07/13 23:59:59'
        },
        service_area: {
          primary_service_area_code: {
            sa_code: 'ZZGL103'
          }
        },
        additional_service_area_codes: {
          sa_code: ['ZZL01', 'ZZL02', 'ZZL03']
        },
        digsite_info: {
          well_known_text: 'POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295,-81.08858407706913 32.02259853170128,-81.05322183341679 32.02434500961698,-81.05047525138554 32.042681017283066,-81.0319358226746 32.06537765335268,-81.01202310294804 32.078469305179404,-81.02850259513554 32.07963291684719,-81.07759774894413 32.07090546831167,-81.12154306144413 32.08806865844325,-81.13390268058475 32.07206917625161))'
        }
      }
    end

    let(:excavator_params) do
      {
        company_name: 'John Doe CONSTRUCTION',
        address: '555 Some RD',
        crew_onsite: true
      }
    end

    it 'creates a new ticket and excavator' do
      expect do
        post :create, params: { ticket: ticket_params, excavator: excavator_params }
      end.to change(Ticket, :count).by(1).and change(Excavator, :count).by(1)

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq({ 'message' => 'Ticket created successfully' })
    end

    it 'returns error if ticket creation fails' do
      post :create, params: { ticket: { request_number: '' } }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['errors']).to include("Request number can't be blank")
      expect(JSON.parse(response.body)['errors']).to include("Sequence number can't be blank")
      expect(JSON.parse(response.body)['errors']).to include("Request type can't be blank")
      expect(JSON.parse(response.body)['errors']).to include("Request action can't be blank")
    end
  end
end
