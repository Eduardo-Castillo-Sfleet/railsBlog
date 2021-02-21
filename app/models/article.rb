class Article < ApplicationRecord
    include AASM

    belongs_to :user
    has_many :comments
    validates :title, presence: true, uniqueness: true
    validates :body, presence: true, length: { minimum: 20 }
    #before_create :set_vistis_count
    before_save :set_visits_count

    def update_visits_count
        self.save if self.visits_count.nil?
        self.update(visits_count: self.visits_count + 1)
    end

    scope :publicados, ->{ where(state: "published") }

    scope :ultimos, ->{ order("created_at DESC") }

    aasm column: "state" do
        state :draft, initial: true
        state :published

        event :publish do
            transitions from: :draft, to: :published
        end

        event :unpublish do
            transitions from: :published, to: :draft
        end
    end

    private

    def set_visits_count
        self.visits_count ||= 0
    end
end
