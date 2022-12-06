class Post < ApplicationRecord
    attr_accessor :token_key

    def self.token
      self.token_key = 12345 
    end
end