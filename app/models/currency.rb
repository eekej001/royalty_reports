class Currency < ActiveRecord::Base
  has_many :payess
  has_many :payout_batches

  validates :code, presence: true, uniqueness: { case_sensitive: false }

  def to_s
    self.code.upcase
  end
end
