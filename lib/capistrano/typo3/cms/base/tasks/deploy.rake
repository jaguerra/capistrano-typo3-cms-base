namespace :deploy do

  desc 'Clear caches'
  after :published, :clear_cache do
    invoke "typo3cms:typo3console:clear_cache"
  end

  desc 'Compare and update DB schema'
  after :symlink_typo3core, :update_db_schema do
    invoke "typo3cms:typo3console:update_db_schema"
  end

end
