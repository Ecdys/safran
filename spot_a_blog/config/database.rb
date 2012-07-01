# Database configuration file for Zen.
#
# This configuration file should contain all the required details to make it
# possible for Zen to connect to a SQL database.
#
# Keep in mind that it is recommended to add this file to your VCS' ignore list
# and instead only keep track of a default configuration file (e.g.
# database.default.rb). Doing this means your passwords and usernames don't end
# up being tracked by your VCS.
#
# The following items can be set:
#
# * adapter: the adapter to use. When using MySQL it's best to use the mysql2
#   gem as it's a lot faster than the mysql gem.
# * host: the hostname where the database is located.
# * username: the username to use for connecting to the database.
# * password: the password to use for connecting to the database.
# * database: the name of the database to use.
# * test: whether or not the connection should be verified.
# * encoding: the encoding type to use.
# * logger: the logger used for logging queries and such.
#
# Fore more information see the Sequel documentation:
# http://sequel.rubyforge.org/rdoc/files/doc/opening_databases_rdoc.html
#
Zen.database = Sequel.connect(
  :adapter  => 'mysql2',
  :username => 'root',
  :password => '',
  :database => 'blog',
  :test     => true,
  :encoding => 'utf8'
)

# When running MySQL the engine should be set to InnoDB in order for foreign
# keys to work properly.
if Zen.database.adapter_scheme.to_s.include?('mysql')
  Sequel::MySQL.default_engine = 'InnoDB'
end
