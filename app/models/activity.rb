class Activity < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:name]
  belongs_to :injury
  before_create :capitalize_name


  validates :name, presence: true, length: {minimum: 3}
  private
  def capitalize_name
    self.name = name.capitalize
  end

  def self.sorted_injuries(activity)
    self.where(name: activity).group_by{|a| a.injury}.sort{|x,y| x.size <=> y.size}.map{|x| x[0]}
  end
end
