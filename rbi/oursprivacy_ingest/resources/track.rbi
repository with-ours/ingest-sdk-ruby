# typed: strong

module OursprivacyIngest
  module Resources
    class Track
      # Track events from your server. Include at least one of userId, externalId, or
      # email so the event can be associated with a visitor. Identity resolution runs in
      # priority order: userId (direct, no lookup) → externalId (lookup by your ID) →
      # email (fallback lookup). If you know both userId and externalId, send both. For
      # top-level visitor properties: null clears the existing value, while undefined,
      # omitted fields, and empty strings are ignored. For entries inside
      # custom_properties: null, undefined, and empty strings are all ignored
      # (custom_properties use merge semantics). See
      # https://docs.oursprivacy.com/docs/data-types for details and common pitfalls.
      sig do
        params(
          token: String,
          event: String,
          default_properties:
            T.nilable(
              OursprivacyIngest::TrackEventParams::DefaultProperties::OrHash
            ),
          distinct_id: T.nilable(String),
          email: T.nilable(String),
          event_properties: T.nilable(T::Hash[Symbol, T.nilable(String)]),
          external_id: T.nilable(String),
          identity_context:
            T.nilable(
              OursprivacyIngest::TrackEventParams::IdentityContext::OrHash
            ),
          time: T.nilable(Float),
          user_id: T.nilable(String),
          user_properties:
            T.nilable(
              OursprivacyIngest::TrackEventParams::UserProperties::OrHash
            ),
          request_options: OursprivacyIngest::RequestOptions::OrHash
        ).returns(OursprivacyIngest::Models::TrackEventResponse)
      end
      def event(
        # The token for your Source. You can find this in the dashboard.
        token:,
        # The name of the event you're tracking. This must be whitelisted in the Ours
        # dashboard.
        event:,
        # These properties are used throughout the Ours app to pass known values onto
        # destinations
        default_properties: nil,
        # A unique identifier for this event used for deduplication. Highly recommended —
        # if omitted, Ours will generate one for you, but supplying your own gives you
        # stronger idempotency guarantees (e.g. a Stripe payment intent ID or your
        # internal order ID).
        distinct_id: nil,
        # The email address of a user. Used as a fallback lookup when neither userId nor
        # externalId is provided. We search your account for a visitor with this email and
        # attach the event to them. If no match is found, a new visitor is created.
        email: nil,
        # Any additional event properties you want to pass along.
        event_properties: nil,
        # Your system's unique identifier for this user. We search your account for an
        # existing visitor with this externalId and attach the event to them (resolving to
        # their Ours Visitor ID). If no match is found, a new visitor is created. When
        # present, email lookup is skipped. If you also have the userId from cookies or
        # local storage, send both — it removes the lookup round-trip.
        external_id: nil,
        # End-user network context for server-side calls. Required for probabilistic
        # identity resolution when the caller is a backend server rather than an end-user
        # browser.
        identity_context: nil,
        # The time at which the event occurred in milliseconds since UTC epoch. The time
        # must be in the past and within the last 7 days.
        time: nil,
        # The Ours Visitor ID stored in local storage and cookies on your web properties.
        # When present, this is used directly — no lookup by externalId or email is
        # performed. If you have both a userId and an externalId, send both so the event
        # is attached to the right visitor without any lookup overhead.
        user_id: nil,
        # Properties to set on the visitor. (optional) You can also update these
        # properties via the identify endpoint.
        user_properties: nil,
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
