# typed: strong

module OursprivacyIngest
  module Resources
    class Visitor
      # Define visitor properties on an existing visitor or create a new visitor. This
      # fires a $identify event, making the call visible in the event stream. For
      # top-level visitor properties: null clears the existing value, while undefined,
      # omitted fields, and empty strings are ignored. For entries inside
      # custom_properties: null, undefined, and empty strings are all ignored
      # (custom_properties use merge semantics). See
      # https://docs.oursprivacy.com/docs/data-types for details and common pitfalls.
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
          identity_context:
            T.nilable(
              OursprivacyIngest::VisitorUpsertParams::IdentityContext::OrHash
            ),
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
        # End-user network context for server-side calls. Required for probabilistic
        # identity resolution when the caller is a backend server rather than an end-user
        # browser.
        identity_context: nil,
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
