class EnrollmentsController < ApplicationController
    before_action :authenticate_user!
    def create
        @event = Event.find(params[:event_id])
        @enrollment = Enrollment.new(event_id: @event.id, user_id: params[:user_id], status:params[:status])
        if @enrollment.save
            flash[:notice] = "You joined '#{@event.title}' event!"
            redirect_to @event
        else
            flash[:alert] = "Some error!"
            redirect_to @event, status: :unprocessable_entity
        end
    end

    def destroy
        @event = Event.find(params[:event_id])
        @enrollment = Enrollment.find(params[:id])
        @enrollment.destroy
        if current_user == @event.host
            flash[:notice] = "you cancel invitation"
        else
            flash[:notice] = "you leave the event '#{@event.title}'"
        end
        redirect_to @event
    end

    def update
        @event = Event.find(params[:event_id])
        @enrollment = Enrollment.find_by(event_id: params[:event_id], user_id: current_user.id, status: params[:status])
        @enrollment.update(event_id: params[:event_id], user_id:current_user.id, status:1)
        redirect_to @event
    end
end
