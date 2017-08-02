class Show < ActiveRecord::Base

  def self.highest_rating
    Show.maximum('rating')
  end

  def self.most_popular_show
    # Show.all.each do |show|
    #   return show if show.rating == Show.maximum('rating')
    # end
    Show.all.select {|item| item.rating == Show.maximum('rating')}[0]
  end

  def self.lowest_rating
    Show.minimum('rating')
  end

  def self.least_popular_show
    Show.all.each do |show|
      return show if show.rating == Show.minimum('rating')
    end
  end

  def self.ratings_sum
    Show.calculate(:sum, "rating")
  end

  def self.popular_shows
    Show.all.select {|item| item.rating > 5}
  end

  def self.shows_by_alphabetical_order
    Show.all.order(:name)
  end
end
