class Genre < ApplicationRecord

	validates :name, presence: true, uniqueness: true

	# These two are related
	has_many :characterizations, dependent: :destroy
	has_many :movies, through: :characterizations

end
