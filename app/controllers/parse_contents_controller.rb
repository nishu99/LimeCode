class ParseContentsController < ApplicationController  
  require 'nokogiri'   
  require 'open-uri'

  def new
    @parse_content = ParseContent.new
  end

  def index
    @parse_contents = ParseContent.all
  end

  def create
    
    begin
      page = Nokogiri::HTML(open( params[:parse_content][:url] ))
      source = page.css("h1,h2,h3,a")
      content = ""  
      source.each do |element|
        content << element.content
      end
      parse_content = ParseContent.create( url: params[:parse_content][:url], content: content )
      redirect_to parse_content_path(parse_content)
    rescue
      redirect_to :back, alert: "not a valid url"
    end    

  end

  def show
    @parse_content = ParseContent.find_by(params[:id])
  end

  # def parse_content
  
  # end

end
