class GeneratorController < ApplicationController
  def create
    generate_file
  end

  def index
  end

  private
  def database_params
  params.require(:relationship).permit(:name, :database_id)
  end

  def generate_file
    @database = Database.find(params[:id])
    @filename = params[:fname]
    @text = ""
    @database.tables.each do |table|
@text += "system('rails g scaffold #{table.name} "
      table.fields.each do |field| 
@text += "" + "#{field.name}" + ':' + "#{field.fieldtype} " 
      end
@text += "')"
     end

    send_data @text, :filename => "#{@filename}"+'.rb'
  end
end


#   File.open(@filename +".rb", 'wb') do |f| 
#     @database.tables.each do |table|
#   f.write("system('rails g scaffold #{table.name} ") 
#     table.fields.each do |field| 
#       f.write("" + "#{field.name}" + ':' + "#{field.fieldtype} " )
#   end 
#   f.write("')")
#   f.write('
#     ')
#   end
# end

  


