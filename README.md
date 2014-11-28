# Capistrano::Typo3::Cms::Base

Deploy TYPO3 CMS projects with Capistrano 3

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-typo3-cms-base'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-typo3-cms-base

## Usage

Require the module in your `Capfile`:

```ruby
require 'capistrano/typo3/cms/base'

# Uncomment the following line if you have installed EXT:typo3-console and EXT:coreapi into TYPO3
# and you want to activate automatic cache clearing and DB schema update on deploy.
#require 'capistrano/typo3/cms/base/deploy'
```


### Configuration

The gem makes the following configuration variables available (shown with defaults)

```ruby
set :typo3_cms_environment, "Production"
set :typo3_cms_basedir, false
set :typo3_cms_roles, :all
set :typo3_cms_configuration_file, -> { Capistrano::Typo3::Cms::Base.basedir_prepend('typo3conf/AdditionalConfiguration.php') }
set :typo3_cms_linked_files, []
set :typo3_cms_linked_dirs, %w{fileadmin uploads typo3conf/l10n}
set :typo3_cms_symlink_core, false
```

## Contributing

1. Fork it ( https://github.com/jaguerra/capistrano-typo3-cms-base/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
