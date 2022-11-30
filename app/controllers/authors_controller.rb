class AuthorsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create!(author_params)

    render json: author, status: :created
  end

  private
  
  def author_params
    params.permit(:email, :name)
  end
  
  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end
end

# Authors
#   POST /authors
#     with valid author params
#       creates a new author
#       returns the author data
#       returns a status code of 201 (created)
#     with invalid author params
#       does not create a new author
#       returns the error messages
#       returns a status code of 422 (Unprocessable Entity)
