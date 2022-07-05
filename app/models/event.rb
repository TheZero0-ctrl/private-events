class Event < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :event_date, presence: true
    validates :location, presence:true
    has_many :enrollments, dependent: :destroy
    has_many :anttendees, through: :enrollments, source: :user, dependent: :destroy
    belongs_to :host, class_name: "User", foreign_key: :user_id
    scope :past, -> { where('event_date < ?', Date.today) }
    scope :upcoming, -> { where('event_date >= ?', Date.today) }
end
