class Todo < ApplicationRecord
  attribute :completed, :boolean, default: 0
  validates :description, presence: true
end
