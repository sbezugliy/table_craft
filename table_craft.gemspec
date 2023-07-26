# frozen_string_literal: true

require_relative "lib/table_craft/version"

Gem::Specification.new do |spec|
  spec.name = "table_craft"
  spec.version = TableCraft::VERSION
  spec.authors = ["Sergey Bezugliy"]
  spec.email = ["s.bezugliy@gmail.com"]

  spec.summary = "Table craft is DSL based tool generating styled with CSS HTML Tables"
  spec.description = "Table craft is DSL based tool generating styled with CSS HTML Tables"
  spec.homepage = "https://github.com/sbezugliy/table_craft"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://github.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/sbezugliy/table_craft"
  spec.metadata["changelog_uri"] = "https://github.com/sbezugliy/table_craft/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    %x(git ls-files -z).split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?("bin/", "test/", "spec/", "features/", ".git", ".circleci", "appveyor", "Gemfile")
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency("rake", "~> 13.0")
  spec.add_dependency("w3c_validators")

  # Uncomment to register a new dependency of your gem
  spec.add_development_dependency("rake", "~> 13.0")
  spec.add_development_dependency("rspec", "~> 3.0")
  spec.add_development_dependency("rubocop")

  spec.add_development_dependency("rubocop-rake")
  spec.add_development_dependency("rubocop-rspec")
  spec.add_development_dependency("rubocop-shopify")

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
