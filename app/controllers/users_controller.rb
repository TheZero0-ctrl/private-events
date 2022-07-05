class UsersController < ApplicationController
    before_action :authenticate_user!
    def index
        @users = User.all.order("username DESC")
        @event = Event.find(params[:event_id])
    end

    def show
        @user = User.find(params[:id])   
    end
end
