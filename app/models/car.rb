# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates_presence_of :description, :make, :year, :model, :image_url
  validates_presence_of :user_id
  validates :description, length: { maximum: 140 }
  has_many :favorites, dependent: :destroy
end
