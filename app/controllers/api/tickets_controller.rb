class Api::TicketsController < ApplicationController
  def create
    ticket = Ticket.new(ticket_params)

    if ticket.save
      ticket.build_service_area(sa_code_params)
      ticket.build_excavator(excavator_params)
      ticket.build_date_times(date_times_params)

      render json: { message: 'Ticket created successfully' }, status: :created
    else
      render json: { errors: ticket.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

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
    params.require(:excavator).permit(:company_name, :address, :crew_onsite, :city, :state, :zip, :type,
      contact: [:name, :phone, :email],
      field_contact: [:name, :phone, :email]
    )
  end

  def sa_code_params
    service_area_params[:service_area][:primary_service_area_code][:sa_code]
  end

  def date_times_params
    ticket_date_times = params.require(:ticket).permit(
      ticket_date_times: [
        :request_taken_date_time,
        :transmission_date_time,
        :legal_date_time,
        :response_due_date_time,
        :restake_date,
        :expiration_date,
        :lp_meeting_accept_due_date,
        :overhead_begin_date,
        :overhead_end_date
      ]
    )

    ticket_date_times[:ticket_date_times]
  end
end
