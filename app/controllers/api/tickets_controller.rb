class Api::TicketsController < ApplicationController
  def create
    ticket = Ticket.new(ticket_params)

    if ticket.save
      ticket.build_service_area(sa_code_params)
      ticket.build_excavator(excavator_params)

      render json: { message: 'Ticket created successfully' }, status: :created
    else
      render json: { errors: ticket.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def sa_code_params
    service_area_params[:service_area][:primary_service_area_code][:sa_code]
  end

  def ticket_params
    params.require(:ticket).permit(
      :request_number, :sequence_number, :request_type, :request_action
    )
  end

  def service_area_params
    params.require(:ticket).permit(
      service_area: [primary_service_area_code: [:sa_code]]
    )
  end

  def excavator_params
    params.require(:excavator).permit(:company_name, :address, :crew_onsite)
  end
end
