class Article < ApplicationRecord
    validates :title, presence: true, length: {minimum: 6, maximum:100} #makes it so that the presence of a title is always required (with according length) to create a new database entry
    validates :description, presence: true, length: {minimum: 10, maximum:300}

    belongs_to :user  #creates one-to-many 'one' side of association with User. Now articles cannot be created without a user.
end