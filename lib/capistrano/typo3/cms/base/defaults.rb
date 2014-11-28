set :typo3_cms_environment, fetch(:typo3_cms_environment, "Production")
set :typo3_cms_basedir, fetch(:typo3_cms_basedir, false)
set :typo3_cms_roles, fetch(:typo3_cms_roles, :all)
set :typo3_cms_configuration_file, -> { Capistrano::Typo3::Cms::Base.basedir_prepend('typo3conf/AdditionalConfiguration.php') }
set :typo3_cms_linked_files, []
set :typo3_cms_linked_dirs, %w{fileadmin uploads typo3conf/l10n}
set :typo3_cms_symlink_core, fetch(:typo3_cms_symlink_core, false)

set :linked_files, -> { fetch(:typo3_cms_linked_files, []).push(fetch(:typo3_cms_configuration_file)) }

set :linked_dirs, -> {
  linked_dirs = []
  fetch(:typo3_cms_linked_dirs).each do |dir|
    linked_dirs.push( Capistrano::Typo3::Cms::Base.basedir_prepend dir )
  end
  linked_dirs
}

set :composer_working_dir, -> { Capistrano::Typo3::Cms::Base.basedir_append fetch(:release_path) }
