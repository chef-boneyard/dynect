if defined?(ChefSpec)
  def create_dynect_rr(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:dynect_rr, :create, resource_name)
  end

  def update_dynect_rr(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:dynect_rr, :update, resource_name)
  end

  def replace_dynect_rr(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:dynect_rr, :replace, resource_name)
  end

  def delete_dynect_rr(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:dynect_rr, :delete, resource_name)
  end
end
