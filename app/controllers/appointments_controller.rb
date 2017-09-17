class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: :show
  before_action :check_invalid_user, only: :show

  def index
    @appointments = current_user.appointments
  end

  def show
    

  end

  private

  def set_appointment
    @appointment = Appointment.find_by(token: params[:id])
  end

  def check_invalid_user
    redirect_to appointments_path unless ((current_user == @appointment.user) || current_user.admin?)
  end
end
