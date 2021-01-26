class Tool < ApplicationRecord
    has_many :project_tool
    has_many :projects, through: :project_tools
end
