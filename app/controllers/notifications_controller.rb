class NotificationsController < ApplicationController

    def index
        @notifications = BookmarkedTrack.where(user_id: params[:user_id]).all
        @notifications += BookmarkedTracklist.where(user_id: params[:user_id]).all
        render json: @notifications, status: 200, each_serializer: NotificationSerializer
    end
end
