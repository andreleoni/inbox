class V1::MessagesController < ApplicationController
  def index
    render json: { teste: "some value" }
  end

  def show
    { url: "url" }
  end

  def create
  end

  def update
  end

  def destroy
  end
end
