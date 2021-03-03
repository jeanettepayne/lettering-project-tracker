class ToolsController < ApplicationController

    def popular
        @list = Tool.most_used
    end
    
    def show
        @tool = Tool.find(params[:id])
        # @project = @tool.project
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
        # binding.pry
        # @pt = ProjectsTool.find_by(project_id: params[:project_id])
        @pt = ProjectsTool.find_by(tool_id: @tool.id)
        @pt.project_id = params["tool"]["projects_tools_attributes"]["0"]["project_id"]
        # binding.pry
        @pt.tool_id = @tool.id
        @pt.save
            # create project tools child here
        redirect_to project_path(@pt.project_id) 
    end

    def edit
        @tool = Tool.find(params[:id])
    end

    def update
        @tool = Tool.find(params[:id])
        @tool.update(tool_params)
        redirect_to tool_path(@tool)
    end

    def destroy
        Tool.find(params[:id]).destroy
        project = params[:project_id]
        redirect_to project_path(project)
    end

    private

    def tool_params
        params.require(:tool).permit(:brand, :name, projects_tools_attributes: [:favorite])
    end


end
