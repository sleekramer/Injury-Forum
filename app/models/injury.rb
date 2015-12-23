class Injury < ActiveRecord::Base
  belongs_to :user
  belongs_to :body_part
  has_many :injury_symptoms, dependent: :destroy
  has_many :symptoms, through: :injury_symptoms
  has_many :topics, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :favorites, as: :favoriteable

  before_create :injury_capitalize

  validates :name, presence: true, length: {minimum: 10}, uniqueness: true
  validates :description, presence: true, length: {minimum: 30}

  def generate_topics
     ["Description", "Recovery Stories", "Treatment Plans", "Prevention", "Q&A", "Recovery Methods", "Resources"].each do |topic|
      topics.create!(name: topic)
    end
  end
  def top_five_activities_array
    self.activities.group(:name).count.sort{|x,y| x[1] <=> y[1]}.reverse.first(5)
  end

  private
  def injury_capitalize
    self.name = name.split.map {|s| s.capitalize}.join(" ")
  end




end
