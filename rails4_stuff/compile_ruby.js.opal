puts "In execute_ruby" # check the console!
require 'opal'
require 'stringio'
# In the html submit_tag -> :onclick => 'Opal.CodeRunner.$new().$execute_ruby();'
class CodeRunner
 def execute_ruby()
  # Is there a more direct Opal way of doing this?
  contents = `document.getElementById('code').value` 
  puts "contents from form:"
  puts contents

  # TODO: save a history of @code and add buttons to go back and forth

  sout = $stdout # save it off
  code_output = code_inspect = code_error = nil
  begin 
    catcher = StringIO.new
    # js = Opal.compile(contents) # I don't think Opal can compile itself ...
    # res = `js`
    $stdout = catcher
    res = Kernel.eval(contents)
    catcher.close_write
    code_output = catcher.string
    code_inspect = res.inspect
  rescue Exception => e
    code_error = e.message
  ensure
    # Yeah, let's make sure we restore $stdout
    $stdout = sout
  end
  puts "Out: #{code_output}"
  puts "Inspect: #{code_inspect}"
  puts "Error: #{code_error}"
 end
end