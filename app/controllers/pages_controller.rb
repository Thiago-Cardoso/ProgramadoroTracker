class PagesController < ApplicationController
    def home
      @tasks = Task.all
      @array_tasks = Array.new 
      @array_tasks = @tasks.group_by { |t| t.status}
      # puts @array_tasks["0"]
    end

    def get_config
      @config = ConfigurationTask.first
      render json: @config

      @task = Task.new

      # if current_user
      #   @tasks = current_user.tasks.where(status: :false)
      #   @history = current_user.tasks.where(status: :true)
      #   @categories = current_user.categories.all
      # else
      #   @tasks = []
      #   @history = []
      #   @categories = []
      # end

    end
  end