class User < ApplicationRecord
    validates :username, 
                presence: true, 
                uniqueness: {case_sensitive: false}, #uniquieness: makes it so that there cannot be duplicate values for these attributes in the DB
                length: {minimum: 3, maximum: 25}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i  #REGular EXpression constant to validate email format. Can be tested at rubular.com
    validates :email, 
                presence: true, 
                uniqueness: {case_sensitive: false}, 
                length: {maximum: 105}, 
                format: {with: VALID_EMAIL_REGEX}

    before_save { self.email = email.downcase } #before saving to database, downcase the email of the object we just created(with self.)

    has_many :articles #creates one-to-many 'many' side of association with Article
end
