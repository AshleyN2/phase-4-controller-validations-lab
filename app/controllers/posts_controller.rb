class PostsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])

    post.update!(post_params)

    render json: post
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end

end

# Posts
#   PATCH /posts/:id
#     with valid post params
#       updates a post
#       returns the post data
#       returns a status code of 200 (ok)
#     with invalid author params
#       does not update the post
#       returns the error messages
#       returns a status code of 422 (Unprocessable Entity)
