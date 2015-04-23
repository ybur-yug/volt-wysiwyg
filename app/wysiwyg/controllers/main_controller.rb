module Wysiwyg
  class MainController < Volt::ModelController
    attr_reader :quill, :text
    def initialize(attributes)
      @text = attributes.locals[:text]
    end

    def index_ready
      puts 'index_ready'
      `var quill = new Quill('.quill-editor');`
      @quill = `quill`
      `quill.addModule('toolbar', { container: '.quill-toolbar' });`
      if `#{quill}.getText()`.blank?
        puts 'its empty'
        `#{quill}.insertText(0, #{text})`
      end
    end

  end
end
