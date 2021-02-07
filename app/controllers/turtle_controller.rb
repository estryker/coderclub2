class TurtleController < ApplicationController
    include ApplicationHelper

    def draw
      # TODO: possibly put the example code in here instead of the view
      # @code = "Turtle.draw do\nend\n"
      @code = %Q{colors = %w[red orange yellow green]
  Turtle.draw do
     4.times do | i |
       pencolor colors[i]
       forward 100
       turnright 90
     end
  end}
      puts "code: #{@code}"
      puts "params"
      puts params.inspect
      if params.has_key? :code
        rc = RubyCode.where(url_id: params[:code])
        if rc
          @code = rc.first.code
        end
        puts "code: " + @code
      end
      render 'turtle/draw'
    end
  
     def save
       url =  save_locally(params,"/turtle/draw")
       puts "url: #{url}"
       flash[:notice] = "Use this link to get to your code: #{root_url}#{url.sub(/^\//,'')}" # need to chop off that leading '/'
       redirect_to url
     end  
end
