class RecommendationsController < SecureController
  def recommend
    @experiences = Experience.limit(4)
    render json: @experiences.to_json
  end
end
