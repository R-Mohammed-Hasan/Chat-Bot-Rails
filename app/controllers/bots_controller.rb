class BotsController < ApplicationController
  def index
    @chattings = Chat.all
    @message = Chat.new
  end

  def message
    input_from_user = user_params[:message]
    require "uri"
    require "net/http"
    require "openssl"

    url = URI("https://waifu.p.rapidapi.com/path?user_id=sample_user_id&message=#{input_from_user}&from_name=Boy&to_name=Girl&situation=Developers%20talking%20to%20each%20other.&translate_from=auto&translate_to=auto")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request["content-type"] = "application/json"
    request["X-RapidAPI-Key"] = "9c983ffa95msh7457a831e5d1342p196f2ejsn9449efb04136"
    request["X-RapidAPI-Host"] = "waifu.p.rapidapi.com"
    request.body = "{}"

    response = http.request(request)
    respond_to do |format|
      format.js { render js: "send(#{response.read_body.split("'")}, 'response')" }
    end
  end

  def user_params
    params.require(:chat).permit(:message)
  end
end
