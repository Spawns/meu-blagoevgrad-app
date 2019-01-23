class RootController < ApplicationController
 skip_before_filter  :verify_authenticity_token
 layout 'welcome' , only: [:index]

 layout proc{|controller| controller.request.xhr? ? false : 'welcome'}
 #root page
   def index
     #FB
     fboauth = Koala::Facebook::OAuth.new("306357093569342", "15ff63b8de9faf98dc9921f132c49c14")
     fbgraph = Koala::Facebook::API.new( fboauth.get_app_access_token)
     #@posts = fbgraph.get_connections("967161946631021" , "posts" , {"limit" => "5"})
     @posts = []

      #YT
     # @ytclient = YouTubeIt::Client.new
      #@ytclient.video_by_user("meublagoevgrad", "5Qc2uyYwxOw")
     channel = Yt::Channel.new id: "UCkxjzGvAExQcTX2-w2taoZQ"
     @videos = channel.videos.first(4)

   end

  def show_video
    @video = Yt::Video.new id: params[:id]

    respond_to do |format|
      format.js
    end
  end

end