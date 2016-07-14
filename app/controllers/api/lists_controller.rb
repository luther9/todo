class Api::ListsController < ApiController
  before_action :authenticated?

  def create
    list = List.new list_params
    list.permission ||= 'private_'
    if validate(list) && list.save
      render json: list
    else
      render json: {errors: list.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      list = List.find params[:id]
    rescue ActiveRecord::RecordNotFound
      render json: {}, status: :not_found
      return
    end
    list.destroy
    render json: {}, status: :no_content
  end

  def update
    list = List.find params[:id]
    if validate(list) && list.update(list_params)
      render json: list
    else
      render json: {errors: list.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :permission)
  end

  def validate list
    ['private_', 'viewable', 'open'].include? list.permission
  end
end
