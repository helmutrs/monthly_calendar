# frozen_string_literal: true
require_relative "lib/monthly_calendar/version"

Gem::Specification.new do |spec|
  spec.name          = "monthly_calendar"
  spec.version       = MonthlyCalendar::VERSION
  spec.authors       = ["Helmut Reiterer"]
  spec.email         = ["hreiterer@rrevenuerecovery.net"]

  spec.summary       = %q{A simple monthly calendar generator with space for notes}
  spec.homepage      = "http://github.com/helmutrs/monthly_calendar"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.files          = Dir['lib/**/**'] + %w(LICENSE.txt README.md)
  spec.extra_rdoc_files = ['README.md', 'CHANGELOG.md', 'CODE_OF_CONDUCT.md']

  # spec.bindir        = "exe"
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.7"
  spec.add_development_dependency "rake", "~> 13.3"
  spec.add_development_dependency "minitest", "~> 5.26"
  spec.add_dependency "prawn", "~> 2.5"
end
