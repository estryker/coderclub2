require 'erb'
require 'opal'
require 'opal-parser'
require 'turtle_exec'

# require 'patched_io'
# Console.log and puts do the same thing
$console.log "hello opal!"

puts "hello world!"

def exec_turtle(code)
    puts code

    begin
      res = eval(code)
    rescue Exception => e
      Element['#code_output'].innerHTML = "<br> \n<font size=\"3\" color=\"red\">" + e.message + "</font>"
    ensure
        
    end
end

# emulate this from view: onclick="Opal.Opal.$ruby_exec(myCodeMirror.getValue()); eraseFlash()
# https://opalrb.com/docs/guides/v1.0.3/compiled_ruby.html

# Note that we must make sure the Document is loaded before we try to find our button
Document.ready.then do 
  e2 = Element['#runTurtleCode']
  puts e2.inspect
  e2.on :click do
    # alert "codewindow was clicked!"
    exec_turtle(`myCodeMirror.getValue()`)
    # TODO: turn this into an opal javascript function
    `eraseFlash()` 
  end
end
