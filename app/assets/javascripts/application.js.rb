# Require the opal runtime and core library
require 'opal'
require 'opal-jquery'

require 'jquery'
require 'jquery-ui'

# For Rails 5.1 and above, otherwise use 'opal_ujs'
require 'opal_ujs'

# Require of JS libraries will be forwarded to sprockets as is
require 'turbolinks'

require 'console'

require 'try'

# a Ruby equivalent of the require_tree Sprockets directive is available
require_tree '.'

