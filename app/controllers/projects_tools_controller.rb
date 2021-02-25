class ProjectsToolsController < ApplicationController

    def new
        # @tool = Tool.find_or_create_by(id: params[:tool_id])
        @pt = ProjectsTool.new
        # @pt.project_id = params[:project_id]
        
        render 'projects_tools/new'
    end

    def create
        @pt = ProjectsTool.create(pt_params)
        # tool = Tool.find_or_create_by(brand: params["projects_tool"]["tool"]["brand"])
        tool = Tool.where(brand: params["projects_tool"]["tool"]["brand"], name: params["projects_tool"]["tool"]["name"]).first_or_create
        # name: params["projects_tool"]["tool"]["name"]
        @pt.tool_id = tool.id
        @pt.update(pt_params)
        
        # @tool = Tool.create(brand: params[:projects_tool][:tool][:brand], name: params[:projects_tool][:tool][:name])
        # binding.pry
        # @pt = ProjectsTool.find_by(params[:projects_tool][:project_id], params[:projects_tool][:tool][:name])
        # @pt.tool_id = @tool.id
        # @pt.save
            # create project tools child here
        redirect_to project_path(@pt.project_id)
    end

    def edit
        @pt = ProjectsTool.find(params[:id])
    end

    def update
        @pt = ProjectsTool.find(params[:id])
        @pt.update(pt_params)
        redirect_to projects_tool_path(@pt)
    end

    def show
        @pt = ProjectsTool.find(params[:id])
    end

    private

    def pt_params
        params.require(:projects_tool).permit(:favorite, :project_id, :tool_id)
    end

    def tool_params
        params.require(:tools).permit(params[:projects_tool][:tools][:brand], params[:projects_tool][:tools][:name])
    end

end
