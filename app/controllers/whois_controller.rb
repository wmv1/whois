class WhoisController < ApplicationController
 def index
 end
 def show
  @domain = Domain.new params[:dominio].strip
  render json: @domain
 end
end
