class Order < ActiveRecord::Base

#State Machine#####################
include ActiveModel::Transitions
state_machine do
  state :new
  state :paid
  state :completed

  event :pay, timestamp: :paid_for_on do
    transitions :from => :new, :to => :paid
  end

  event :complete, timestamp: :completed_on do
    transitions :from => :paid, :to => :completed
  end
end

#associations################################
  belongs_to :frame
  has_one :brand, through: :frame

#validates###################################
  validates :customer_name, :customer_email, :description, :price, :frame_id, presence: true
  validate :completion_date_must_be_in_the_past
  validates :price, :numericality => {:only_integer => true}

#scopes######################################
  scope :unfinished, -> { where(completed_on: nil) }

#methods#####################################
  def self.paid
    where.not(paid_for_on: nil)
  end

  def self.unpaid
    where(paid_for_on: nil)
  end


  private

  def completion_date_must_be_in_the_past
    errors.add(:completed_on, 'should not be in the future.') if completed_on && completed_on > Time.now
  end

  def brand_id
    brand ? brand.id : nil
  end

end
