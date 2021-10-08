class NotificationsController < ApplicationController

    def index
        t_n = BookmarkedTrack.where(user_id: params[:user_id], has_unseen_updates: true).all
        tl_n = BookmarkedTracklist.where(user_id: params[:user_id], has_unseen_updates: true).all
        
        combined_n = t_n + tl_n
        combined_n = combined_n.sort_by {|n| n.updated_at}
        
        render json: combined_n, status: 200, each_serializer: NotificationSerializer
        
    end
end
