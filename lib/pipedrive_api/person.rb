module PipedriveAPI
  class Person < Base

    class << self

      def find_by_email(email, **params)
        response = get "#{resource_path}/find", query: { term: email, search_by_email: true }.merge(params)
        handle response
      end

      def deals(id, **params)
        response = get "#{resource_path}/#{id}/deals", query: params
        handle response
      end

    end

  end
end
