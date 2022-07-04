class Event < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :event_date, presence: true
    validates :location, presence:true
    has_many :enrollments
    has_many :anttendees, through: :enrollments, source: :user
    belongs_to :host, class_name: "User", foreign_key: :user_id
end
