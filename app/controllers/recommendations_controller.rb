class RecommendationsController < SecureController
  def recommend
    @experiences = Experience.limit(4)
    @experiences.each do |experience|
      experience.current_user = current_user
    end
    render json: @experiences.to_json(methods: [:visited])
  end
end
