class EventsController < ApplicationController
    before_action :authenticate_user!, except: %i[ index show]
    def index
        @events = Event.all.order("created_at DESC")
    end

    def show
        @event = Event.find(params[:id])
    end
    def new
        @event = Event.new
    end

    def create
        @event = current_user.hosted_events.build(event_params)
        if @event.save
            flash[:notice] = "Event '#{@event.title}' created!"
            redirect_to @event
        else
            flash.now[:alert] = "Some error!"
            render :new, status: :unprocessable_entity
        end
    end

    private
    def event_params
        params.require(:event).permit(:title, :description, :location, :event_date)
    end
end
