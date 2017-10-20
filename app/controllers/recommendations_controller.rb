class RecommendationsController < SecureController
  def recommend
    @experiences = Experience.limit(4)
    render json: @experiences.to_json
  end

  private

  def experience_params
    params.require(:experience).permit(:name, :description, :image_url, :sponsored)
  end
end
