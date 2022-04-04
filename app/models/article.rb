class Article < ApplicationRecord

    validates :title, presence: true; #makes it so that the presence of a title is always required to create a new database entry

end