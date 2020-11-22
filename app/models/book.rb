class Book < ApplicationRecord
    validates :title, presence: true
    enum state: %i[prestado no_prestado]
end
