module DependencyInjector
  def resources
    @resources ||= {}
  end

  def register(key, value)
    resources[key] = value
  end

  def resource(key)
    res = resources[key]
    raise('Resource Not Found') if res.nil?
    res
  end
end
