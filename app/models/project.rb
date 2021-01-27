class Project < ApplicationRecord
    belongs_to :user
    has_many :project_tools
    has_many :tools, through: :project_tools
    has_one_attached :photo

    accepts_nested_attributes_for :tools

end
