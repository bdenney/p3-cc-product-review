class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users

    def leave_review(user, star_rating, comment)
        Review.create(user: user, product: self, star_rating: star_rating, comment: comment)
    end

    def print_all_reviews
        reviews.each do |review|
            review.print_review
        end
    end

    def average_rating
        total = reviews.reduce(0) do | running_sum, next_review |
            next_review.star_rating + running_sum
        end
        total / reviews.length
    end

    def favorite_product
    end
end