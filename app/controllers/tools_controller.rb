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
        if @tool = Project.create(project_params)
            redirect_to tool_path(@tool)
        else
            render 'new'
        end
    end

    private

    def tool_params
        params.require(:tool).permit(:brand, :name)
    end

end
