# == Schema Information
#
# Table name: houses
#
#  id         :bigint           not null, primary key
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class House < ActiveRecord::Base
  has_many :residents,
    class_name: 'Person',
    foreign_key: :house_id,
    primary_key: :id
  
    validates :address, presence: true
    validates :address, uniqueness: true
end
