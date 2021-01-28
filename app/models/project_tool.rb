class ProjectTool < ApplicationRecord
    belongs_to :project
    belongs_to :tool

    def favorite!
        self.favorite = true
        self.save!
    end

    def unfavorite!
        self.favorite = false
        self.save!
    end
end
