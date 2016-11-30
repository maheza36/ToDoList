class Notebook < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "user_id"

  has_many :tasknotebooks, class_name: "TaskNotebook"

end
