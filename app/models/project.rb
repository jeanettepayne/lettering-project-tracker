class Project < ApplicationRecord
    belongs_to :user
    has_many :projects_tools
    has_many :tools, through: :projects_tools
    has_one_attached :photo

    accepts_nested_attributes_for :projects_tools

    # def tool_attributes=(tool)
    #     self.tool = Tool.find_or_create_by(name: tool[:name], brand: tool[:brand])
    #     self.tool.update(tool)
    # end

end
