class Tool < ApplicationRecord
    has_many :projects_tools
    has_many :projects, through: :projects_tools

    validates :name, uniqueness: true
   
    accepts_nested_attributes_for :projects_tools

    def most_used
        Tool.all.map do |tool|
            pt_count = tool.projects_tools.size
        end
        
        pt_count.sort_by {|pt| -pt.size}

        Tool.all.group_by(&:itself).max_by(&:size).first
    

    end

end
