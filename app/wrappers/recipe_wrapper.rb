class RecipeWrapper < Contentful::Entry
  def image_url(opts = {})
    self.photo.url(opts)
  end
end
