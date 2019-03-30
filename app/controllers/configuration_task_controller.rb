class ConfigurationTaskController < ApplicationController
  before_action :set_configuration_task, only: [:show, :edit, :update, :destroy]
  def index
    @configuration_task = ConfigurationTask.new
    @configuration_tasks = ConfigurationTask.all
  end

  
  def new
   
  end

  def edit
  end

  def create
    @configuration_task = ConfigurationTask.new(configuration_task_params)
    @configuration_task.user = current_user

    respond_to do |format|
      if @configuration_task.save
        format.html { redirect_to configuration_task_index_path, notice: 'Config was successfully created.' }
        format.json { render :root, status: :created, location: @configuration_task_index_path }
      else
        format.html { redirect_to configuration_task }
        format.json { render json: @configuration_task_index_path.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
  end

  def show
  end

  def destroy
  end

  
  private
    def set_configuration_task
      @configuration_task = ConfigurationTask.find(params[:id])
    end

  private 
    def configuration_task_params
      params.require(:configuration_task).permit(:duration, :duration_break, :duration_break_long, :long_pause_delay, :have_song , :template)
    end

end
