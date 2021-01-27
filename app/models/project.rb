class Project < ApplicationRecord
    belongs_to :user
    has_many :project_tools
    has_many :tools, through: :project_tools

    accepts_nested_attributes_for :tools
end
