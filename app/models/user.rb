class User < ActiveRecord::Base
  validates :name, presence: true, length: { in: 1..50 }
  belongs_to :pool
end
