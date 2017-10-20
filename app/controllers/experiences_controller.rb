class ExperiencesController < InheritedResources::Base
  
  private

  def experience_params
    params.require(:experience).permit(:name, :description, :image_url, :sponsored)
  end
end
