class ProjectsController < ApplicationController

    def show
    end

    def index
        @projects = Project.all
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.create(project_params)
        redirect_to project_path(@project)
    end

    private

    def project_params
        params.require(:project).permit(:title, :quote, :style)
    end

end
