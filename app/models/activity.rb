class Activity < ActiveRecord::Base
  belongs_to :injury
  before_create :capitalize_name
  searchkick
  validates :name, presence: true, length: {minimum: 3}
  private
  def capitalize_name
    self.name = name.capitalize
  end
end
