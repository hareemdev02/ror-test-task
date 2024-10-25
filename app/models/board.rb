class Board < ApplicationRecord
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :height, :width,  numericality: { greater_than: 0 }
  
	scope :ten_recent_boards, -> { order(created_at: :desc).limit(10) }

	validate :mines_count, on: :create

  private

  def mines_count
    unless num_mines.between?(1, (height * width))
      errors.add(:base, "Number of mines must be between 1 and #{height * width}")
    end
  end
end