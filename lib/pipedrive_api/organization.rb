module PipedriveAPI
  class Organization < Base

    class << self

      def deals(id, **params)
        response = get "#{resource_path}/#{id}/deals", query: params
        handle response
      end

    end

  end
end
