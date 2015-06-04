class TableRelationsController < ApplicationController
  before_action :set_table_relation, only: [:show, :edit, :update, :destroy]
  before_action :set_database, :set_table

  # GET /table_relations
  # GET /table_relations.json
  def index
    @table_relations = TableRelation.all
  end

  # GET /table_relations/1
  # GET /table_relations/1.json
  def show
  end

  # GET /table_relations/new
  def new
    @table_relation = TableRelation.new
  end

  # GET /table_relations/1/edit
  def edit
  end

  # POST /table_relations
  # POST /table_relations.json
  def create
    @table_relation = TableRelation.new(table_relation_params)
    respond_to do |format|
      if @table_relation.save
        format.html { redirect_to edit_database_table_path(@database, @table), notice: 'Table relation was successfully created.' }
        format.json { render :show, status: :created, location: @table_relation }
      else
        format.html { render :new }
        format.json { render json: @table_relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /table_relations/1
  # PATCH/PUT /table_relations/1.json
  def update
    respond_to do |format|
      if @table_relation.update(table_relation_params)
        format.html { redirect_to edit_database_table_path(@database, @table), notice: 'Table relation was successfully updated.' }
        format.json { render :show, status: :ok, location: @table_relation }
      else
        format.html { render :edit }
        format.json { render json: @table_relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /table_relations/1
  # DELETE /table_relations/1.json
  def destroy
    @table_relation.destroy
    respond_to do |format|
      format.html { redirect_to edit_database_table_path(@database, @table), notice: 'Table relation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table_relation
      @table_relation = TableRelation.find(params[:id])
    end

    def set_table
      @table = Table.find(params[:table_id])
    end

    def set_database
      @database = Database.find(params[:database_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table_relation_params
      params.require(:table_relation).permit(:table_id, :relationship, :through, :table_to)
    end
end
