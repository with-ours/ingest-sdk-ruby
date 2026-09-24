# typed: strong

module OursprivacyIngest
  module Resources
    class Visitor
      # Set or update properties on an existing visitor, or create a new visitor if no
      # match is found. This fires a $identify event, making the call visible in the
      # event stream. Identity resolution runs in priority order: userId (direct, no
      # lookup) → externalId → email → userProperties.phone_number. Each lookup runs
      # only if earlier identifiers did not resolve a visitor. Phone matching ignores
      # common formatting and an international + or 00 prefix, but does not infer a
      # country code. When a visitor is found, their Ours Visitor ID is used going
      # forward so all future events are attached to the same profile. For top-level
      # visitor properties: null clears the existing value, while undefined, omitted
      # fields, and empty strings are ignored. For entries inside custom_properties:
      # null, undefined, and empty strings are all ignored (custom_properties use merge
      # semantics). See https://docs.oursprivacy.com/docs/data-types for details and
      # common pitfalls.
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
        # The email address of a user. When userId is absent and externalId does not
        # resolve a visitor, we search your account for a visitor with this email. If no
        # match is found, we try userProperties.phone_number before creating a new
        # visitor.
        email: nil,
        # Your system's unique identifier for this user. When userId is absent, we search
        # your account for an existing visitor with this externalId. If no match is found,
        # we try email and then userProperties.phone_number before creating a new visitor.
        # If you also have the userId from cookies or local storage, send both — it
        # removes the lookup round-trip.
        external_id: nil,
        # End-user network context for server-side calls. Required for probabilistic
        # identity resolution when the caller is a backend server rather than an end-user
        # browser.
        identity_context: nil,
        # The Ours Visitor ID stored in local storage and cookies on your web properties.
        # When present, this is used directly — no lookup by externalId, email, or phone
        # is performed. If you have both a userId and an externalId, send both so the
        # event is attached to the right visitor without any lookup overhead.
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
