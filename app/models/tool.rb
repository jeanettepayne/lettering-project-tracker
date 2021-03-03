class Tool < ApplicationRecord
    has_many :projects_tools
    has_many :projects, through: :projects_tools

    validates :name, uniqueness: true
   
    accepts_nested_attributes_for :projects_tools

    def self.most_used
        # Create array of all ProjectsTools' tools
        tools = ProjectsTool.all.map do |pt|
            pt.tool.name
        end
        # group = tools.group_by{|a| a}.sort_by{|a,b| b.size<=>a.size}.first[0]

        # Create new hash 
        hash = Hash.new(0)
        # Iterate over all tools and push into hash to find out how many times each tool has been used/associated with a ProjectsTool
        tools.each do |tool|
            hash[tool] += 1
        end
        # Sort that hash!
        # frequency = hash.sort_by{|x,y| [y,x]}
        frequency = hash.sort_by{|x,y| y.size<=>x.size}

        list = frequency.collect do |key, value|
            "#{key} - #{value} use(s)"
        end
    end


end
