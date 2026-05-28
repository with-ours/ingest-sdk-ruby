# frozen_string_literal: true

module OursprivacyIngest
  module Models
    # @see OursprivacyIngest::Resources::Experiments#assignment
    class ExperimentAssignmentParams < OursprivacyIngest::Internal::Type::BaseModel
      extend OursprivacyIngest::Internal::Type::RequestParameters::Converter
      include OursprivacyIngest::Internal::Type::RequestParameters

      # @!attribute experiment_key
      #   The experiment's stable key. Surfaced in the dashboard under each experiment's
      #   setup tab.
      #
      #   @return [String]
      required :experiment_key, String

      # @!attribute token
      #   The experiment token (`exp_*`) for the experiment settings holding this
      #   experiment. Available from the dashboard.
      #
      #   @return [String]
      required :token, String

      # @!attribute visitor_id
      #   Stable identifier for the visitor — typically the Ours visitor id from your
      #   browser cookie, or your own server-side user id if you keep the same id
      #   consistent across browser and server.
      #
      #   @return [String]
      required :visitor_id, String

      # @!attribute context
      #   Optional page context for URL + query-param eligibility. Variant bucketing is
      #   deterministic on `visitor_id` regardless of context.
      #
      #   @return [OursprivacyIngest::Models::ExperimentAssignmentParams::Context, nil]
      optional :context, -> { OursprivacyIngest::ExperimentAssignmentParams::Context }, nil?: true

      # @!attribute track_impression
      #   When true (default), an `$experiment_impression` event is enqueued and the
      #   visitor's `experiment_assignments` map is updated. Set to false to read the
      #   assignment without recording an impression — useful for in-test diagnostics.
      #
      #   @return [Boolean, nil]
      optional :track_impression, OursprivacyIngest::Internal::Type::Boolean, nil?: true

      # @!method initialize(experiment_key:, token:, visitor_id:, context: nil, track_impression: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {OursprivacyIngest::Models::ExperimentAssignmentParams} for more details.
      #
      #   @param experiment_key [String] The experiment's stable key. Surfaced in the dashboard under each experiment's s
      #
      #   @param token [String] The experiment token (`exp_*`) for the experiment settings holding this experime
      #
      #   @param visitor_id [String] Stable identifier for the visitor — typically the Ours visitor id from your brow
      #
      #   @param context [OursprivacyIngest::Models::ExperimentAssignmentParams::Context, nil] Optional page context for URL + query-param eligibility. Variant bucketing is de
      #
      #   @param track_impression [Boolean, nil] When true (default), an `$experiment_impression` event is enqueued and the visit
      #
      #   @param request_options [OursprivacyIngest::RequestOptions, Hash{Symbol=>Object}]

      class Context < OursprivacyIngest::Internal::Type::BaseModel
        # @!attribute search
        #   The current query string (e.g. `?utm_source=meta`). When provided, the
        #   experiment's query-param conditions are evaluated for eligibility. If omitted,
        #   the query string is parsed from `url`.
        #
        #   @return [String, nil]
        optional :search, String, nil?: true

        # @!attribute url
        #   The current page URL. When provided, the experiment's URL patterns are evaluated
        #   for eligibility — visitors on non-matching URLs are returned
        #   `in_experiment: false`. Omit when the caller is pre-gating the request.
        #
        #   @return [String, nil]
        optional :url, String, nil?: true

        # @!method initialize(search: nil, url: nil)
        #   Some parameter documentations has been truncated, see
        #   {OursprivacyIngest::Models::ExperimentAssignmentParams::Context} for more
        #   details.
        #
        #   Optional page context for URL + query-param eligibility. Variant bucketing is
        #   deterministic on `visitor_id` regardless of context.
        #
        #   @param search [String, nil] The current query string (e.g. `?utm_source=meta`). When provided, the experimen
        #
        #   @param url [String, nil] The current page URL. When provided, the experiment's URL patterns are evaluated
      end
    end
  end
end
