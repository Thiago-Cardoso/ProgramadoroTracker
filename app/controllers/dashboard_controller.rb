class DashboardController < ApplicationController
    #before_action :authenticate_user!, except: [:opened] #before logot not permited login, exept opened
    def index

    end

    def stats
      @currentUser = current_user
    end

  end