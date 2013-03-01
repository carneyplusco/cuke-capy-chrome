require 'rubygems'
require 'thor'
require 'thor/group'
require 'fileutils'

class CukeIsland < Thor::Group
  include Thor::Actions

  VERSION = "0.0.4"

  argument :dir_name

  def self.source_root
    File.join(File.dirname(__FILE__), '..', 'features')
  end

  def create_new_cucumber_directory
    self.destination_root = File.expand_path(dir_name, destination_root)
    make_empty_directory
    FileUtils.cd(destination_root)
    gemfile_rake
    features_directory_and_files
    inside '.' do
      run 'bundle install'
    end
  end

  protected

  def make_empty_directory
    empty_directory '.'
  end

  def features_directory_and_files
    empty_directory 'features'

    inside 'features' do
      template '../search.feature.off', 'search.feature.sample'
      empty_directory 'support'
      template '../support/env.rb', 'support/env.rb'
      empty_directory 'step_definitions'
      template '../step_definitions/web_steps.rb', 'step_definitions/web_steps.rb'
    end
  end

  def gemfile_rake
    inside destination_root do
      template '../Gemfile', 'Gemfile'
      template '../Rakefile', "Rakefile"
    end
  end

end