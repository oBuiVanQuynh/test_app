class Country < ActiveRecord::Base
  validates :name, length: {maximum: 50}, presence: true
  validates :description, length: {maximum: 500}, presence: true
  has_attached_file :flag, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :flag, :content_type => /\Aimage\/.*\Z/

  has_many :cities, dependent: :destroy
end
