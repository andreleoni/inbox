class V1::MessagesController < ApplicationController
  def index
    render json: { teste: "some value" }
  end

  def show
    # Marca como lida se não tiver lida ainda

    { url: "url" }
  end

  def create
  end

  def update
    # Marca como lida
  end

  def destroy
  end
end
