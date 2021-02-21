require 'stringio'

# this module is basically a graveyard for all the broken methods of trying to redefine puts/print/printf, then have it set back to 
# the way opal defines

# to extend IO or STDOUT/STDERR to have it put output on the page
module MyIO
    def puts(str)
        
        `console.log('foo ' + #{str})`
    end
  
    def printf(format,*args)
       
        `console.log('foo ' + #{str})`
    end
end
module MyIO2
   def write_proc(s)
     `document.getElementById('code_output').innerHTML= document.getElementById('code_output').innerHTML + #{ERB::Util.html_escape str}`
   end
end
def exec_ruby(code)
    puts code
    
    # STDOUT.extend(MyIO)
    STDOUT.write_proc = `function(s){document.getElementById('code_output').innerHTML= document.getElementById('code_output').innerHTML + "<br>" + s; console.log('foo ' + s) }`
    begin
      res = eval(code)
      
      # Element['#code_output'].innerHTML= Element['#code_output'].innerHTML + "<br> = &gt;" + ERB::Util.html_escape(res.inspect)
      puts "=> #{res}" 
    rescue Exception => e
       # Element['#code_output'].innerHTML="<font size=\"3\" color=\"red\">" 
       # +  ERB::Util.html_escape(e.message + "<br>" + e.backtrace.join("<br>\n"))
       # + "</font>"
       puts "<font size=\"3\" color=\"red\">" + e.message + "</font>"
    ensure
        STDOUT.write_proc = `function(s){console.log(s)}`
        puts "in ensure"
    end

    puts "normal puts"
end
module ExecRuby 
    # Opal doesn't seem to support refinements
    # refine  IO do 
    def puts(str)
        %x{
          document.getElementById('code_output').innerHTML= document.getElementById('code_output').innerHTML + #{ERB::Util.html_escape str} + "<br>"
          }
      end
    
      def printf(format,*args)
        %x{
          document.getElementById('code_output').innerHTML= document.getElementById('code_output').innerHTML + #{ERB::Util.html_escape sprintf(format,args)}
          }
      end
    # end

    def exec_ruby(code)
        puts code
        begin
          res = eval(code)
          Element['#code_output'].innerHTML= Element['#code_output'].innerHTML + "<br> = &gt;" + ERB::Util.html_escape(res.inspect)
          
        rescue Exception => e
           
        ensure

        end
    end
    
end

__END__


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

 # stuff that wasn't quite working
 #catcher_out = StringIO.new("","w")
    #catcher_err = StringIO.new("","w")
    #puts STDOUT.class 
    #puts catcher_out.class 
    #Kernel.const_set(STDOUT,catcher_out)
    #Kernel.const_set(STDERR,catcher_err)
    
    
    
    # puts STDOUT.class 
    # This doesn't work. It extends stdout globally and doesn't get reset. 
    #$stdout.extend(MyIO)
    #$stderr.extend(MyIO)

    # begin
    catcher_out.close_write
      code_output = catcher_out.string
      puts code_output
      #  Element['#code_output'].innerHTML= Element['#code_output'].innerHTML + ERB::Util.html_escape(code_output) + "<br>"
rescue Exception => e
      # ensure
      Kernel.const_set(STDOUT,temp_stdout)
      Kernel.const_set(STDERR,temp_stderr)






puts code
    
 # Looking at Opal's code for IO, I noticed that it had a write_proc. save it off and reset it 
temp_stdout = STDOUT.write_proc 
# temp_stderr = STDERR.write_proc
catcher_out = StringIO.new("","w")
catcher_out.write("hello ...")
STDOUT.write_proc = catcher_out.method(:write) # Proc.new {|str| catcher_out.write(str)}   
begin
  res = eval(code)
  catcher_out.close_write
  #Element['#code_output'].innerHTML= Element['#code_output'].innerHTML + ERB::Util.html_escape(catcher_out.string) + "<br>"
  #Element['#code_output'].innerHTML= Element['#code_output'].innerHTML + "<br> = &gt;" + ERB::Util.html_escape(res.inspect)
  puts "code out: #{catcher_out.string}"
rescue Exception => e
   # Element['#code_output'].innerHTML="<font size=\"3\" color=\"red\">" 
   # +  ERB::Util.html_escape(e.message + "<br>" + e.backtrace.join("<br>\n"))
   # + "</font>"
   puts "error"
ensure
    STDOUT.write_proc = temp_stdout 
end


# Element['#code_output'].innerHTML = Element['#code_output'].innerHTML + ERB::Util.html_escape(str) + "<br>"
 # Element['#code_output'].innerHTML = Element['#code_output'].innerHTML + ERB::Util.html_escape(sprintf(format,args))