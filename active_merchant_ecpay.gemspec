# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_merchant_ecpay/version'

Gem::Specification.new do |spec|
  spec.name          = "active_merchant_ecpay"
  spec.version       = ActiveMerchantEcpay::VERSION
  spec.authors       = ["sdlong"]
  spec.email         = ["sdlong.jeng@gmail.com"]

  spec.summary       = %q{A rails plugin to add active_merchant patch for Taiwan payment.}
  spec.description   = %q{A rails plugin to add active_merchant patch for Taiwan payment.}
  spec.homepage      = "https://github.com/superlanding/active_merchant_ecpay"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activemerchant'
  spec.add_dependency 'offsite_payments'

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency('mocha', '~> 0.13.0')
  spec.add_development_dependency('rails', '>= 2.3.14')
  spec.add_development_dependency('pry')
  spec.add_development_dependency('thor')
end
