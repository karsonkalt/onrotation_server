class SessionsController < ApplicationController

    def login
        username = params[:session][:username]
        password = params[:session][:password]

        byebug
    end
end
