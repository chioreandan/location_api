# frozen_string_literal: true

class User < ApplicationRecord
  # include Devise::JWT::RevocationStrategies::JTIMatcher
  acts_as_token_authenticatable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :locations
end
