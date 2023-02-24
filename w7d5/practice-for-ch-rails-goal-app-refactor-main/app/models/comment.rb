# == Schema Information
#
# Table name: comments
#
#  id                 :bigint           not null, primary key
#  body               :string           not null
#  commenterable_type :string           not null
#  commenterable_id   :bigint           not null
#  commentable_type   :string           not null
#  commentable_id     :bigint           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Comment < ApplicationRecord
  belongs_to :commenterable, polymorphic: true
  belongs_to :commentable, polymorphic: true
end
