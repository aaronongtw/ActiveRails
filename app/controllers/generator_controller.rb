class GeneratorController < ApplicationController
  def create
    generate_scaffold
  end

  def index
  end

  def tutorial
    @database = Database.find(params[:id])
  end

  def qr
    @database = Database.find(params[:id])
    @auth = @current_user.email.hash
    # @data_in_str = @database.name + "\n" 
    # @database.tables.each do |t|
    #  @data_in_str += t.name + ",["
    #  t.table_relations.each do |tr|
    #   @data_in_str += tr.relationship + ',' + tr.table_to + ',' + tr.through + '|'
    # end
    # @data_in_str += "],["
    #  t.fields.each do |f|
    #   @data_in_str += f.name + ':' + f.fieldtype + ','
    # end
    # @data_in_str += "]\n"
    # end
    @datapath = "http://ottadd.herokuapp.com/databases/#{@database.id}/#{@auth}"
    raise params.inspect
    @qr = RQRCode::QRCode.new( @datapath, :size => 13, :level => :h )
  end

  private
  def database_params
  params.require(:relationship).permit(:name, :database_id)
  end

  def generate_scaffold
    @database = Database.find(params[:id])
    @filename = params[:fname]
    @text = ""
    @database.tables.each do |table|

      @text += "system('rails g scaffold #{table.name} "
      table.fields.each do |field| 
      @text += "" + "#{field.name}" + ':' + "#{field.fieldtype} " 
      end
      @text += "')\n"
end
@database.tables.each do |table|
      if table.table_relations[0].present?     
      @text += "
          File.open('app/models/#{table.name}.rb', 'w') do |file|
            file.puts('class #{table.name.capitalize} <ActiveRecord::Base')\n"
        table.table_relations.each do |r|
          table.name = table.name.downcase
          r.table_to = r.table_to.downcase
          if r.through.present?
            r.through = r.through.downcase
          end
          if r.relationship.include? "through"
            @text += "file.puts('   #{r.relationship.split(' ')[0]}"
            if r.relationship.include? "many"
              @text += " :#{r.table_to.pluralize},"
            else
              @text += " :#{r.table_to},"
            end
            @text += " :through => :#{r.through.pluralize}')\n"
            else
          @text += "file.puts('   #{r.relationship}"
            if r.relationship.include? "many"
              @text += " :#{r.table_to.pluralize}')\n"
            else
              @text += " :#{r.table}')\n"
            end
          end

        end
        @text += "file.puts('end')\n"
        @text += "end\n"

        

    end
  end
@database.tables.each do |table|  
  table.table_relations.each do|r|
          if r.relationship.include? 'has_and_belongs_to_many'
            @relationshiptable = [table.name, r.table_to].sort.join('_')
            @text += "system('rails generate migration create_#{@relationshiptable} #{table.name}_id:integer #{r.table_to}_id:integer') \n"
          end
          if r.relationship.include? 'through'
          else
      @text += "
          file = File.read('app/models/#{r.table_to}.rb')
          filtered = file.gsub(/end/, '')
          File.open('app/models/#{r.table_to}.rb', 'w') do |f|
            f.write(filtered)
          end
          File.open('app/models/#{r.table_to}.rb', 'a') do |l|"
        case r.relationship
          when "has_one"
            @text += "l.puts('   has_one :#{table.name}')"
          when "has_many"
            @text += "l.puts('   belongs_to :#{table.name}')"
          when "belongs_to"
            @text += "l.puts('   has_many :#{table.name.pluralize}')"
          when "has_and_belongs_to_many"
            @text += "l.puts('   has_and_belongs_to_many :#{table.name.pluralize}')"
          end
          
        @text += "\nl.puts('end')\n"
        @text += "end\n"    
    end
  end
end
@text += "system('rake db:migrate')"
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

  


