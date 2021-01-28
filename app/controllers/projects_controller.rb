class ProjectsController < ApplicationController

    def show
        @project = Project.find_by(id: params[:id])
    end

    def index
        @projects = Project.all
    end

    def new
        @project = Project.new
        @project.tools.build(brand: 'Enter or Select Brand')
    end

    def create
        @project = Project.create(project_params)
        @project.user_id = current_user.id
        if @project.save
            redirect_to project_path(@project)
        else
            render 'new'
        end
    end

    private

    def project_params
        params.require(:project).permit(:title, :quote, :style, :photo, :user_id)
    end

end
