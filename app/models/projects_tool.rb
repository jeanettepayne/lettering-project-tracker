class ProjectsTool < ApplicationRecord
    belongs_to :project, optional: true
    belongs_to :tool, optional: true


    def favorite!
        self.favorite = true
        self.save!
    end

    def unfavorite!
        self.favorite = false
        self.save!
    end
end
