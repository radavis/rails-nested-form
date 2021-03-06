class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  def index
    @people = Person.all
  end

  # GET /people/1
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
    @person.pets.build
    @person.build_drivers_license
  end

  # GET /people/1/edit
  def edit
    @person.build_drivers_license if !@person.drivers_license.present?
  end

  # POST /people
  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to @person, notice: 'Person was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /people/1
  def update
    if @person.update(person_params)
      redirect_to @person, notice: 'Person was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /people/1
  def destroy
    @person.destroy
    redirect_to people_url, notice: 'Person was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(
        :name,
        :address,
        :phone,
        pets_attributes: [
          :id,
          :name,
          :animal_type,
          :adopted_on
        ],
        drivers_license_attributes: [
          :id,
          :state,
          :drivers_license_number,
          :expires_on
        ]
      )
    end
end
