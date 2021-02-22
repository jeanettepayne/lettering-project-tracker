class ToolsController < ApplicationController

    def show
        @tool = Tool.find_by(id: params[:id])
    end

    def index
        @tools = Tool.all
    end

    def new
        @tool = Tool.new
        @tool.projects_tools.build(project_id: params[:project_id])
        # binding.pry
    end

    def create
        @tool = Tool.create(tool_params)
        binding.pry
        @pt = ProjectsTool.find_by(tool_id: "")
        @pt.tool_id = @tool.id
        @pt.save
            # create project tools child here
        redirect_to projects_path
       
    end

    private

    def tool_params
        params.require(:tool).permit(:brand, :name, projects_tools_attributes: [:favorite])
    end


end
