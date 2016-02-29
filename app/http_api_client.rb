# Base class for HTTP-based APIs
class HttpApiClient

  HTTP_TIMEOUT_SECS = 1500

  def http_gem_timeout
    # due to strangeness of HTTP gem timeout API this needs to be divided - resulting timeout will be the whole
    HTTP_TIMEOUT_SECS / 3
  end

  def http_get(url, params)
    logger.debug "requesting #{url.inspect} with parameters #{params.inspect}"
    t0 = Time.now
    result = http_timeout.get(url, params: params)
    logger.debug "#{service_name} answered in #{Time.now - t0}s"
    result
  end

  def http_timeout
    HTTP.timeout(:global, write: http_gem_timeout, connect: http_gem_timeout, read: http_gem_timeout)
  end

end
