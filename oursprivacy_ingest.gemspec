# frozen_string_literal: true

require_relative "lib/oursprivacy_ingest/version"

Gem::Specification.new do |s|
  s.name = "oursprivacy-ingest"
  s.version = OursprivacyIngest::VERSION
  s.summary = "Ruby library to access the Ours Privacy API"
  s.authors = ["Ours Privacy"]
  s.email = "support@oursprivacy.com"
  s.homepage = "https://gemdocs.org/gems/oursprivacy-ingest"
  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/with-ours/ingest-sdk-ruby"
  s.metadata["rubygems_mfa_required"] = false.to_s
  s.required_ruby_version = ">= 3.2.0"

  s.files = Dir[
    "lib/**/*.rb",
    "rbi/**/*.rbi",
    "sig/**/*.rbs",
    "manifest.yaml",
    "SECURITY.md",
    "CHANGELOG.md",
    ".ignore"
  ]
  s.extra_rdoc_files = ["README.md"]
  s.add_dependency "connection_pool"
end
