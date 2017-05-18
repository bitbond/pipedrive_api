module PipedriveAPI
  class Deal < Base

    class << self
      def duplicate(id)
        response = post "#{resource_path}/#{id}/duplicate"
        handle response
      end
    end
  end
end
