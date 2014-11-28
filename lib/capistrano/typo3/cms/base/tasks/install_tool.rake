namespace :typo3cms do

  desc 'Enable install tool'
  task :enable_install_tool do
    on roles(:app) do
      execute :touch, release_path.join(Capistrano::Typo3::Cms::Base.basedir_prepend 'typo3conf/ENABLE_INSTALL_TOOL')
    end
  end

  desc 'Disable install tool'
  task :disable_install_tool do
    on roles(:app) do
      execute :rm, release_path.join(Capistrano::Typo3::Cms::Base.basedir_prepend 'typo3conf/ENABLE_INSTALL_TOOL')
    end
  end

end
