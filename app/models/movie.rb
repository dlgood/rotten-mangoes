class Movie < ActiveRecord::Base

  mount_uploader :image, PosterUploader

  has_many :reviews

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :poster_image_url,
    presence: true

  validates :release_date,
    presence: true

  scope :search_results, -> (search_term) { where("title LIKE ? OR director LIKE ?", "%#{search_term}%", "%#{search_term}%")}

  # def duration_results
  #   if params[:duration].present?
  #     case params[:duration].to_i
  #       when 1
  #         @results = @results.where('runtime_in_minutes < 90')
  #       when 2 
  #         @results = @results.where('runtime_in_minutes < 120 AND runtime_in_minutes >= 90')
  #       when 3
  #         @results = @results.where('runtime_in_minutes > 120')
  #     end
  #   end  
  # end


#  validate :release_date_is_in_the_future

  def review_average   
    if reviews.any?
      reviews.sum(:rating_out_of_ten)/reviews.size
    else
      review_average = "No reviews yet."
    end
  end


  protected

  # def release_date_is_in_the_future
  #   if release_date.present?
  #     errors.add(:release_date, "should probably be in the future") if release_date < Date.today
  #   end
  # end

end