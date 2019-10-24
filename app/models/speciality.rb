class Speciality < ApplicationRecord
  has_many :doc_specialties
  has_many :doctors, through: :doc_specialties
end
