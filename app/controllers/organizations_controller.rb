class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  def index
    if params[:fields].present?
      requested = params[:fields].split(',').map(&:strip)
      required = %w[id updated_at created_at]
      allowed = (requested + required) & Organization.column_names
      organizations = Organization.select(allowed.uniq)
    else
      organizations = Organization.all
    end
    render json: organizations
  end

  def show
    render json: @organization
  end

  def new
    render json: {}
  end

  def create
    organization = Organization.new(organization_params)
    if organization.save
      render json: organization, status: :created
    else
      render json: { errors: organization.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def edit
    render json: @organization
  end

  def update
    if @organization.update(organization_params)
      render json: @organization
    else
      render json: { errors: @organization.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @organization.destroy
    render json: { message: 'Organization was successfully destroyed.' }
  end

  private

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name)
  end
end