class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def submit_time
    @date = Date.today.beginning_of_month
    @project = current_user.projects.where(:id => params[:id])
  end



  def report
    @tasks = current_user.tasks.order("dateworked")
  end

  def dashboard
    #tasks = current_user.tasks.where(:dateworked => Date.today.beginning_of_month..Date.today.end_of_month)
    @tasks = current_user.admin? ? Task.order("dateworked") : current_user.tasks.order("dateworked")
    @sum = 0
    @tasks.each do |t|
      @sum = @sum + t.hoursworked
    end

  end  
  # GET /tasks
  # GET /tasks.json
  
  def index
    @projects = current_user.projects
    @tasks = current_user.tasks.where(:dateworked => params[:dateworked])
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show

  end

  # GET /tasks/new
  def new
    @projects = current_user.projects
    @task = Task.new(:dateworked => params[:dateworked])
  end

  # GET /tasks/1/edit
  def edit  
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params.merge!({:user_id => current_user.id}))

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        @projects = current_user.projects
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :hoursworked, :dateworked, :project_id)
    end
end
