# Require the opal runtime and core library
require 'opal'
require 'opal-jquery'

require 'jquery'
require 'jquery-ui'

# For Rails 5.1 and above, otherwise use 'opal_ujs'
# deprecated: require 'opal_ujs'

# Require of JS libraries will be forwarded to sprockets as is
# page loading is behaving oddly, so I'm turning off turbolinks. 
# if navigating directly to a page, the Opal eval works, if clicking a link on the navbar, it doesnt
# require 'turbolinks'

require 'console'

require 'try'

# a Ruby equivalent of the require_tree Sprockets directive is available
require_tree '.'

