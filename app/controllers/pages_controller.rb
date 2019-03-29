class PagesController < ApplicationController
    def home
      @task = Task.new

      if current_user
        @tasks = current_user.tasks.all
        @array_tasks = Array.new 
        @array_tasks = @tasks.group_by(&:status)
        @categories = current_user.categories.all
      else
        @array_tasks = []
        @tasks = []
        @categories = []
      end
    end

    def get_config
      # @config = ConfigurationTask.where(user_id: current_user.id).last
      @config = current_user.configuration_task.first
      render json: @config
      @task = Task.new
    end

    def set_status_task
      Task.update(params[:task_id], :status => true, :end_date => Time.now)
      @finish_task = Task.find(params[:task_id]).status
      render json: @finish_task
    end

    # Task.update(2,:status => false)

  end