class DashboardController < ApplicationController
    #before_action :authenticate_user!, except: [:opened] #before logot not permited login, exept opened
    def index

    end

    def stats
      if params[:date_from].present? && params[:date_to].present?
        date_from = params[:date_from].to_date rescue Date.current
        date_from = date_from.beginning_of_day # sets to 00:00:00
        date_to = params[:date_to].to_date rescue Date.current
        date_to = date_to.end_of_day # sets to 23:59:59
        @tasks = current_user.tasks.where(created_at: date_from..date_to).order('id DESC')
        # @tasks = current_user.tasks.order('id DESC')
      else
        @currentUser = current_user
        @tasks = current_user.tasks.order('id DESC')
      end
    end

  end