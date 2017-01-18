module SerialMagnet
  module API
    def article id
      verify_param(id)
      perform_get('article', 'articles', id).first
    end

    def article_with_slug slug
      verify_param(slug)
      perform_get('article', 'articles/slug', slug, 'articles').first
    end

    def article_with_sku sku
      verify_param(sku)
      perform_get('article', 'articles/sku', sku, 'articles').first
    end

    def articles
      perform_get('article', 'articles')
    end

    def issue id
      verify_param(id)
      perform_get('issue', 'issues', id).first
    end

    def issues
      perform_get_all('issue', 'issues')
    end

    def media id
      verify_param(id)
      perform_get('media', 'media', id).first
    end

    def volume id
      verify_param(id)
      perform_get('volume', 'volumes', id).first
    end

    def volumes
      perform_get('volume', 'volumes')
    end

    def verify_param param
      raise RestClient::ResourceNotFound if param.to_s.empty?
    end
  end
end

