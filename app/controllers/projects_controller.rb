class ProjectsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index, :show, :digital, :traditional]

    def show
        @project = Project.find_by(id: params[:id]) || Project.find_by(id: params[:project_id])
    end

    def index
        @projects = Project.all
    end

    def new
        @user = User.find_by(params[:user_id])
        if @user.id == params[:user_id]
            @project = Project.new
            @project.user_id = params[:id]
        else
            redirect_to users_path
            #message about not having permission
        end
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

    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])
        @project.update(project_params)
        redirect_to project_path(@project)
    end

    def destroy
        project = Project.find(params[:id])
        project.projects_tools.each do |pt|
            pt.destroy
        end
        project.destroy
        redirect_to '/'
    end

    def digital
        @projects = Project.all.digital
    end
    
    def traditional
        @projects = Project.all.traditional
    end


    private

    def project_params
        params.require(:project).permit(:title, :quote, :style, :photo, :user_id)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

end
