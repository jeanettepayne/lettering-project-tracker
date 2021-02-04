class ProjectsToolsController < ApplicationController

    def new
        @tool = Tool.new
        @pt = ProjectsTool.create
        render 'tools/new'
    end

    def create
        @tool = Tool.create(brand: params[:projects_tool][:tool][:brand], name: params[:projects_tool][:tool][:name])
        binding.pry
        @pt = ProjectsTool.find_by(params[:projects_tool][:project_id], params[:projects_tool][:tool][:name])
        @pt.tool_id = @tool.id
        @pt.save
            # create project tools child here
        redirect_to projects_path
    end

    private

    def pt_params
        params.require(:projects_tool).permit(:favorite, :project_id, :tool_id)
    end

    def tool_params
        params.require(:tools).permit(params[:projects_tool][:tools][:brand], params[:projects_tool][:tools][:name])
    end

end
