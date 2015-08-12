class Task < ActiveRecord::Base
validates :description, presence: true
validates :hoursworked, presence: true, numericality: { only_float: true }
validates :project_id, presence: true
belongs_to :user
belongs_to :project
end