require 'erb'
require 'opal'
require 'opal-parser'
# require 'patched_io'
# Console.log and puts do the same thing
$console.log "hello opal!"

puts "hello world!"

def exec_ruby(code)
    puts code

    # I noticed that in Opal, that the IO::Writable module defines printing interms of the write_proc, so resetting that to do what I want here
    # and then reset it back in the ensure block 
    STDOUT.write_proc = `function(s){document.getElementById('code_output').innerHTML= document.getElementById('code_output').innerHTML + "<br>" + s; }`
    begin
      res = eval(code)
      
      # This is still the redefined puts
      puts "=> #{res}" 
    rescue Exception => e
      puts "<font size=\"3\" color=\"red\">" + e.message + "</font>"
    ensure
        STDOUT.write_proc = `function(s){console.log(s)}`
        puts "in ensure"
    end

    puts "normal puts"
end

# emulate this from view: onclick="Opal.Opal.$ruby_exec(myCodeMirror.getValue()); eraseFlash()
# https://opalrb.com/docs/guides/v1.0.3/compiled_ruby.html

# Note that we must make sure the Document is loaded before we try to find our button
Document.ready.then do 
  e2 = Element['#commitRubyCode']
  puts e2.inspect

  e2.on :click do | evt |
    # I don't know why this doesn't work:
    #Element['#code_output'].innerHTML = ""
    `document.getElementById('code_output').innerHTML = ""`
    # alert "codewindow was clicked!"
    exec_ruby(`myCodeMirror.getValue()`)
    # TODO: turn this into an opal javascript function?
    `eraseFlash()` 
  end
end
