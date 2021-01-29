class ToolsController < ApplicationController

    def show
        @tool = Tool.find_by(id: params[:id])
    end

    def index
        @tools = Tool.all
    end

    def new
        @tool = Tool.new
    end

    def create
        @tool = Tool.create(tool_params)
        if @tool.save
            @pt = ProjectTool.new
            @pt.project_id = params[:project_id]
            @pt.tool_id = @tool.id
            @pt.save
            # create project tools child here
            redirect_to projects_path
        else
            render 'new'
        end
    end

    private

    def tool_params
        params.require(:tool).permit(:brand, :name)
    end

end
