# Main configuration file for your project. This file should contain settings
# such as the path to the root directory, the mode to use for Ramaze (dev, live,
# etc) and various cache related settings.
#
# Because this file is loaded using require() like any other file you're free to
# add statements and custom code in this configuration file.

# The root directory of your application. This directory will be used for
# various settings by Zen and is therefor required.
Zen.root = __DIR__('../')

# The application mode to use. Based on different modes your application might
# behave differently. For example, when set to :dev assets will not be minified.
Ramaze.options.mode  = :dev

# The name of your application. Its very important that this name is unique,
# especially when a cache is shared among different Ramaze applications. If
# these applications were to use the same name they might end up retrieving the
# wrong data.
Ramaze.options.app.name = :spot_a_blog

# The session identifier to use for cookies.
Ramaze.options.session.key = 'spot_a_blog.sid'

# Whether or not views should be cached after they've been read or pre-compiled.
# It is recommended to turn this off when developing your application. By
# default these settings are automatically set based on the mode specified in
# Ramaze.options.mode.
Ramaze::View.options.cache      = Ramaze.options.mode == :live
Ramaze::View.options.read_cache = Ramaze.options.mode == :live

# The cache driver to use for sessions. If you're running your application using
# multiple processes (e.g. 3 Unicorn workers) you should use an external cache
# such as Ramaze::Cache::MemCache. Not doing this will result in synchronization
# problems between these processes.
Ramaze::Cache.options.session  = Ramaze::Cache::LRU

# The cache driver to use for storing settings. Similar to
# Ramaze::Cache.options.session you should use an external cache in case you're
# running a multi-process based setup.
Ramaze::Cache.options.settings = Ramaze::Cache::LRU

# The cache driver to use for storing translations. If no value is specified in
# your application Ramaze::Cache::LRU is used.
#
# For this setting it is highly recommended to use an external cache such as
# Redis or Memcached as it can greatly reduce the amount of used memory.
Ramaze::Cache.options.translations = Ramaze::Cache::LRU
