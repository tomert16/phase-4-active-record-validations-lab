class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: ["Fiction", "Non-Fiction"]

    validate :is_clickbaity

    def is_clickbaity
        if !(title.include? "Won't Believe")
            errors.add(:title, "Clickbait-y material")
        end
    end


end
