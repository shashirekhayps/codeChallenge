class ContentfulClientWrapper
  attr_reader :client

  def initialize
    client_opts = default_client_options
    @client ||= ::Contentful::Client.new(client_opts)
  end

  def recipes(include_level = 1)
    self.client.entries(content_type: 'recipe', include: include_level)
  end

  def recipe(id, include_level = 1)
    self.client.entry(id)
  end

  private

  def default_client_options
    contentful_creds = Rails.application.credentials.contentful
    {
      space: "kk2bw5ojx476",
      access_token: "7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c",
      environment: "master",
      entry_mapping: client_entry_mapping,
      dynamic_entries: :auto,
      max_include_resolution_depth: 2,
      reuse_entries: true,
      timeout_connect: 2,
      timeout_write: 20,
      timeout_read: 5,
      logger: Rails.logger
    }
  end

  def client_entry_mapping
    {
      'recipe' => RecipeWrapper
    }
  end

end
