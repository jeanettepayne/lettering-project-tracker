class FavoritesController < ApplicationController

    before_action :set_pt, only: [:create, :destroy]
  
    def create
      @pt.favorite!
    #   redirect_to tasks_url
    end
  
    def destroy
      @pt.unfavorite!
    #   redirect_to tasks_url
    end
  
    private
  
    def set_pt
      @pt = ProjectTool.find(params[:id])
    end
  
  end