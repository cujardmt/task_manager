class Task < ApplicationRecord
    belongs_to :category, optional: true
    belongs_to :user, optional: true
    belongs_to :priority
    belongs_to :status
    has_many :subtasks, dependent: :destroy
end
