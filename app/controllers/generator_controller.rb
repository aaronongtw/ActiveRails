class GeneratorController < ApplicationController
  def index
    @database = Database.new
    @field = Field.all
    @table = Table.new
    @relationship = Relationship.all
  end


  def create
    raise params.inspect
    # @database = Database.create
  end

  private
  def database_params
  params.require(:relationship).permit(:name, :database_id)
  end

end
