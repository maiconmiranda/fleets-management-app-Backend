class StatusController < ApplicationController
    before_action :authenticate_user
  
    def index
        render json: { message: 'logged in' }
      end
  end
  