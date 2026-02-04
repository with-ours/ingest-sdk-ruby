# typed: strong

module OursprivacyIngest
  module Resources
    class Visitor
      # Define visitor properties on an existing visitor or create a new visitor. Note:
      # This does not fire an event. If you want to fire an event, use the track method
      # and include properties for the visitor.
      sig do
        params(
          token: String,
          user_properties:
            OursprivacyIngest::VisitorUpsertParams::UserProperties::OrHash,
          default_properties:
            T.nilable(
              OursprivacyIngest::VisitorUpsertParams::DefaultProperties::OrHash
            ),
          email: T.nilable(String),
          external_id: T.nilable(String),
          user_id: T.nilable(String),
          request_options: OursprivacyIngest::RequestOptions::OrHash
        ).returns(OursprivacyIngest::Models::VisitorUpsertResponse)
      end
      def upsert(
        # The token for your Source. You can find this in the dashboard.
        token:,
        # User properties to associate with this user. The existing user properties will
        # be updated. And all future events will have these properties associated with
        # them.
        user_properties:,
        # These properties are used throughout the Ours app to pass known values onto
        # destinations
        default_properties: nil,
        # The email address of a user. We will associate this event with the user or
        # create a user. Used for lookup if externalId and userId are not included in the
        # request.
        email: nil,
        # The externalId (the ID in your system) of a user. We will associate this event
        # with the user or create a user. If included in the request, email lookup is
        # ignored.
        external_id: nil,
        # The Ours user id stored in local storage and cookies on your web properties. If
        # userId is included in the request, we do not lookup the user by email or
        # externalId.
        user_id: nil,
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
