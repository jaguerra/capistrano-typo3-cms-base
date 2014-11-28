namespace :typo3cms do

  task :symlink_core do
    if fetch(:typo3_cms_symlink_core, false)
      on release_roles :all do
        unless test("[ -e #{fetch(:typo3_cms_symlink_core)} ]")
          error ":typo3cms_symlink_core does not exist or it is not readable on host #{host}. Aborting..."
          exit 1
        end
        within Capistrano::Typo3::Cms::Base.basedir_append(release_path) do
          execute :rm, '-Rf', 'typo3_src'
          execute :ln, '-s', fetch(:typo3_cms_symlink_core), 'typo3_src'
        end
      end
    end
  end

end

namespace :deploy do

  after :updated, :symlink_typo3core do
    invoke "typo3cms:symlink_core"
  end

end
