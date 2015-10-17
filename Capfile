# Load DSL and set up stages
require 'capistrano/setup'
set :stages, %w(staging production)
set :default_stage, 'staging'

# Include default deployment tasks
require 'capistrano/deploy'

require 'rvm1/capistrano3'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano3/unicorn'
# require 'capistrano/bundler'
# require 'capistrano/unicorn'
# require 'capistrano/passenger'
# require 'capistrano/chruby'
# require 'capistrano/rbenv'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
Rake::Task[:staging].invoke
