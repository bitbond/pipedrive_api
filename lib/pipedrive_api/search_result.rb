module PipedriveAPI
  class SearchResult < Base

    class << self

      def by_field(term, field_type, field_key, exact_match=true, **params)
        query = { term: term, field_type: field_type, field_key: field_key, exact_match: exact_match, return_item_ids: true }
        response = get "#{resource_path}/field", query: query.merge(params)
        handle response
      end

    end

  end
end
