# typed: strong

module OursprivacyIngest
  module Resources
    class Batch
      # Send multiple `/track`-shaped events in a single request. This endpoint is
      # intended for replay, backfill, and asynchronous bulk delivery. The top-level
      # token is authorized once for the full batch. Each batch row must include
      # `distinctId`, and mixed validation or queue outcomes are reported per row.
      sig do
        params(
          token: String,
          events: T::Array[OursprivacyIngest::BatchCreateParams::Event::OrHash],
          request_options: OursprivacyIngest::RequestOptions::OrHash
        ).returns(OursprivacyIngest::Models::BatchCreateResponse)
      end
      def create(
        # The token for your Source. You can find this in the dashboard.
        token:,
        # A list of `/track`-shaped events to validate and enqueue together.
        events:,
        request_options: {}
      )
      end

      # @api private
      sig do
        params(client: OursprivacyIngest::Client).returns(T.attached_class)
      end
      def self.new(client:)
      end
    end
  end
end
