class LessonsController < ApplicationController
    include ApplicationHelper

    def index
      @lesson_files = lesson_files
    end
  
    def lesson
  
      @notebook_url = "https://www.coderclubnotebook.us/"
      @html_name = lesson_params[:fname]
  
      # TODO: fix the static linking
      # @notebook_url = ""
      # notebook_name = @html_name.sub(/\.html$/,'') + '.ipynb'
      #if github_user && ! github_user.empty?
      #  @notebook_url = "https://www.coderclub.us/user/#{github_user}/notebooks/#{notebook_name}"
      #end
    end
  
    private
    def lesson_params
      params.permit(:fname)
    end
  
    def lesson_files
       @all_lesson_files ||= Dir["#{Rails.root}/app/views/lessons/_lesson*"].grep(/_lesson\d{2}.*\.md/) {|fname| File.basename(fname).sub(/\.md$/,'').sub(/^_/,'') }
    end  
end
