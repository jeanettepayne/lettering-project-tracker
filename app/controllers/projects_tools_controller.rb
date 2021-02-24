class ProjectsToolsController < ApplicationController

    def new
        # @tool = Tool.find_or_create_by(id: params[:tool_id])
        @pt = ProjectsTool.new
        render 'projects_tools/new'
    end

    def create
        @pt = ProjectsTool.create(pt_params)
        # @tool = Tool.create(brand: params[:projects_tool][:tool][:brand], name: params[:projects_tool][:tool][:name])
        # binding.pry
        # @pt = ProjectsTool.find_by(params[:projects_tool][:project_id], params[:projects_tool][:tool][:name])
        # @pt.tool_id = @tool.id
        # @pt.save
            # create project tools child here
        redirect_to projects_path
    end

    def edit
        @pt = ProjectsTools.find(params[:id])
    end

    def update

    end

    private

    def pt_params
        params.require(:projects_tool).permit(:favorite, :project_id, :tool_id)
    end

    def tool_params
        params.require(:tools).permit(params[:projects_tool][:tools][:brand], params[:projects_tool][:tools][:name])
    end

end
