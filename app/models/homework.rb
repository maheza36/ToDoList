class Homework < ApplicationRecord
  has_many :notebooks, through: :tasknotebooks, class_name: "Notebook"
  has_many :tasknotebooks, class_name: "TaskNotebook"
  has_many :taskusers, class_name: "TaskUser"

  accepts_nested_attributes_for :tasknotebooks

end
