class StatusController < ApplicationController
    before_action :authenticate_user
  
    def index
        render json:  current_user 
      end

      def user
        render json: {  }
      end
  end
  