# Console.log and puts do the same thing
$console.log "hello opal!"

puts "hello world!"

# Note that we must make sure the Document is loaded before we try to find our button
Document.ready? do 
  e2 = Element['#commitRubyCode']
  puts e2.inspect
  e2.on :click do
    alert "codewindow was clicked!"
  end
end



