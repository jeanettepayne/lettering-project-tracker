class ProjectsController < ApplicationController

    def show
        @project = Project.find_by(id: params[:id])
    end

    def index
        @projects = Project.all
    end

    def new
        @project = Project.new
    end

    def create
        if @project = Project.create(project_params)
        redirect_to projects_path
        else
            render 'new'
        end
    end

    private

    def project_params
        params.require(:project).permit(:title, :quote, :style, :photo, :user_id)
    end

end
