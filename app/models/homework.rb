class Homework < ApplicationRecord
  has_many :notebooks, through: :tasknotebooks, class_name: "Notebook"
  has_many :users, through: :taskusers, class_name: "User"
  has_many :tasknotebooks, class_name: "TaskNotebook"
  has_many :taskusers, class_name: "TaskUser"

  accepts_nested_attributes_for :tasknotebooks
  accepts_nested_attributes_for :taskusers

  validates :name, :description, :priority, :taskfull, presence: true

end
