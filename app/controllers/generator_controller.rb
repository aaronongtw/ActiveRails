class GeneratorController < ApplicationController
  def index
    if @current_use.present?
      redirect_to users_path
    end
  end


  def create
    # @database = Database.create
  end

  private
  def database_params
  params.require(:relationship).permit(:name, :database_id)
  end

end
