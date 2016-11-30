class TaskUser < ApplicationRecord
  belongs_to :homework, class_name: "Homework", foreign_key: "homework_id"
  belongs_to :user, class_name: "User", foreign_key: "user_id"
end
