class Project < ApplicationRecord
  has_many :tasks, class_name: 'Task' # required: false,

  validates_presence_of :title
end
