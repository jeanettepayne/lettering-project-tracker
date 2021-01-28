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
        @tool = Tool.create(project_params)
    end

    private

    def tool_params
        params.require(:tool).permit(:brand, :name)
    end

end
