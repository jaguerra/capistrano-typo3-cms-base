SSHKit.config.command_map.prefix[:typo3cms].unshift('php')

namespace :typo3cms do

  namespace :typo3console do

    desc "Execute a provided typo3console command"
    task :execute, :command_name do |t, args|
      # ask only runs if argument is not provided
      ask(:cmd, "help")
      command = args[:command_name] || fetch(:cmd)

      on release_roles(fetch(:typo3_cms_roles)), in: :sequence do
        within Capistrano::Typo3::Cms::Base.basedir_append(release_path) do
          with typo3_context: fetch(:typo3_cms_environment) do
            execute :typo3cms, command, *args.extras
          end
        end
      end
    end

    desc 'Clear caches'
    task :clear_cache do
      on release_roles(fetch(:typo3_cms_roles)), in: :sequence do
        within Capistrano::Typo3::Cms::Base.basedir_append(release_path) do
          with typo3_context: fetch(:typo3_cms_environment) do
            execute :typo3cms, 'cache:flush'
            execute :typo3cms, 'cache:warmup'
          end
        end
      end
    end

    desc 'Compare and update DB schema'
    task :update_db_schema do
      on release_roles(fetch(:typo3_cms_roles)), in: :sequence do
        within Capistrano::Typo3::Cms::Base.basedir_append(release_path) do
          with typo3_context: fetch(:typo3_cms_environment) do
            execute :typo3cms, 'databaseapi:databasecompare', '2,3,4'
          end
        end
      end
    end

  end

end
