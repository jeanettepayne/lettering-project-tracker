class ProjectsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index, :show, :digital, :traditional]

    def show
        @project = Project.find_by(id: params[:id]) || Project.find_by(id: params[:project_id])
        @user = @project.user
    end

    def index
        @projects = Project.all
    end

    def new
        @user = User.find(params[:user_id])
        if current_user.id == @user.id
            @project = Project.new
            @project.user_id = params[:id]
        else
            redirect_to users_path
            flash.alert = "You can only add a new project to your own page!"
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
        @user = User.find(params[:user_id])
        if current_user.id == @user.id
            @project = find_project
        else
            redirect_to user_path(@user)
            flash.alert = "You cannot edit another user's project!"
        end
    end

    def update
        @project = find_project
        @project.update(project_params)
        redirect_to project_path(@project)
    end

    def destroy
        @user = User.find(params[:user_id])
        if current_user.id == @user.id
            project = find_project
            project.projects_tools.each do |pt|
                pt.destroy
            end
            project.destroy
            redirect_to user_path(@user)
        else
            redirect_to project_path(project)
        end
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

    def find_project
        Project.find(params[:id])
    end

end
