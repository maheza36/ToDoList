class TaskNotebook < ApplicationRecord
  belongs_to :homework, class_name: "Homework", foreign_key: "homework_id"
  belongs_to :notebook, class_name: "Notebook", foreign_key: "notebook_id"
end
