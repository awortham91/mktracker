class Pool < ActiveRecord::Base
  validates :passcode, presence: true, length: { in: 6..20 }
  has_many :users
end
