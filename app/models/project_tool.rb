class ProjectTool < ApplicationRecord
    belongs_to :project
    belongs_to :tool

    accepts_nested_attributes_for :tools

    def favorite!
        self.favorite = true
        self.save!
    end

    def unfavorite!
        self.favorite = false
        self.save!
    end
end
