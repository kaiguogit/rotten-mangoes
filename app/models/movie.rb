class Movie < ActiveRecord::Base

  has_many :reviews

  mount_uploader :image, ImageUploader

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :image,
    presence: true

  validates :release_date,
    presence: true

  validate :release_date_is_in_the_past

  scope :title_or_director_like, ->(keyword) {where('title like :keyword or director like :keyword', :keyword => "%#{keyword}%")}

  scope :duration_less_than_90, ->{where("runtime_in_minutes <= 90")}
  scope :duration_between_90_and_120, ->{where("runtime_in_minutes >= 90 AND runtime_in_minutes <= 120")}
  scope :duration_longer_than_120, ->{where("runtime_in_minutes > 120")}  

  def review_average
   reviews.size == 0 ? 0 : reviews.sum(:rating_out_of_ten)/reviews.size
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end

end