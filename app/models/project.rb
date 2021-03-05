class Project < ApplicationRecord
    belongs_to :user
    has_many :projects_tools
    has_many :tools, through: :projects_tools
    has_one_attached :photo

    scope :digital, -> {where(style: 'Digital')}
    scope :traditional, -> {where(style: 'Traditional')}

    validates :title, length: {minimum: 2}
    validates :quote, presence: true

    accepts_nested_attributes_for :projects_tools

    # def tool_attributes=(tool)
    #     self.tool = Tool.find_or_create_by(name: tool[:name], brand: tool[:brand])
    #     self.tool.update(tool)
    # end

end
