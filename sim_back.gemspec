# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: sim_back 0.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "sim_back"
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Mike Harris"]
  s.date = "2014-04-17"
  s.description = "sim_back"
  s.email = "mharris717@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "Guardfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "config.ru",
    "config/mongoid.yml",
    "lib/sim_back.rb",
    "lib/sim_back/consolidate_worker.rb",
    "lib/sim_back/queue.rb",
    "lib/sim_back/sim.rb",
    "lib/sim_back/sim_progress.rb",
    "lib/sim_back/sims.rb",
    "lib/sim_back/summary_worker.rb",
    "lib/sim_back/util.rb",
    "lib/sim_back/web/views/index.haml",
    "lib/sim_back/web/web.rb",
    "lib/sim_back/worker.rb",
    "sim_back.gemspec",
    "spec/sim_back_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/fake_runner.rb",
    "spec/support/mongo_connect.rb",
    "spec/support/sidekiq_setup.rb",
    "spec/support_ext/basic_imp.rb",
    "spec/support_ext/setup_sidekiq.rb",
    "spec/support_ext/summary_worker_reschedule.rb",
    "tmp/.gitkeep",
    "vol/fork_test.rb"
  ]
  s.homepage = "http://github.com/mharris717/sim_back"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "sim_back"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mharris_ext>, [">= 0"])
      s.add_runtime_dependency(%q<andand>, [">= 0"])
      s.add_runtime_dependency(%q<sidekiq>, ["= 2.17.1"])
      s.add_runtime_dependency(%q<sinatra>, [">= 0"])
      s.add_runtime_dependency(%q<slim>, [">= 0"])
      s.add_runtime_dependency(%q<haml>, [">= 0"])
      s.add_runtime_dependency(%q<tilt>, ["~> 1.4.1"])
      s.add_runtime_dependency(%q<mongoid_gem_config>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_development_dependency(%q<guard>, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>, [">= 0"])
      s.add_development_dependency(%q<guard-spork>, [">= 0"])
      s.add_development_dependency(%q<rb-fsevent>, ["~> 0.9"])
      s.add_development_dependency(%q<lre>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<mharris_ext>, [">= 0"])
      s.add_dependency(%q<andand>, [">= 0"])
      s.add_dependency(%q<sidekiq>, ["= 2.17.1"])
      s.add_dependency(%q<sinatra>, [">= 0"])
      s.add_dependency(%q<slim>, [">= 0"])
      s.add_dependency(%q<haml>, [">= 0"])
      s.add_dependency(%q<tilt>, ["~> 1.4.1"])
      s.add_dependency(%q<mongoid_gem_config>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_dependency(%q<guard>, [">= 0"])
      s.add_dependency(%q<guard-rspec>, [">= 0"])
      s.add_dependency(%q<guard-spork>, [">= 0"])
      s.add_dependency(%q<rb-fsevent>, ["~> 0.9"])
      s.add_dependency(%q<lre>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<mharris_ext>, [">= 0"])
    s.add_dependency(%q<andand>, [">= 0"])
    s.add_dependency(%q<sidekiq>, ["= 2.17.1"])
    s.add_dependency(%q<sinatra>, [">= 0"])
    s.add_dependency(%q<slim>, [">= 0"])
    s.add_dependency(%q<haml>, [">= 0"])
    s.add_dependency(%q<tilt>, ["~> 1.4.1"])
    s.add_dependency(%q<mongoid_gem_config>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.8.0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
    s.add_dependency(%q<guard>, [">= 0"])
    s.add_dependency(%q<guard-rspec>, [">= 0"])
    s.add_dependency(%q<guard-spork>, [">= 0"])
    s.add_dependency(%q<rb-fsevent>, ["~> 0.9"])
    s.add_dependency(%q<lre>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end

