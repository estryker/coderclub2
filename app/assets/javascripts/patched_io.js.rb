# monkey patch IO to have it take input/output on the web 
module MyIO
    puts "hi from IO"
    def puts(str)
      %x{
          console.log("string: " + str)
        document.getElementById('code_output').innerHTML= document.getElementById('code_output').innerHTML + #{ERB::Util.html_escape str} + "<br>"
        }
    end
  
    def printf(format,*args)
      %x{
        document.getElementById('code_output').innerHTML= document.getElementById('code_output').innerHTML + #{ERB::Util.html_escape sprintf(format,args)}
        }
    end
end

