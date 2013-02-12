module Gutenberg
  # Generates HTML with the given style and book content.
  class Generator
    require 'tilt'

    # Constructs a generator for the given style.
    def initialize(style)
			@view_path = "#{File.dirname(__FILE__)}/styles/#{style}"
      @layout = Tilt.new("#{@view_path}/layout.haml")
    end

    # Produce HTML for the given Gutenberg::Book.
    def render(book)
      template = Tilt.new("#{@view_path}/book.haml")
      @layout.render(book) do
        template.render book
      end
    end
  end
end
