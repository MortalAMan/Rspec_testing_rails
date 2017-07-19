class Classroom < ApplicationRecord
  validates_presence_of :name, :teacher
end
