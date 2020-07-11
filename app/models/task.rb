class Task < ApplicationRecord
    validates :states, presence: true, length: {maximum: 10 }
    validates :content, presenve: true, length: {maximum: 255 }
end
