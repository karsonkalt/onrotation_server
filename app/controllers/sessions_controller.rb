class SessionsController < ApplicationController

    def login
        @user = User.find_by(email_address: params[:session][:emailAddress])
        if @user && @user.authenticate(params[:session][:password])
            render json: @user
        else
            render json: {errors: "Invlaid credentials"}
        end
    end
end
