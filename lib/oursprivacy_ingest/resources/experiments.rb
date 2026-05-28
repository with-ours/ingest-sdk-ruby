# frozen_string_literal: true

module OursprivacyIngest
  module Resources
    class Experiments
      # Some parameter documentations has been truncated, see
      # {OursprivacyIngest::Models::ExperimentAssignmentParams} for more details.
      #
      # Return the server-side variant assignment for a visitor in a single A/B or
      # multivariate experiment, identified by its experiment key. Bucketing is
      # deterministic on `visitor_id` and is sticky across calls. Tracking an impression
      # is the default — pass `track_impression: false` to read without recording. The
      # browser SDK and this endpoint converge on the same variant for the same visitor.
      #
      # @overload assignment(experiment_key, token:, visitor_id:, context: nil, track_impression: nil, request_options: {})
      #
      # @param experiment_key [String] The experiment's stable key. Surfaced in the dashboard under each experiment's s
      #
      # @param token [String] The experiment token (`exp_*`) for the experiment settings holding this experime
      #
      # @param visitor_id [String] Stable identifier for the visitor — typically the Ours visitor id from your brow
      #
      # @param context [OursprivacyIngest::Models::ExperimentAssignmentParams::Context, nil] Optional page context for URL + query-param eligibility. Variant bucketing is de
      #
      # @param track_impression [Boolean, nil] When true (default), an `$experiment_impression` event is enqueued and the visit
      #
      # @param request_options [OursprivacyIngest::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0, OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1]
      #
      # @see OursprivacyIngest::Models::ExperimentAssignmentParams
      def assignment(experiment_key, params)
        parsed, options = OursprivacyIngest::ExperimentAssignmentParams.dump_request(params)
        path =
          if @client.base_url_overridden?
            [
              "experiments/assignments/%1$s",
              experiment_key
            ]
          else
            [
              "https://api.oursprivacy.com/api/v1/experiments/assignments/%1$s", experiment_key
            ]
          end
        @client.request(
          method: :post,
          path: path,
          body: parsed,
          model: OursprivacyIngest::Models::ExperimentAssignmentResponse,
          options: options
        )
      end

      # Return the active personalization assignments for a visitor. Read-only and never
      # records an impression. Personalizations are populated by the event-driven rule
      # engine — until that ships, this endpoint returns an empty list for every
      # visitor, which is the correct fail-closed behavior (no false positives).
      #
      # @overload personalization(token:, visitor_id:, request_options: {})
      #
      # @param token [String] The experiment token (`exp_*`).
      #
      # @param visitor_id [String]
      #
      # @param request_options [OursprivacyIngest::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [OursprivacyIngest::Models::ExperimentPersonalizationResponse]
      #
      # @see OursprivacyIngest::Models::ExperimentPersonalizationParams
      def personalization(params)
        parsed, options = OursprivacyIngest::ExperimentPersonalizationParams.dump_request(params)
        path =
          @client.base_url_overridden? ? "experiments/personalization" : "https://api.oursprivacy.com/api/v1/experiments/personalization"
        @client.request(
          method: :post,
          path: path,
          body: parsed,
          model: OursprivacyIngest::Models::ExperimentPersonalizationResponse,
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
