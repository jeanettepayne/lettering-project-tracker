class Project < ApplicationRecord
    belongs_to :user
    has_many :project_tools
    has_many :tools, through: :project_tools
end
