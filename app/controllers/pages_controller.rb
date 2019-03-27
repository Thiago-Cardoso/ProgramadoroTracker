class PagesController < ApplicationController
    def home
      @task = Task.new

      if current_user
        @tasks = current_user.tasks.where(status: :false)
        @history = current_user.tasks.where(status: :true)
        @categories = current_user.categories.all
      else
        @tasks = []
        @history = []
        @categories = []
      end
    end
  end