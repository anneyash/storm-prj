module Api; module V1
  class ProjectsController < BaseApiController
    def index
      @projects = Project.all
    end

    def show
      @project = Project.find(params[:id])
    end

    def create
      @project = Project.new(project_params)
      @project.save!
      # render json: true
      render :show
    end

    def update
      @project = Project.find(params[:id])
      @project.update!(project_params)
      render json: true
    end

    def destroy
      @project = Project.find(params[:id])

      ActiveRecord::Base.transaction do
        @project.tasks.destroy_all
        @project.destroy!
      end

      render json: true
    end

    private
      def project_params
        params.require(:project).permit(:title)
      end
  end
end end


