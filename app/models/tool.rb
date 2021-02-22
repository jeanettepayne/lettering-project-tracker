class Tool < ApplicationRecord
    has_many :projects_tools
    has_many :projects, through: :projects_tools
   
    accepts_nested_attributes_for :projects_tools

end
