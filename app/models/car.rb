# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates_presence_of :description
  validates_presence_of :user_id
  validates :description, length: { maximum: 140 }
end
