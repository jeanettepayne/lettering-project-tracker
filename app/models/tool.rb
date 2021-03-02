class Tool < ApplicationRecord
    has_many :projects_tools
    has_many :projects, through: :projects_tools

    # validates :brand, uniqueness: true
    # validates :name, uniqueness: true
   
    accepts_nested_attributes_for :projects_tools

end
