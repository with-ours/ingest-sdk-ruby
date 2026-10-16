# frozen_string_literal: true

require "yaml"

require_relative "test_helper"

class OursprivacyIngest::Test::DependenciesTest < Minitest::Test
  ROOT = File.expand_path("../..", __dir__)

  # Since Ruby 3.4, bundled gems (e.g. `base64`, `bigdecimal`) are not loadable
  # under Bundler unless a gemspec declares them, so every standard library the
  # package requires must be a default gem or a declared dependency.
  def test_standard_libraries_are_default_gems_or_declared
    begin
      require("bundled_gems")
    rescue LoadError
      skip("bundled gem metadata requires Ruby 3.3+")
    end

    manifest = YAML.safe_load_file(File.join(ROOT, "manifest.yaml"))
    gemspec = Gem::Specification.load(File.join(ROOT, "oursprivacy_ingest.gemspec"))
    libraries = manifest.fetch("dependencies").map { _1.split("/").first }
    declared = gemspec.runtime_dependencies.map(&:name)

    assert_empty(libraries & (Gem::BUNDLED_GEMS::SINCE.keys - declared))
  end
end
