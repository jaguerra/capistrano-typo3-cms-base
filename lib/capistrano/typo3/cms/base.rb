require "capistrano/typo3/cms/base/version"
require "capistrano/typo3/cms/base/typo3console"
#require "capistrano/typo3/cms/base/deploy"
require "capistrano/typo3/cms/base/install_tool"
require "capistrano/typo3/cms/base/configuration"
require "capistrano/typo3/cms/base/typo3core"
require "securerandom"
require "digest"

namespace :load do
  task :defaults do
    load 'capistrano/typo3/cms/base/defaults.rb'
  end
end

module Capistrano
  module Typo3
    module Cms
      module Base

        def self.basedir_prepend(path)
          if fetch(:typo3_cms_basedir) then
            File.join( fetch(:typo3_cms_basedir), path)
          else
            path
          end
        end

        def self.basedir_append(path)
          if fetch(:typo3_cms_basedir) then
            File.join( path, fetch(:typo3_cms_basedir))
          else
            path
          end
        end

      end
    end
  end
end
