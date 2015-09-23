module ErbSpec
  RSpec::Matchers.define :include_template do |template|
    match do |actual|
      expect(actual).to have_content "ERB:#{template}"
    end
  end
end
