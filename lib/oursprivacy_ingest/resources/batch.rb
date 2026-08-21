# frozen_string_literal: true

module OursprivacyIngest
  module Resources
    class Batch
      # Send multiple `/track`-shaped events in a single request. This endpoint is
      # intended for replay, backfill, and asynchronous bulk delivery. The top-level
      # token is authorized once for the full batch. Each batch row must include
      # `distinctId`, and mixed validation or queue outcomes are reported per row.
      #
      # @overload create(token:, events:, request_options: {})
      #
      # @param token [String] The token for your Source. You can find this in the dashboard.
      #
      # @param events [Array<OursprivacyIngest::Models::BatchCreateParams::Event>] A list of `/track`-shaped events to validate and enqueue together.
      #
      # @param request_options [OursprivacyIngest::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [OursprivacyIngest::Models::BatchCreateResponse]
      #
      # @see OursprivacyIngest::Models::BatchCreateParams
      def create(params)
        parsed, options = OursprivacyIngest::BatchCreateParams.dump_request(params)
        path = @client.base_url_overridden? ? "batch" : "https://api.oursprivacy.com/api/v1/batch"
        @client.request(
          method: :post,
          path: path,
          body: parsed,
          model: OursprivacyIngest::Models::BatchCreateResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [OursprivacyIngest::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
