require 'spec_helper'
require 'erb_spec/erb_stub'

describe ErbSpec do
  context 'pure HTML template' do
    let(:erb_stub) { ErbSpec::ErbStub.new('views/pure_html.erb') }

    it 'should load a HTML template' do
      result = erb_stub.render
      expect(result).to have_content('Expected div contents')
    end
  end

  context 'ERB template' do
    let(:erb_stub) { ErbSpec::ErbStub.new('views/erb_template.erb') }
    it 'should render template name into template' do
      result = erb_stub.render
      expect(result).to have_content('A div with a child template in it.')
      expect(result).to have_content('ERB:pure_html')
    end

    it 'should render child templates with render partials on' do
      erb_stub.render_with_partials
      result = erb_stub.render true
      expect(result).to have_content('A div with a child template in it.')
      expect(result).to have_content('Expected div contents')
    end
  end
end
