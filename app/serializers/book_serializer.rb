class BookSerializer < ApplicationSerializer
  include Rails.application.routes.url_helpers
  cache key: 'book/v1', expires_in: 1.day
  # in a single line
  # attributes :id, :title, :language_code, :numpages
  
  # in multi line
  attribute :numpages
  # attribute :language_code


  # giving conditions
  attribute :language_code, if: :is_owner?

  # giving custom name
  attribute :title, key: :book_title


  # relationship defining
  has_many :authors

  attribute :data do
    {
      self: books_path
    }
  end

  # writing methods
  def is_owner?
    object.id == 1
  end
end
