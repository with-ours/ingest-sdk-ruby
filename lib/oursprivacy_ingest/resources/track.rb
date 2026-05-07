# frozen_string_literal: true

module OursprivacyIngest
  module Resources
    class Track
      # Some parameter documentations has been truncated, see
      # {OursprivacyIngest::Models::TrackEventParams} for more details.
      #
      # Track events from your server. Include at least one of userId, externalId, or
      # email so the event can be associated with a visitor. Identity resolution runs in
      # priority order: userId (direct, no lookup) → externalId (lookup by your ID) →
      # email (fallback lookup). If you know both userId and externalId, send both. For
      # top-level visitor properties: null clears the existing value, while undefined,
      # omitted fields, and empty strings are ignored. For entries inside
      # custom_properties: null, undefined, and empty strings are all ignored
      # (custom_properties use merge semantics). See
      # https://docs.oursprivacy.com/docs/data-types for details and common pitfalls.
      #
      # @overload event(token:, event:, default_properties: nil, distinct_id: nil, email: nil, event_properties: nil, external_id: nil, identity_context: nil, time: nil, user_id: nil, user_properties: nil, request_options: {})
      #
      # @param token [String] The token for your Source. You can find this in the dashboard.
      #
      # @param event [String] The name of the event you're tracking. This must be whitelisted in the Ours dash
      #
      # @param default_properties [OursprivacyIngest::Models::TrackEventParams::DefaultProperties, nil] These properties are used throughout the Ours app to pass known values onto dest
      #
      # @param distinct_id [String, nil] A unique identifier for this event used for deduplication. Highly recommended —
      #
      # @param email [String, nil] The email address of a user. Used as a fallback lookup when neither userId nor e
      #
      # @param event_properties [Hash{Symbol=>String, nil}, nil] Any additional event properties you want to pass along.
      #
      # @param external_id [String, nil] Your system's unique identifier for this user. We search your account for an exi
      #
      # @param identity_context [OursprivacyIngest::Models::TrackEventParams::IdentityContext, nil] End-user network context for server-side calls. Required for probabilistic ident
      #
      # @param time [Float, nil] The time at which the event occurred in milliseconds since UTC epoch. The time m
      #
      # @param user_id [String, nil] The Ours Visitor ID stored in local storage and cookies on your web properties.
      #
      # @param user_properties [OursprivacyIngest::Models::TrackEventParams::UserProperties, nil] Properties to set on the visitor. (optional) You can also update these propertie
      #
      # @param request_options [OursprivacyIngest::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [OursprivacyIngest::Models::TrackEventResponse]
      #
      # @see OursprivacyIngest::Models::TrackEventParams
      def event(params)
        parsed, options = OursprivacyIngest::TrackEventParams.dump_request(params)
        path = @client.base_url_overridden? ? "track" : "https://api.oursprivacy.com/api/v1/track"
        @client.request(
          method: :post,
          path: path,
          body: parsed,
          model: OursprivacyIngest::Models::TrackEventResponse,
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
