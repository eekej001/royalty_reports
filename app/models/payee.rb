class Payee < ActiveRecord::Base
  has_many :payout_items
  has_many :payout_batches, through: :payout_items

  belongs_to :currency

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :balance, presence: true,
    numericality: { greater_than_or_equal_to: 0 }

  validates :currency, presence: true

  def email_currency
    "#{self.email}_#{self.currency}"
  end
end
