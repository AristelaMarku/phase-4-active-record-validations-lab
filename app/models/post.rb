class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :title_clickbait
    
    def title_clickbait
       if title && !title.include?("Won't Believe" || "Secret" ||"Guess" ||"Top [number]")
          errors.add(:title, "Not clickbait")
        end
        end
end
