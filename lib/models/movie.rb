class Movie < ActiveRecord::Base
  has_many :reviews
  has_many :movie_categories
  has_many :categories, through: :movie_categories

  def self.average_rating
    joins(:reviews).average(:rating).to_f
  end

  def average_rating_eighties_movies
    self.eighties.average_rating
  end

  def self.eighties
    # self.where('release_year BETWEEN 1980 AND 1989')
    self.where({release_year: (1980..1989)})
  end

  # NOT PREFERRED
  # def self.slow_eighties
  #   Movie.all.select {|movie| movie.release_year.to_i <= 1989 && movie.release_year.to_i >= 1980}
  # end

  def self.highest_rated
    joins(:reviews).group('movies.id').order('AVG(reviews.rating) DESC').first
  end

  def self.lowest_rated

  end

  def self.most_reviewed

  end

  def average_rating
    self.reviews.average(:rating).to_f
  end

  def number_of_reviews
    reviews.count
  end

  # NOT PREFERRED 
  # def average_rating
  #   total_points = self.reviews.inject(0.0) do |total_points, review|
  #     total_points + review.rating
  #   end
  #   total_points / self.reviews.length
  #   # "SELECT AVG(reviews.rating) FROM reviews WHERE reviews.movie_id = ? GROUP BY reviews.movie_id"
  # end

end
