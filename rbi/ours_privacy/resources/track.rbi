# typed: strong

module OursPrivacy
  module Resources
    class Track
      # Track events from your server. Please include at least one of: userId,
      # externalId, or email. These properties help us associate events with existing
      # users. For all fields, null values unset the property and undefined values do
      # not unset existing properties.
      sig do
        params(
          token: String,
          event: String,
          default_properties:
            T.nilable(OursPrivacy::TrackEventParams::DefaultProperties::OrHash),
          distinct_id: T.nilable(String),
          email: T.nilable(String),
          event_properties: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          external_id: T.nilable(String),
          time: T.nilable(Float),
          user_id: T.nilable(String),
          user_properties:
            T.nilable(OursPrivacy::TrackEventParams::UserProperties::OrHash),
          request_options: OursPrivacy::RequestOptions::OrHash
        ).returns(OursPrivacy::Models::TrackEventResponse)
      end
      def event(
        # The token for your Ours Privacy Source. You can find this in the Ours dashboard.
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
      sig { params(client: OursPrivacy::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
