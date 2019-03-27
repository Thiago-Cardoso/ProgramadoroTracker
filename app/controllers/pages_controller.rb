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
    end
  end