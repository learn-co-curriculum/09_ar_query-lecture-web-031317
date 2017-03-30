class Category < ActiveRecord::Base
  has_many :movie_categories
  has_many :movies, through: :movie_categories

  def self.highest_rated
    self.joins(movie_categories: {movie: [:reviews]})
        .group('categories.id')
    	.order('AVG(reviews.rating) DESC')
    	.first
  end

  def average_rating
     movies.joins(:reviews).average('reviews.rating').to_f 
  end
end
