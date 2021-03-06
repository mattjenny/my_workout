module ApiMod
  extend ActiveSupport::Concern

  included do
    controller do
      skip_before_action :verify_authenticity_token
      before_action :restrict_content_type

      private
      def restrict_content_type
        render json: {msg:  'Content-Type must be application/json'}, status: 406 unless request.content_type == 'application/json'
      end
    end
  end
end
