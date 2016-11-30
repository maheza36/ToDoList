class Homework < ApplicationRecord
  has_many :tasknotebooks, class_name: "TaskNotebook"
  has_many :taskusers, class_name: "TaskUser"
end
