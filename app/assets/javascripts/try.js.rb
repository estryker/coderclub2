require 'erb'
require 'opal-parser'
require 'patched_io'
# Console.log and puts do the same thing
$console.log "hello opal!"

puts "hello world!"

  
# emulate this from view: onclick="Opal.Opal.$ruby_exec(myCodeMirror.getValue()); eraseFlash()
# https://opalrb.com/docs/guides/v1.0.3/compiled_ruby.html
def exec_ruby(code)
    puts code
    # we are scoping our extensions to IO just to this function
    STDOUT.extend(MyIO)
    STDERR.extend(MyIO)
    
    begin
      res = eval(code)
      Element['#code_output'].innerHTML= Element['#code_output'].innerHTML + "<br> = &gt;" + ERB::Util.html_escape(res.inspect)
      
    rescue Exception => e
    end
end

# Note that we must make sure the Document is loaded before we try to find our button
Document.ready? do 
  e2 = Element['#commitRubyCode']
  puts e2.inspect
  e2.on :click do
    # alert "codewindow was clicked!"
    exec_ruby(`myCodeMirror.getValue()`)
  end
end

__END__
puts "hi"
def exec_ruby(code)
    begin
      # $catcher = StringIO.new("",'w') # FakeStdout.new('code_output') # StringIO.new
      # $stdout = $catcher
      res = code # eval(code)
      code_inspect = res.inspect
      puts code_inspect
      Element['#code_output'].innerHTML= "</br> " + ERB::Util.html_escape code_inspect     
    rescue Exception => e
      code_error = e.message + "\n" + e.backtrace.join("\n")
      Element['#code_output'].innerHTML= "<font size=\"3\" color=\"red\"> " +  ERB::Util.html_escape code_error + "</font>"
    end
end
