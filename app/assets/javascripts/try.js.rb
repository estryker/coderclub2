require 'erb'
require 'opal'
require 'opal-parser'
require 'browser'
require 'help_code'

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


def ruby_help
    help_dialog = Element["#help-form"].dialog(
        autoOpen: false,
        height: 600,
        width: 1200,
        modal: true,
        buttons: {
          Cancel: %x{ function() {
            help_dialog.dialog( "close" );
          }
        }
      }); 

      help_content = Element["#helpContent"]
      
      puts Document.class 
      puts Document.methods
          
      puts Browser::DOM::Document.class 
      puts Browser::DOM::Document.methods
      doc = Browser::DOM::Document.new
        puts doc.class 
        puts doc.methods 
      help_div = doc.create_element('<div>')
      
      help_div.innerHTML = %Q{
        <h3> Getting Started </h3>
        See the examples in the other tabs to get you started with some Ruby basics. In the tabs, you can see some examples of Ruby code, and then inject the code into your editor on the left.  
       <p>
         When you are ready to run the code, just click the  <input name="commit" class="btn btn-primary" type="button" value="Run! " /> button to see the output.  The output after the '=>' line is the value of the last expression that was executed. 
       </p>
         If you want to save your code, click the <input name="commit" class="btn btn-secondary" type="button" value="Create URL " /> button, which will give you a URL that you can save off in a file, or send to a friend to see your amazing code!
   
         <h3> More advanced Ruby </h3>
         Once you get through the examples and you want to learn more, try using some of the 'Ruby links' in the links tab at the top of the page. 
      }
      # puts help_div 
      help_content.append_child(help_div)
      
      
      help_dialog.dialog("open")
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

__END__
help_div.innerHTML = %Q{
      <h3> Getting Started </h3>
      See the examples in the other tabs to get you started with some Ruby basics. In the tabs, you can see some examples of Ruby code, and then inject the code into your editor on the left.  
     <p>
       When you are ready to run the code, just click the  <input name="commit" class="btn btn-primary" type="button" value="Run! " /> button to see the output.  The output after the '=>' line is the value of the last expression that was executed. 
     </p>
       If you want to save your code, click the <input name="commit" class="btn btn-secondary" type="button" value="Create URL " /> button, which will give you a URL that you can save off in a file, or send to a friend to see your amazing code!
 
       <h3> More advanced Ruby </h3>
       Once you get through the examples and you want to learn more, try using some of the 'Ruby links' in the links tab at the top of the page. 
    }
    help_content.append_child(help_div)
      
    help_button = Element['#rubyHelp']
    help_button.on :click do 
      ruby_help
    end
  