# typed: strong

module OursprivacyIngest
  module Resources
    class Track
      # Track events from your server. Please include at least one of: userId,
      # externalId, or email. These properties help us associate events with existing
      # users. For top-level visitor properties: null clears the existing value, while
      # undefined, omitted fields, and empty strings are ignored. For entries inside
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
        # A unique identifier for the event. This helps prevent duplicate events.
        distinct_id: nil,
        # The email address of a user. We will associate this event with the user or
        # create a user. Used for lookup if externalId and userId are not included in the
        # request.
        email: nil,
        # Any additional event properties you want to pass along.
        event_properties: nil,
        # The externalId (the ID in your system) of a user. We will associate this event
        # with the user or create a user. If included in the request, email lookup is
        # ignored.
        external_id: nil,
        # End-user network context for server-side calls. Required for probabilistic
        # identity resolution when the caller is a backend server rather than an end-user
        # browser.
        identity_context: nil,
        # The time at which the event occurred in milliseconds since UTC epoch. The time
        # must be in the past and within the last 7 days.
        time: nil,
        # The Ours user id stored in local storage and cookies on your web properties. If
        # userId is included in the request, we do not lookup the user by email or
        # externalId.
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
