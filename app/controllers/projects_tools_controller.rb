class ProjectsToolsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:show]

    def new
        project = Project.find(params[:project_id])
        @user = project.user
        if current_user.id == @user.id
            # @tool = Tool.find_or_create_by(id: params[:tool_id])
            @pt = ProjectsTool.new
            @pt.project_id = params[:project_id]
    
            render 'projects_tools/new'
        else
            redirect_to user_path(@user)
            flash.alert = "You can only add tools to your own projects"
        end
    end

    def create
        @pt = ProjectsTool.create(pt_params)
        tool = Tool.find_or_create_by(name: params["projects_tool"]["tool"]["name"])
        @pt.tool_id = tool.id
        @pt.project_id = params[:project_id]
        @pt.update(pt_params)
        project = @pt.project
        
        @pt.save
        redirect_to project_path(project)
    end

    def edit
        project = Project.find(params[:project_id])
        @user = project.user
        if current_user.id == @user.id
            @pt = ProjectsTool.find(params[:id])
        else
            redirect_to project_path(project)
            flash.alert = "You can only edit tools on your own projects"
        end
    end

    def update
        @pt = ProjectsTool.find(params[:id])
        @pt.update(pt_params)

        redirect_to projects_tool_path(@pt)
    end

    def show
        @pt = ProjectsTool.find(params[:id])
        @user = @pt.project.user
    end

    def destroy
        pt = ProjectsTool.find(params[:id])
        project = pt.project
        pt.destroy
        redirect_to project_path(project)
    end

    private

    def pt_params
        params.require(:projects_tool).permit(:favorite, :project_id, :tool_id, :tool)
    end

    def tool_params
        params.require(:tools).permit(params[:projects_tool][:tools][:name])
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
      end

end
