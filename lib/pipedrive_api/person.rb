module PipedriveAPI
  class Person < Base

    class << self

      def find_by_email(email, **params)
        response = get "#{resource_path}/find", query: { term: email, search_by_email: true }.merge(params)
        response.success? ? response['data'] : bad_response(response, id)
      end

      def deals(id, **params)
        response = get "#{resource_path}/#{id}/deals", query: params
        response.success? ? response['data'] : bad_response(response, id)
      end

    end

  end
end
