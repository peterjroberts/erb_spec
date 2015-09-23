require_relative 'defaulting_stub'

module ErbSpec
  class ErbStub < DefaultingStub
    def initialize(template, print_unstubbed = false)
      super('base', print_unstubbed)
      @template = template
    end

    def erb(template)
      return render_partial(template) if @render_partials

      "ERB:#{template}"
    end

    def render(debug = false)
      Capybara.string render_html(debug)
    end

    def render_html(debug = false)
      html = ERB.new(File.new(@template).read).result(@context ? @context : binding)
      puts "#{@template}:\n#{html}" if debug
      return html
    end

    def render_with_partials
      @render_partials = true
    end

    def context(context)
      @context = context
    end

    private

    def render_partial(template)
      partial = ErbStub.new("views/#{template.to_s}.erb")
      partial.context binding
      partial.render_partials
      partial.render_html
    end
  end
end
