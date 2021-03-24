module Api; module V1
  class TasksController < BaseApiController
    def index
      @tasks = Task.all
      @tasks = @tasks.where(project_id: params[:filter_by_project_id]) if params[:filter_by_project_id].present?
      @tasks = @tasks.where(task_state: params[:filter_by_task_state]) if params[:filter_by_task_state].present?
    end

    def show
      @task = Task.find(params[:id])
    end

    def create
      @task = Task.new(task_params)
      @task.save!
      # render json: true
      render :show
    end

    def update
      @task = Task.find(params[:id])
      @task.update!(task_params)
      render json: true
    end

    def destroy
      @task = Task.find(params[:id])
      @task.destroy!
      render json: true
    end

    private
      def task_params
        params.require(:task).permit(:title, :body, :project_id, :task_state, :deadline_at)
      end
  end
end end


