class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence:true,
						length: {minimum:5}
#	validates :text,		presence: false,
#						length {maximum:20}
#	Post.create # => false
#	Post.create! # => ActiveRecord::RecordInvalid: Validation Failed: Title to short
end
