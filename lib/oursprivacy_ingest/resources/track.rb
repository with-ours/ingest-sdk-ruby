# frozen_string_literal: true

module OursprivacyIngest
  module Resources
    class Track
      # Some parameter documentations has been truncated, see
      # {OursprivacyIngest::Models::TrackEventParams} for more details.
      #
      # Track events from your server. Please include at least one of: userId,
      # externalId, or email. These properties help us associate events with existing
      # users. For all fields, null values unset the property and undefined values do
      # not unset existing properties.
      #
      # @overload event(token:, event:, default_properties: nil, distinct_id: nil, email: nil, event_properties: nil, external_id: nil, time: nil, user_id: nil, user_properties: nil, request_options: {})
      #
      # @param token [String] The token for your Ours Privacy Source. You can find this in the Ours dashboard.
      #
      # @param event [String] The name of the event you're tracking. This must be whitelisted in the Ours dash
      #
      # @param default_properties [OursprivacyIngest::Models::TrackEventParams::DefaultProperties, nil] These properties are used throughout the Ours app to pass known values onto dest
      #
      # @param distinct_id [String, nil] A unique identifier for the event. This helps prevent duplicate events.
      #
      # @param email [String, nil] The email address of a user. We will associate this event with the user or creat
      #
      # @param event_properties [Hash{Symbol=>Object, nil}, nil] Any additional event properties you want to pass along.
      #
      # @param external_id [String, nil] The externalId (the ID in your system) of a user. We will associate this event w
      #
      # @param time [Float, nil] The time at which the event occurred in milliseconds since UTC epoch. The time m
      #
      # @param user_id [String, nil] The Ours user id stored in local storage and cookies on your web properties. If
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
