class ProjectToolsController < ApplicationController

    def new
        @pt = ProjectTool.new
    end

    def create

    end

    private

    def pt_params
        params.require(:project_tool).permit(:favorite, :project_id, tool_id)
    end
end
