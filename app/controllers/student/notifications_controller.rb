class Student::NotificationsController < ApplicationController

  def update
    @notification = Notification.find(params[:id])
    authorize @notification
  
    if @notification
      @notification.update(status: false)
      render json: { success: true }
    else
      render json: { success: false, error: "Notification not found" }, status: :not_found
    end
  end
end
