# typed: strong

module OursprivacyIngest
  module Models
    class ExperimentAssignmentParams < OursprivacyIngest::Internal::Type::BaseModel
      extend OursprivacyIngest::Internal::Type::RequestParameters::Converter
      include OursprivacyIngest::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            OursprivacyIngest::ExperimentAssignmentParams,
            OursprivacyIngest::Internal::AnyHash
          )
        end

      # The experiment's stable key. Surfaced in the dashboard under each experiment's
      # setup tab.
      sig { returns(String) }
      attr_accessor :experiment_key

      # The experiment token (`exp_*`) for the experiment settings holding this
      # experiment. Available from the dashboard.
      sig { returns(String) }
      attr_accessor :token

      # Stable identifier for the visitor — typically the Ours visitor id from your
      # browser cookie, or your own server-side user id if you keep the same id
      # consistent across browser and server.
      sig { returns(String) }
      attr_accessor :visitor_id

      # Optional page context for URL + query-param eligibility. Variant bucketing is
      # deterministic on `visitor_id` regardless of context.
      sig do
        returns(
          T.nilable(OursprivacyIngest::ExperimentAssignmentParams::Context)
        )
      end
      attr_reader :context

      sig do
        params(
          context:
            T.nilable(
              OursprivacyIngest::ExperimentAssignmentParams::Context::OrHash
            )
        ).void
      end
      attr_writer :context

      # When true (default), an `$experiment_impression` event is enqueued and the
      # visitor's `experiment_assignments` map is updated. Set to false to read the
      # assignment without recording an impression — useful for in-test diagnostics.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :track_impression

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
        ).returns(T.attached_class)
      end
      def self.new(
        # The experiment's stable key. Surfaced in the dashboard under each experiment's
        # setup tab.
        experiment_key:,
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

      sig do
        override.returns(
          {
            experiment_key: String,
            token: String,
            visitor_id: String,
            context:
              T.nilable(OursprivacyIngest::ExperimentAssignmentParams::Context),
            track_impression: T.nilable(T::Boolean),
            request_options: OursprivacyIngest::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Context < OursprivacyIngest::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              OursprivacyIngest::ExperimentAssignmentParams::Context,
              OursprivacyIngest::Internal::AnyHash
            )
          end

        # The current query string (e.g. `?utm_source=meta`). When provided, the
        # experiment's query-param conditions are evaluated for eligibility. If omitted,
        # the query string is parsed from `url`.
        sig { returns(T.nilable(String)) }
        attr_accessor :search

        # The current page URL. When provided, the experiment's URL patterns are evaluated
        # for eligibility — visitors on non-matching URLs are returned
        # `in_experiment: false`. Omit when the caller is pre-gating the request.
        sig { returns(T.nilable(String)) }
        attr_accessor :url

        # Optional page context for URL + query-param eligibility. Variant bucketing is
        # deterministic on `visitor_id` regardless of context.
        sig do
          params(search: T.nilable(String), url: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # The current query string (e.g. `?utm_source=meta`). When provided, the
          # experiment's query-param conditions are evaluated for eligibility. If omitted,
          # the query string is parsed from `url`.
          search: nil,
          # The current page URL. When provided, the experiment's URL patterns are evaluated
          # for eligibility — visitors on non-matching URLs are returned
          # `in_experiment: false`. Omit when the caller is pre-gating the request.
          url: nil
        )
        end

        sig do
          override.returns(
            { search: T.nilable(String), url: T.nilable(String) }
          )
        end
        def to_hash
        end
      end
    end
  end
end
