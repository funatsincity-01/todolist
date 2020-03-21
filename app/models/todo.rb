class Todo < ApplicationRecord
validates :memo, presence: true, length: { maximum: 10 }
end
