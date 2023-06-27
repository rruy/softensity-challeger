require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  describe 'GET #index' do
    it 'assigns all tickets to @tickets' do
      ticket1 = Ticket.create(request_number: '09252012-00001', sequence_number: '2421', request_type: 'Normal', request_action: 'Restake')
      ticket2 = Ticket.create(request_number: '09252012-00002', sequence_number: '2422', request_type: 'Normal', request_action: 'Restake')

      get :index
      expect(assigns(:tickets)).to match_array([ticket1, ticket2])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested ticket to @ticket' do
      ticket1 = Ticket.create(request_number: '09252012-00001', sequence_number: '2421', request_type: 'Normal', request_action: 'Restake')

      get :show, params: { id: ticket1.id }
      expect(assigns(:ticket)).to eq(ticket1)
    end

    it 'renders the show template' do
      ticket2 = Ticket.create(request_number: '09252012-00002', sequence_number: '2422', request_type: 'Normal', request_action: 'Restake')

      get :show, params: { id: ticket2.id }
      expect(response).to render_template(:show)
    end
  end
end
