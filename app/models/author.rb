class Author < ApplicationRecord
    validates :name, presence: true #  is expected to validate that :name cannot be empty/falsy
    validates :email, presence: true, uniqueness: true # is expected to validate that :email is case-sensitively unique
end
