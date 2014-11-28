namespace :typo3cms do
  desc "Generate a basic configuration file"
  task :generate_config do
    set :typo3_cms_database_name, ask('Enter the database name:', '')
    set :typo3_cms_database_username, ask('Enter the database username:', '')
    set :typo3_cms_database_password, ask('Enter the database password:', '', echo: false)
    set :typo3_cms_database_host, ask('Enter the database host:', 'localhost')
    set :typo3_cms_database_port, ask('Enter the database port:', '3306')

    set :typo3_cms_install_password, ask('Enter the install tool password:', '', echo: false)

    template = <<-EOF
<?php
$GLOBALS['TYPO3_CONF_VARS']['DB']['database'] = '<%= fetch(:typo3_cms_database_name) %>';
$GLOBALS['TYPO3_CONF_VARS']['DB']['username'] = '<%= fetch(:typo3_cms_database_username) %>';
$GLOBALS['TYPO3_CONF_VARS']['DB']['password'] = '<%= fetch(:typo3_cms_database_password) %>';
$GLOBALS['TYPO3_CONF_VARS']['DB']['host'] = '<%= fetch(:typo3_cms_database_host) %>';
$GLOBALS['TYPO3_CONF_VARS']['BE']['installToolPassword'] = '<%= Digest::MD5.hexdigest(fetch(:typo3_cms_install_password)) %>';
$GLOBALS['TYPO3_CONF_VARS']['SYS']['encryptionKey'] = '<%= SecureRandom.hex 48 %>';
<%= fetch(:typo3_cms_configuration_additional, '') %>
?>
EOF

    config = ERB.new(template)
    io = StringIO.new(config.result(binding))

    on release_roles(fetch(:typo3_cms_roles)) do
      invoke "deploy:check:make_linked_dirs"
      upload! io, File.join(shared_path, fetch(:typo3_cms_configuration_file))
    end
  end
end
