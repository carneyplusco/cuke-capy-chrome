require 'thor'
require 'thor/group'
require 'fileutils'

class CukeIsland < Thor::Group
  include Thor::Actions

  VERSION = "0.0.1"

  argument :dir_name

  def self.source_root
    File.join(File.dirname(__FILE__), '..', 'features')
  end

  def create_new_cucumber_directory
    self.destination_root = File.expand_path(dir_name, destination_root)
    make_empty_directory
    FileUtils.cd(destination_root)
    gemfile_rakefile_cukeyml
    features_directory_and_files
  end

  protected

  def make_empty_directory
    empty_directory '.'
  end

  def features_directory_and_files
    empty_directory 'features'

    inside 'features' do
      template 'search.feature.off', 'search.feature'
      empty_directory 'support'
      template 'support/env.rb', 'support/env.rb'
      empty_directory 'step_definitions'
      template 'step_definitions/web_steps.rb'
    end
  end

  def gemfile_rake
    inside destination_root do
      template 'Gemfile'
      template 'Rakefile'
    end
  end

end