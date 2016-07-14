class Item < ActiveRecord::Base
  belongs_to :list

  validates :body, presence: true
  validates :complete, presence: true
end
