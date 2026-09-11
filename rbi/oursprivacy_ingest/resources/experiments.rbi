# typed: strong

module OursprivacyIngest
  module Resources
    class Experiments
      # Return the server-side variant assignment for a visitor in a single A/B or
      # multivariate experiment, identified by its experiment key. Bucketing is
      # deterministic on `visitor_id` and is sticky across calls. Tracking an impression
      # is the default — pass `track_impression: false` to read without recording. The
      # browser SDK and this endpoint converge on the same variant for the same visitor.
      sig do
        params(
          experiment_key: String,
          token: String,
          visitor_id: String,
          context:
            T.nilable(
              OursprivacyIngest::ExperimentAssignmentParams::Context::OrHash
            ),
          track_impression: T.nilable(T::Boolean),
          request_options: OursprivacyIngest::RequestOptions::OrHash
        ).returns(
          OursprivacyIngest::Models::ExperimentAssignmentResponse::Variants
        )
      end
      def assignment(
        # The experiment's stable key. Surfaced in the dashboard under each experiment's
        # setup tab.
        experiment_key,
        # The experiment token (`exp_*`) for the experiment settings holding this
        # experiment. Available from the dashboard.
        token:,
        # Stable identifier for the visitor — typically the Ours visitor id from your
        # browser cookie, or your own server-side user id if you keep the same id
        # consistent across browser and server.
        visitor_id:,
        # Optional page context for URL + query-param eligibility. Variant bucketing is
        # deterministic on `visitor_id` regardless of context.
        context: nil,
        # When true (default), an `$experiment_impression` event is enqueued and the
        # visitor's `experiment_assignments` map is updated. Set to false to read the
        # assignment without recording an impression — useful for in-test diagnostics.
        track_impression: nil,
        request_options: {}
      )
      end

      # Return a visitor's active personalization assignments and accumulated
      # personalization properties. Read-only and never records an impression.
      # `personalizations` lists the personalization experiences the visitor is
      # currently assigned to; `properties` returns the visitor traits your
      # personalization property rules have accumulated, ready to use in server-rendered
      # copy or targeting. Both are empty for a visitor who has not matched anything
      # yet.
      sig do
        params(
          token: String,
          visitor_id: String,
          request_options: OursprivacyIngest::RequestOptions::OrHash
        ).returns(OursprivacyIngest::Models::ExperimentPersonalizationResponse)
      end
      def personalization(
        # The experiment token (`exp_*`).
        token:,
        visitor_id:,
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
