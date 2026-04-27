# frozen_string_literal: true

module OursprivacyIngest
  module Resources
    class Visitor
      # Some parameter documentations has been truncated, see
      # {OursprivacyIngest::Models::VisitorUpsertParams} for more details.
      #
      # Define visitor properties on an existing visitor or create a new visitor. This
      # fires a $identify event, making the call visible in the event stream. For
      # top-level visitor properties: null clears the existing value, while undefined,
      # omitted fields, and empty strings are ignored. For entries inside
      # custom_properties: null, undefined, and empty strings are all ignored
      # (custom_properties use merge semantics). See
      # https://docs.oursprivacy.com/docs/data-types for details and common pitfalls.
      #
      # @overload upsert(token:, user_properties:, default_properties: nil, email: nil, external_id: nil, identity_context: nil, user_id: nil, request_options: {})
      #
      # @param token [String] The token for your Source. You can find this in the dashboard.
      #
      # @param user_properties [OursprivacyIngest::Models::VisitorUpsertParams::UserProperties] User properties to associate with this user. The existing user properties will b
      #
      # @param default_properties [OursprivacyIngest::Models::VisitorUpsertParams::DefaultProperties, nil] These properties are used throughout the Ours app to pass known values onto dest
      #
      # @param email [String, nil] The email address of a user. We will associate this event with the user or creat
      #
      # @param external_id [String, nil] The externalId (the ID in your system) of a user. We will associate this event w
      #
      # @param identity_context [OursprivacyIngest::Models::VisitorUpsertParams::IdentityContext, nil] End-user network context for server-side calls. Required for probabilistic ident
      #
      # @param user_id [String, nil] The Ours user id stored in local storage and cookies on your web properties. If
      #
      # @param request_options [OursprivacyIngest::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [OursprivacyIngest::Models::VisitorUpsertResponse]
      #
      # @see OursprivacyIngest::Models::VisitorUpsertParams
      def upsert(params)
        parsed, options = OursprivacyIngest::VisitorUpsertParams.dump_request(params)
        path = @client.base_url_overridden? ? "identify" : "https://api.oursprivacy.com/api/v1/identify"
        @client.request(
          method: :post,
          path: path,
          body: parsed,
          model: OursprivacyIngest::Models::VisitorUpsertResponse,
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
