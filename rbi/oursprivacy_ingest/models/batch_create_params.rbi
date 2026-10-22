# typed: strong

module OursprivacyIngest
  module Models
    class BatchCreateParams < OursprivacyIngest::Internal::Type::BaseModel
      extend OursprivacyIngest::Internal::Type::RequestParameters::Converter
      include OursprivacyIngest::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            OursprivacyIngest::BatchCreateParams,
            OursprivacyIngest::Internal::AnyHash
          )
        end

      # The token for your Source. You can find this in the dashboard. Leading and
      # trailing whitespace is removed before validation.
      sig { returns(String) }
      attr_accessor :token

      # A list of `/track`-shaped events to validate and enqueue together.
      sig { returns(T::Array[OursprivacyIngest::BatchCreateParams::Event]) }
      attr_accessor :events

      sig do
        params(
          token: String,
          events: T::Array[OursprivacyIngest::BatchCreateParams::Event::OrHash],
          request_options: OursprivacyIngest::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The token for your Source. You can find this in the dashboard. Leading and
        # trailing whitespace is removed before validation.
        token:,
        # A list of `/track`-shaped events to validate and enqueue together.
        events:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            token: String,
            events: T::Array[OursprivacyIngest::BatchCreateParams::Event],
            request_options: OursprivacyIngest::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Event < OursprivacyIngest::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              OursprivacyIngest::BatchCreateParams::Event,
              OursprivacyIngest::Internal::AnyHash
            )
          end

        # A unique identifier for this event used for deduplication. Highly recommended —
        # if omitted, Ours will generate one for you, but supplying your own gives you
        # stronger idempotency guarantees (e.g. a Stripe payment intent ID or your
        # internal order ID). Leading and trailing whitespace is removed before
        # validation.
        sig { returns(String) }
        attr_accessor :distinct_id

        # The name of the event you're tracking. This must be whitelisted in the Ours
        # dashboard. Leading and trailing whitespace is removed before validation.
        sig { returns(String) }
        attr_accessor :event

        # These properties are used throughout the Ours app to pass known values onto
        # destinations
        sig do
          returns(
            T.nilable(
              OursprivacyIngest::BatchCreateParams::Event::DefaultProperties
            )
          )
        end
        attr_reader :default_properties

        sig do
          params(
            default_properties:
              T.nilable(
                OursprivacyIngest::BatchCreateParams::Event::DefaultProperties::OrHash
              )
          ).void
        end
        attr_writer :default_properties

        # The email address of a user. When userId is absent and externalId does not
        # resolve a visitor, we search your account for a visitor with this email. If no
        # match is found, we try userProperties.phone_number before creating a new
        # visitor. Leading and trailing whitespace is removed before validation.
        sig { returns(T.nilable(String)) }
        attr_accessor :email

        # Any additional event properties you want to pass along. Use at most 200 nonempty
        # property keys and five object levels. Array contents do not count toward the
        # object-depth limit. Empty keys are removed recursively, arrays are truncated to
        # 250 entries, and top-level numbers outside the safe integer range become
        # strings. After normalization, the serialized JSON must be shorter than 1,048,576
        # UTF-16 code units.
        sig do
          returns(
            T.nilable(
              T::Hash[
                Symbol,
                T.nilable(
                  OursprivacyIngest::BatchCreateParams::Event::EventProperty::Variants
                )
              ]
            )
          )
        end
        attr_accessor :event_properties

        # Your system's unique identifier for this user. When userId is absent, we search
        # your account for an existing visitor with this externalId. If no match is found,
        # we try email and then userProperties.phone_number before creating a new visitor.
        # If you also have the userId from cookies or local storage, send both — it
        # removes the lookup round-trip. Non-string input is converted to text before
        # validation; clients should send a string. Leading and trailing whitespace is
        # removed before validation.
        sig { returns(T.nilable(String)) }
        attr_accessor :external_id

        # End-user network context for server-side calls. Required for probabilistic
        # identity resolution when the caller is a backend server rather than an end-user
        # browser.
        sig do
          returns(
            T.nilable(
              OursprivacyIngest::BatchCreateParams::Event::IdentityContext
            )
          )
        end
        attr_reader :identity_context

        sig do
          params(
            identity_context:
              T.nilable(
                OursprivacyIngest::BatchCreateParams::Event::IdentityContext::OrHash
              )
          ).void
        end
        attr_writer :identity_context

        # The time at which the event occurred in milliseconds since UTC epoch. The time
        # must be in the past and within the last 7 days.
        sig { returns(T.nilable(Float)) }
        attr_accessor :time

        # The Ours Visitor ID stored in local storage and cookies on your web properties.
        # When present, this is used directly — no lookup by externalId, email, or phone
        # is performed. If you have both a userId and an externalId, send both so the
        # event is attached to the right visitor without any lookup overhead. Leading and
        # trailing whitespace is removed before validation.
        sig { returns(T.nilable(String)) }
        attr_accessor :user_id

        # Properties to set on the visitor. (optional) You can also update these
        # properties via the identify endpoint.
        sig do
          returns(
            T.nilable(
              OursprivacyIngest::BatchCreateParams::Event::UserProperties
            )
          )
        end
        attr_reader :user_properties

        sig do
          params(
            user_properties:
              T.nilable(
                OursprivacyIngest::BatchCreateParams::Event::UserProperties::OrHash
              )
          ).void
        end
        attr_writer :user_properties

        sig do
          params(
            distinct_id: String,
            event: String,
            default_properties:
              T.nilable(
                OursprivacyIngest::BatchCreateParams::Event::DefaultProperties::OrHash
              ),
            email: T.nilable(String),
            event_properties:
              T.nilable(
                T::Hash[
                  Symbol,
                  T.nilable(
                    OursprivacyIngest::BatchCreateParams::Event::EventProperty::Variants
                  )
                ]
              ),
            external_id: T.nilable(String),
            identity_context:
              T.nilable(
                OursprivacyIngest::BatchCreateParams::Event::IdentityContext::OrHash
              ),
            time: T.nilable(Float),
            user_id: T.nilable(String),
            user_properties:
              T.nilable(
                OursprivacyIngest::BatchCreateParams::Event::UserProperties::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # A unique identifier for this event used for deduplication. Highly recommended —
          # if omitted, Ours will generate one for you, but supplying your own gives you
          # stronger idempotency guarantees (e.g. a Stripe payment intent ID or your
          # internal order ID). Leading and trailing whitespace is removed before
          # validation.
          distinct_id:,
          # The name of the event you're tracking. This must be whitelisted in the Ours
          # dashboard. Leading and trailing whitespace is removed before validation.
          event:,
          # These properties are used throughout the Ours app to pass known values onto
          # destinations
          default_properties: nil,
          # The email address of a user. When userId is absent and externalId does not
          # resolve a visitor, we search your account for a visitor with this email. If no
          # match is found, we try userProperties.phone_number before creating a new
          # visitor. Leading and trailing whitespace is removed before validation.
          email: nil,
          # Any additional event properties you want to pass along. Use at most 200 nonempty
          # property keys and five object levels. Array contents do not count toward the
          # object-depth limit. Empty keys are removed recursively, arrays are truncated to
          # 250 entries, and top-level numbers outside the safe integer range become
          # strings. After normalization, the serialized JSON must be shorter than 1,048,576
          # UTF-16 code units.
          event_properties: nil,
          # Your system's unique identifier for this user. When userId is absent, we search
          # your account for an existing visitor with this externalId. If no match is found,
          # we try email and then userProperties.phone_number before creating a new visitor.
          # If you also have the userId from cookies or local storage, send both — it
          # removes the lookup round-trip. Non-string input is converted to text before
          # validation; clients should send a string. Leading and trailing whitespace is
          # removed before validation.
          external_id: nil,
          # End-user network context for server-side calls. Required for probabilistic
          # identity resolution when the caller is a backend server rather than an end-user
          # browser.
          identity_context: nil,
          # The time at which the event occurred in milliseconds since UTC epoch. The time
          # must be in the past and within the last 7 days.
          time: nil,
          # The Ours Visitor ID stored in local storage and cookies on your web properties.
          # When present, this is used directly — no lookup by externalId, email, or phone
          # is performed. If you have both a userId and an externalId, send both so the
          # event is attached to the right visitor without any lookup overhead. Leading and
          # trailing whitespace is removed before validation.
          user_id: nil,
          # Properties to set on the visitor. (optional) You can also update these
          # properties via the identify endpoint.
          user_properties: nil
        )
        end

        sig do
          override.returns(
            {
              distinct_id: String,
              event: String,
              default_properties:
                T.nilable(
                  OursprivacyIngest::BatchCreateParams::Event::DefaultProperties
                ),
              email: T.nilable(String),
              event_properties:
                T.nilable(
                  T::Hash[
                    Symbol,
                    T.nilable(
                      OursprivacyIngest::BatchCreateParams::Event::EventProperty::Variants
                    )
                  ]
                ),
              external_id: T.nilable(String),
              identity_context:
                T.nilable(
                  OursprivacyIngest::BatchCreateParams::Event::IdentityContext
                ),
              time: T.nilable(Float),
              user_id: T.nilable(String),
              user_properties:
                T.nilable(
                  OursprivacyIngest::BatchCreateParams::Event::UserProperties
                )
            }
          )
        end
        def to_hash
        end

        class DefaultProperties < OursprivacyIngest::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                OursprivacyIngest::BatchCreateParams::Event::DefaultProperties,
                OursprivacyIngest::Internal::AnyHash
              )
            end

          # The Everflow affiliate Click (Transaction) ID, captured from the
          # `_ef_transaction_id` URL parameter. Ex: ef_click_abc123 Leading and trailing
          # whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :_ef_transaction_id

          # The active time in milliseconds that the user had this tab active
          sig { returns(T.nilable(Float)) }
          attr_accessor :active_duration

          # The ad id for detected in the session. This is set by the web sdk automatically.
          # Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :ad_id

          # The Admitad (Mitgo) affiliate Click ID. Ex: admitad_uid_abc123 Leading and
          # trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :admitad_uid

          # The adset id for detected in the session. This is set by the web sdk
          # automatically. Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :adset_id

          # The AppLovin alart query parameter. Ex: alart123 Leading and trailing whitespace
          # is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :alart

          # The AppLovin aleid query parameter. Ex: aleid123 Leading and trailing whitespace
          # is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :aleid

          # The AppLovin pixel cookie value (\_axwrt). Web-only. Leading and trailing
          # whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :axwrt

          # The Basis DSP Click ID. Ex: basis_cid123 Leading and trailing whitespace is
          # removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :basis_cid

          # The Beeswax (FreeWheel Buyer Cloud) auction ID, captured from the
          # `{{AUCTION_ID}}` macro on creative click URLs. Ex: bx-auc-abc123 Leading and
          # trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :beeswax_auction_id

          # The language of the browser. Ex: en-US Leading and trailing whitespace is
          # removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :browser_language

          # The name of the browser. Ex: Chrome Leading and trailing whitespace is removed
          # before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :browser_name

          # The version of the browser. Ex: 114.0 Leading and trailing whitespace is removed
          # before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :browser_version

          # The campaign id for detected in the session. This is set by the web sdk
          # automatically. Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :campaign_id

          # The Click ID. Ex: clickid123 Leading and trailing whitespace is removed before
          # validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :clickid

          # The Generic Click ID. Ex: clid123 Leading and trailing whitespace is removed
          # before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :clid

          # The architecture of the CPU. Ex: x64 Leading and trailing whitespace is removed
          # before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :cpu_architecture

          # The full url (including query params) of the current page Leading and trailing
          # whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :current_url

          # The DoubleClick Click ID. Ex: dclid123 Leading and trailing whitespace is
          # removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :dclid

          # The model of the device. Ex: iPhone 13 Leading and trailing whitespace is
          # removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :device_model

          # The type of device the user is using. Ex: mobile Leading and trailing whitespace
          # is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :device_type

          # The vendor of the device. Ex: Apple Leading and trailing whitespace is removed
          # before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :device_vendor

          # The time in milliseconds since the page was loaded // script was loaded
          sig { returns(T.nilable(Float)) }
          attr_accessor :duration

          # The browsers encoding. Ex: UTF-8 Leading and trailing whitespace is removed
          # before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :encoding

          # The name of the browser engine. Ex: Blink Leading and trailing whitespace is
          # removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :engine_name

          # The version of the browser engine. Ex: 114.0 Leading and trailing whitespace is
          # removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :engine_version

          # The Pinterest Click ID. Ex: epik456 Leading and trailing whitespace is removed
          # before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :epik

          # Facebook Click ID with prefix format for Conversions API tracking. Ex:
          # fb.1.1554763741205.AbCdEfGhIjKlMnOpQrStUvWxYz1234567890 Leading and trailing
          # whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :fbc

          # Raw Facebook Click ID query parameter without prefix from ad clicks. Ex:
          # AbCdEfGhIjKlMnOpQrStUvWxYz1234567890 Leading and trailing whitespace is removed
          # before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :fbclid

          # Facebook Browser ID parameter for identifying browsers and attributing events.
          # Ex: fb.1.1554763741205.1098115397 Leading and trailing whitespace is removed
          # before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :fbp

          # Deprecated
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :fv

          # The Google Ad Source. Ex: google Leading and trailing whitespace is removed
          # before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :gad_source

          # The Google Braid ID. Ex: gbraid123 Leading and trailing whitespace is removed
          # before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :gbraid

          # The Google Click ID. Ex: gclid123 Leading and trailing whitespace is removed
          # before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :gclid

          # The Gravity attribution ID, captured from the `graid` URL parameter on the
          # landing page. Gravity resolves it to the campaign, publisher, and ad IDs
          # server-side. Ex: graid-abc123 Leading and trailing whitespace is removed before
          # validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :graid

          # The Gravity click ID, captured from the `grclid` URL parameter that Gravity
          # (trygravity.com) appends to ad click-through URLs on the landing page. Ex:
          # grclid-abc123 Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :grclid

          # The host of the current page. Ex: example.com Leading and trailing whitespace is
          # removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :host

          # Whether the user is in an iframe. Ex: true
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :iframe

          # The Impact Click ID reference. Ex: im_ref123 Leading and trailing whitespace is
          # removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :im_ref

          # The IP address of the user. Ex: 127.0.0.1 Leading and trailing whitespace is
          # removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :ip

          # The Impact Click ID. Ex: irclickid123 Leading and trailing whitespace is removed
          # before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :irclickid

          # Any JSON value: string, number, boolean, array, object, or null.
          sig do
            returns(
              T.nilable(
                OursprivacyIngest::BatchCreateParams::Event::DefaultProperties::IsBot::Variants
              )
            )
          end
          attr_accessor :is_bot

          # The LinkedIn Click ID. Ex: li_fat_id123 Leading and trailing whitespace is
          # removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :li_fat_id

          # The Microsoft Click ID. Ex: msclkid123 Leading and trailing whitespace is
          # removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :msclkid

          # The NextDoor Click ID. Ex: ndclid123 Leading and trailing whitespace is removed
          # before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :ndclid

          # Deprecated
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :new_s

          # The Outbrain click ID, captured from the `ob_click_id` URL parameter (Outbrain
          # `{{ob_click_id}}` macro) on the landing page. Ex: ob_click_abc123 Leading and
          # trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :ob_click_id

          # The OpenAI Ads privacy-preserving reference, captured from the `oppref` URL
          # parameter on landing pages (the OpenAI Pixel also stores it in a `__oppref`
          # cookie). Sent to OpenAI Ads on Conversions API events for attribution. Ex:
          # oppref_abc Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :oppref

          # The name of the operating system. Ex: Windows Leading and trailing whitespace is
          # removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :os_name

          # The version of the operating system. Ex: 10.0 Leading and trailing whitespace is
          # removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :os_version

          # A random set of numbers for the page load
          sig { returns(T.nilable(Float)) }
          attr_accessor :page_hash

          # The pathname of the current page. Ex: /home Leading and trailing whitespace is
          # removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :pathname

          # The Quora Click ID. Ex: qclid123 Leading and trailing whitespace is removed
          # before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :qclid

          # The Reddit Click ID. Ex: rdt_cid123 Leading and trailing whitespace is removed
          # before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :rdt_cid

          # The time the event was received by an Ours server in ISO format
          sig { returns(T.nilable(String)) }
          attr_accessor :received_at

          # The referrer URL of the current page Leading and trailing whitespace is removed
          # before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :referrer

          # The referring domain of the current page Leading and trailing whitespace is
          # removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :referring_domain

          # The StackAdapt Tracking ID. Ex: sacid123 Leading and trailing whitespace is
          # removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :sacid

          # The SnapChat Click ID. Ex: sccid123 Leading and trailing whitespace is removed
          # before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :sccid

          # The height of the screen. Ex: 1080
          sig { returns(T.nilable(Float)) }
          attr_accessor :screen_height

          # The width of the screen. Ex: 1920
          sig { returns(T.nilable(Float)) }
          attr_accessor :screen_width

          # The number of sessions the user has had. Ex: 3
          sig { returns(T.nilable(Float)) }
          attr_accessor :session_count

          # The session ID as assigned automatically by the web SDK. This is required for
          # session replay Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :sid

          # Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :sr

          # The title of the current page Leading and trailing whitespace is removed before
          # validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :title

          # The TikTok Click ID. Ex: ttclid123 Leading and trailing whitespace is removed
          # before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :ttclid

          # The Trade Desk impression ID, captured from a configured ttd_impression_id URL
          # parameter using the %%TTD_IMPRESSIONID%% creative macro. Sent as imp on
          # conversions. Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :ttd_impression_id

          # The Twitter Click ID. Ex: twclid123 Leading and trailing whitespace is removed
          # before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :twclid

          # User agent as a full list of strings. Leading and trailing whitespace is removed
          # before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :uafvl

          # The user agent of the browser Leading and trailing whitespace is removed before
          # validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :user_agent

          # The UTM Campaign. The web SDK automatically captures this from the query params.
          # Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :utm_campaign

          # The UTM Content. The web SDK automatically captures this from the query params.
          # Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :utm_content

          # The UTM Medium. The web SDK automatically captures this from the query params.
          # Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :utm_medium

          # The UTM Name. The web SDK automatically captures this from the query params.
          # Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :utm_name

          # The UTM Source. The web SDK automatically captures this from the query params.
          # Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :utm_source

          # The UTM Term. The web SDK automatically captures this from the query params.
          # Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :utm_term

          # The SDK version (e.g., web SDK or ingest-sdk-\* via generated SDK headers)
          # Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :version

          # The Viant (Adelphic) Click ID, captured from the `viant_click_id` URL parameter
          # (Viant `${ADELPHIC_CLICKID}` macro). Sent as `xid` on Viant postbacks. Ex:
          # viant_click_abc123 Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :viant_click_id

          # The Viant (Adelphic) Impression ID, captured from the `viant_impression_id` URL
          # parameter (Viant `${ADELPHIC_IMPRESSIONID}` macro). Sent as `imp_id` on Viant
          # postbacks for post-view attribution. Ex: viant_imp_abc123 Leading and trailing
          # whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :viant_impression_id

          # The WBRAID Identifier. The web SDK automatically captures this from the query
          # params. Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :wbraid

          # Whether the user is in a webview. Ex: true
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :webview

          # The Yelp Click ID from the landing URL, sent unchanged and unhashed.
          sig { returns(T.nilable(String)) }
          attr_accessor :ylpcid

          # These properties are used throughout the Ours app to pass known values onto
          # destinations
          sig do
            params(
              _ef_transaction_id: T.nilable(String),
              active_duration: T.nilable(Float),
              ad_id: T.nilable(String),
              admitad_uid: T.nilable(String),
              adset_id: T.nilable(String),
              alart: T.nilable(String),
              aleid: T.nilable(String),
              axwrt: T.nilable(String),
              basis_cid: T.nilable(String),
              beeswax_auction_id: T.nilable(String),
              browser_language: T.nilable(String),
              browser_name: T.nilable(String),
              browser_version: T.nilable(String),
              campaign_id: T.nilable(String),
              clickid: T.nilable(String),
              clid: T.nilable(String),
              cpu_architecture: T.nilable(String),
              current_url: T.nilable(String),
              dclid: T.nilable(String),
              device_model: T.nilable(String),
              device_type: T.nilable(String),
              device_vendor: T.nilable(String),
              duration: T.nilable(Float),
              encoding: T.nilable(String),
              engine_name: T.nilable(String),
              engine_version: T.nilable(String),
              epik: T.nilable(String),
              fbc: T.nilable(String),
              fbclid: T.nilable(String),
              fbp: T.nilable(String),
              fv: T.nilable(T::Boolean),
              gad_source: T.nilable(String),
              gbraid: T.nilable(String),
              gclid: T.nilable(String),
              graid: T.nilable(String),
              grclid: T.nilable(String),
              host: T.nilable(String),
              iframe: T.nilable(T::Boolean),
              im_ref: T.nilable(String),
              ip: T.nilable(String),
              irclickid: T.nilable(String),
              is_bot:
                T.nilable(
                  OursprivacyIngest::BatchCreateParams::Event::DefaultProperties::IsBot::Variants
                ),
              li_fat_id: T.nilable(String),
              msclkid: T.nilable(String),
              ndclid: T.nilable(String),
              new_s: T.nilable(T::Boolean),
              ob_click_id: T.nilable(String),
              oppref: T.nilable(String),
              os_name: T.nilable(String),
              os_version: T.nilable(String),
              page_hash: T.nilable(Float),
              pathname: T.nilable(String),
              qclid: T.nilable(String),
              rdt_cid: T.nilable(String),
              received_at: T.nilable(String),
              referrer: T.nilable(String),
              referring_domain: T.nilable(String),
              sacid: T.nilable(String),
              sccid: T.nilable(String),
              screen_height: T.nilable(Float),
              screen_width: T.nilable(Float),
              session_count: T.nilable(Float),
              sid: T.nilable(String),
              sr: T.nilable(String),
              title: T.nilable(String),
              ttclid: T.nilable(String),
              ttd_impression_id: T.nilable(String),
              twclid: T.nilable(String),
              uafvl: T.nilable(String),
              user_agent: T.nilable(String),
              utm_campaign: T.nilable(String),
              utm_content: T.nilable(String),
              utm_medium: T.nilable(String),
              utm_name: T.nilable(String),
              utm_source: T.nilable(String),
              utm_term: T.nilable(String),
              version: T.nilable(String),
              viant_click_id: T.nilable(String),
              viant_impression_id: T.nilable(String),
              wbraid: T.nilable(String),
              webview: T.nilable(T::Boolean),
              ylpcid: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # The Everflow affiliate Click (Transaction) ID, captured from the
            # `_ef_transaction_id` URL parameter. Ex: ef_click_abc123 Leading and trailing
            # whitespace is removed before validation.
            _ef_transaction_id: nil,
            # The active time in milliseconds that the user had this tab active
            active_duration: nil,
            # The ad id for detected in the session. This is set by the web sdk automatically.
            # Leading and trailing whitespace is removed before validation.
            ad_id: nil,
            # The Admitad (Mitgo) affiliate Click ID. Ex: admitad_uid_abc123 Leading and
            # trailing whitespace is removed before validation.
            admitad_uid: nil,
            # The adset id for detected in the session. This is set by the web sdk
            # automatically. Leading and trailing whitespace is removed before validation.
            adset_id: nil,
            # The AppLovin alart query parameter. Ex: alart123 Leading and trailing whitespace
            # is removed before validation.
            alart: nil,
            # The AppLovin aleid query parameter. Ex: aleid123 Leading and trailing whitespace
            # is removed before validation.
            aleid: nil,
            # The AppLovin pixel cookie value (\_axwrt). Web-only. Leading and trailing
            # whitespace is removed before validation.
            axwrt: nil,
            # The Basis DSP Click ID. Ex: basis_cid123 Leading and trailing whitespace is
            # removed before validation.
            basis_cid: nil,
            # The Beeswax (FreeWheel Buyer Cloud) auction ID, captured from the
            # `{{AUCTION_ID}}` macro on creative click URLs. Ex: bx-auc-abc123 Leading and
            # trailing whitespace is removed before validation.
            beeswax_auction_id: nil,
            # The language of the browser. Ex: en-US Leading and trailing whitespace is
            # removed before validation.
            browser_language: nil,
            # The name of the browser. Ex: Chrome Leading and trailing whitespace is removed
            # before validation.
            browser_name: nil,
            # The version of the browser. Ex: 114.0 Leading and trailing whitespace is removed
            # before validation.
            browser_version: nil,
            # The campaign id for detected in the session. This is set by the web sdk
            # automatically. Leading and trailing whitespace is removed before validation.
            campaign_id: nil,
            # The Click ID. Ex: clickid123 Leading and trailing whitespace is removed before
            # validation.
            clickid: nil,
            # The Generic Click ID. Ex: clid123 Leading and trailing whitespace is removed
            # before validation.
            clid: nil,
            # The architecture of the CPU. Ex: x64 Leading and trailing whitespace is removed
            # before validation.
            cpu_architecture: nil,
            # The full url (including query params) of the current page Leading and trailing
            # whitespace is removed before validation.
            current_url: nil,
            # The DoubleClick Click ID. Ex: dclid123 Leading and trailing whitespace is
            # removed before validation.
            dclid: nil,
            # The model of the device. Ex: iPhone 13 Leading and trailing whitespace is
            # removed before validation.
            device_model: nil,
            # The type of device the user is using. Ex: mobile Leading and trailing whitespace
            # is removed before validation.
            device_type: nil,
            # The vendor of the device. Ex: Apple Leading and trailing whitespace is removed
            # before validation.
            device_vendor: nil,
            # The time in milliseconds since the page was loaded // script was loaded
            duration: nil,
            # The browsers encoding. Ex: UTF-8 Leading and trailing whitespace is removed
            # before validation.
            encoding: nil,
            # The name of the browser engine. Ex: Blink Leading and trailing whitespace is
            # removed before validation.
            engine_name: nil,
            # The version of the browser engine. Ex: 114.0 Leading and trailing whitespace is
            # removed before validation.
            engine_version: nil,
            # The Pinterest Click ID. Ex: epik456 Leading and trailing whitespace is removed
            # before validation.
            epik: nil,
            # Facebook Click ID with prefix format for Conversions API tracking. Ex:
            # fb.1.1554763741205.AbCdEfGhIjKlMnOpQrStUvWxYz1234567890 Leading and trailing
            # whitespace is removed before validation.
            fbc: nil,
            # Raw Facebook Click ID query parameter without prefix from ad clicks. Ex:
            # AbCdEfGhIjKlMnOpQrStUvWxYz1234567890 Leading and trailing whitespace is removed
            # before validation.
            fbclid: nil,
            # Facebook Browser ID parameter for identifying browsers and attributing events.
            # Ex: fb.1.1554763741205.1098115397 Leading and trailing whitespace is removed
            # before validation.
            fbp: nil,
            # Deprecated
            fv: nil,
            # The Google Ad Source. Ex: google Leading and trailing whitespace is removed
            # before validation.
            gad_source: nil,
            # The Google Braid ID. Ex: gbraid123 Leading and trailing whitespace is removed
            # before validation.
            gbraid: nil,
            # The Google Click ID. Ex: gclid123 Leading and trailing whitespace is removed
            # before validation.
            gclid: nil,
            # The Gravity attribution ID, captured from the `graid` URL parameter on the
            # landing page. Gravity resolves it to the campaign, publisher, and ad IDs
            # server-side. Ex: graid-abc123 Leading and trailing whitespace is removed before
            # validation.
            graid: nil,
            # The Gravity click ID, captured from the `grclid` URL parameter that Gravity
            # (trygravity.com) appends to ad click-through URLs on the landing page. Ex:
            # grclid-abc123 Leading and trailing whitespace is removed before validation.
            grclid: nil,
            # The host of the current page. Ex: example.com Leading and trailing whitespace is
            # removed before validation.
            host: nil,
            # Whether the user is in an iframe. Ex: true
            iframe: nil,
            # The Impact Click ID reference. Ex: im_ref123 Leading and trailing whitespace is
            # removed before validation.
            im_ref: nil,
            # The IP address of the user. Ex: 127.0.0.1 Leading and trailing whitespace is
            # removed before validation.
            ip: nil,
            # The Impact Click ID. Ex: irclickid123 Leading and trailing whitespace is removed
            # before validation.
            irclickid: nil,
            # Any JSON value: string, number, boolean, array, object, or null.
            is_bot: nil,
            # The LinkedIn Click ID. Ex: li_fat_id123 Leading and trailing whitespace is
            # removed before validation.
            li_fat_id: nil,
            # The Microsoft Click ID. Ex: msclkid123 Leading and trailing whitespace is
            # removed before validation.
            msclkid: nil,
            # The NextDoor Click ID. Ex: ndclid123 Leading and trailing whitespace is removed
            # before validation.
            ndclid: nil,
            # Deprecated
            new_s: nil,
            # The Outbrain click ID, captured from the `ob_click_id` URL parameter (Outbrain
            # `{{ob_click_id}}` macro) on the landing page. Ex: ob_click_abc123 Leading and
            # trailing whitespace is removed before validation.
            ob_click_id: nil,
            # The OpenAI Ads privacy-preserving reference, captured from the `oppref` URL
            # parameter on landing pages (the OpenAI Pixel also stores it in a `__oppref`
            # cookie). Sent to OpenAI Ads on Conversions API events for attribution. Ex:
            # oppref_abc Leading and trailing whitespace is removed before validation.
            oppref: nil,
            # The name of the operating system. Ex: Windows Leading and trailing whitespace is
            # removed before validation.
            os_name: nil,
            # The version of the operating system. Ex: 10.0 Leading and trailing whitespace is
            # removed before validation.
            os_version: nil,
            # A random set of numbers for the page load
            page_hash: nil,
            # The pathname of the current page. Ex: /home Leading and trailing whitespace is
            # removed before validation.
            pathname: nil,
            # The Quora Click ID. Ex: qclid123 Leading and trailing whitespace is removed
            # before validation.
            qclid: nil,
            # The Reddit Click ID. Ex: rdt_cid123 Leading and trailing whitespace is removed
            # before validation.
            rdt_cid: nil,
            # The time the event was received by an Ours server in ISO format
            received_at: nil,
            # The referrer URL of the current page Leading and trailing whitespace is removed
            # before validation.
            referrer: nil,
            # The referring domain of the current page Leading and trailing whitespace is
            # removed before validation.
            referring_domain: nil,
            # The StackAdapt Tracking ID. Ex: sacid123 Leading and trailing whitespace is
            # removed before validation.
            sacid: nil,
            # The SnapChat Click ID. Ex: sccid123 Leading and trailing whitespace is removed
            # before validation.
            sccid: nil,
            # The height of the screen. Ex: 1080
            screen_height: nil,
            # The width of the screen. Ex: 1920
            screen_width: nil,
            # The number of sessions the user has had. Ex: 3
            session_count: nil,
            # The session ID as assigned automatically by the web SDK. This is required for
            # session replay Leading and trailing whitespace is removed before validation.
            sid: nil,
            # Leading and trailing whitespace is removed before validation.
            sr: nil,
            # The title of the current page Leading and trailing whitespace is removed before
            # validation.
            title: nil,
            # The TikTok Click ID. Ex: ttclid123 Leading and trailing whitespace is removed
            # before validation.
            ttclid: nil,
            # The Trade Desk impression ID, captured from a configured ttd_impression_id URL
            # parameter using the %%TTD_IMPRESSIONID%% creative macro. Sent as imp on
            # conversions. Leading and trailing whitespace is removed before validation.
            ttd_impression_id: nil,
            # The Twitter Click ID. Ex: twclid123 Leading and trailing whitespace is removed
            # before validation.
            twclid: nil,
            # User agent as a full list of strings. Leading and trailing whitespace is removed
            # before validation.
            uafvl: nil,
            # The user agent of the browser Leading and trailing whitespace is removed before
            # validation.
            user_agent: nil,
            # The UTM Campaign. The web SDK automatically captures this from the query params.
            # Leading and trailing whitespace is removed before validation.
            utm_campaign: nil,
            # The UTM Content. The web SDK automatically captures this from the query params.
            # Leading and trailing whitespace is removed before validation.
            utm_content: nil,
            # The UTM Medium. The web SDK automatically captures this from the query params.
            # Leading and trailing whitespace is removed before validation.
            utm_medium: nil,
            # The UTM Name. The web SDK automatically captures this from the query params.
            # Leading and trailing whitespace is removed before validation.
            utm_name: nil,
            # The UTM Source. The web SDK automatically captures this from the query params.
            # Leading and trailing whitespace is removed before validation.
            utm_source: nil,
            # The UTM Term. The web SDK automatically captures this from the query params.
            # Leading and trailing whitespace is removed before validation.
            utm_term: nil,
            # The SDK version (e.g., web SDK or ingest-sdk-\* via generated SDK headers)
            # Leading and trailing whitespace is removed before validation.
            version: nil,
            # The Viant (Adelphic) Click ID, captured from the `viant_click_id` URL parameter
            # (Viant `${ADELPHIC_CLICKID}` macro). Sent as `xid` on Viant postbacks. Ex:
            # viant_click_abc123 Leading and trailing whitespace is removed before validation.
            viant_click_id: nil,
            # The Viant (Adelphic) Impression ID, captured from the `viant_impression_id` URL
            # parameter (Viant `${ADELPHIC_IMPRESSIONID}` macro). Sent as `imp_id` on Viant
            # postbacks for post-view attribution. Ex: viant_imp_abc123 Leading and trailing
            # whitespace is removed before validation.
            viant_impression_id: nil,
            # The WBRAID Identifier. The web SDK automatically captures this from the query
            # params. Leading and trailing whitespace is removed before validation.
            wbraid: nil,
            # Whether the user is in a webview. Ex: true
            webview: nil,
            # The Yelp Click ID from the landing URL, sent unchanged and unhashed.
            ylpcid: nil
          )
          end

          sig do
            override.returns(
              {
                _ef_transaction_id: T.nilable(String),
                active_duration: T.nilable(Float),
                ad_id: T.nilable(String),
                admitad_uid: T.nilable(String),
                adset_id: T.nilable(String),
                alart: T.nilable(String),
                aleid: T.nilable(String),
                axwrt: T.nilable(String),
                basis_cid: T.nilable(String),
                beeswax_auction_id: T.nilable(String),
                browser_language: T.nilable(String),
                browser_name: T.nilable(String),
                browser_version: T.nilable(String),
                campaign_id: T.nilable(String),
                clickid: T.nilable(String),
                clid: T.nilable(String),
                cpu_architecture: T.nilable(String),
                current_url: T.nilable(String),
                dclid: T.nilable(String),
                device_model: T.nilable(String),
                device_type: T.nilable(String),
                device_vendor: T.nilable(String),
                duration: T.nilable(Float),
                encoding: T.nilable(String),
                engine_name: T.nilable(String),
                engine_version: T.nilable(String),
                epik: T.nilable(String),
                fbc: T.nilable(String),
                fbclid: T.nilable(String),
                fbp: T.nilable(String),
                fv: T.nilable(T::Boolean),
                gad_source: T.nilable(String),
                gbraid: T.nilable(String),
                gclid: T.nilable(String),
                graid: T.nilable(String),
                grclid: T.nilable(String),
                host: T.nilable(String),
                iframe: T.nilable(T::Boolean),
                im_ref: T.nilable(String),
                ip: T.nilable(String),
                irclickid: T.nilable(String),
                is_bot:
                  T.nilable(
                    OursprivacyIngest::BatchCreateParams::Event::DefaultProperties::IsBot::Variants
                  ),
                li_fat_id: T.nilable(String),
                msclkid: T.nilable(String),
                ndclid: T.nilable(String),
                new_s: T.nilable(T::Boolean),
                ob_click_id: T.nilable(String),
                oppref: T.nilable(String),
                os_name: T.nilable(String),
                os_version: T.nilable(String),
                page_hash: T.nilable(Float),
                pathname: T.nilable(String),
                qclid: T.nilable(String),
                rdt_cid: T.nilable(String),
                received_at: T.nilable(String),
                referrer: T.nilable(String),
                referring_domain: T.nilable(String),
                sacid: T.nilable(String),
                sccid: T.nilable(String),
                screen_height: T.nilable(Float),
                screen_width: T.nilable(Float),
                session_count: T.nilable(Float),
                sid: T.nilable(String),
                sr: T.nilable(String),
                title: T.nilable(String),
                ttclid: T.nilable(String),
                ttd_impression_id: T.nilable(String),
                twclid: T.nilable(String),
                uafvl: T.nilable(String),
                user_agent: T.nilable(String),
                utm_campaign: T.nilable(String),
                utm_content: T.nilable(String),
                utm_medium: T.nilable(String),
                utm_name: T.nilable(String),
                utm_source: T.nilable(String),
                utm_term: T.nilable(String),
                version: T.nilable(String),
                viant_click_id: T.nilable(String),
                viant_impression_id: T.nilable(String),
                wbraid: T.nilable(String),
                webview: T.nilable(T::Boolean),
                ylpcid: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          # Any JSON value: string, number, boolean, array, object, or null.
          module IsBot
            extend OursprivacyIngest::Internal::Type::Union

            Variants =
              T.type_alias do
                T.nilable(
                  T.any(
                    String,
                    Float,
                    T::Boolean,
                    T::Array[T.anything],
                    T::Hash[Symbol, T.anything]
                  )
                )
              end

            sig do
              override.returns(
                T::Array[
                  OursprivacyIngest::BatchCreateParams::Event::DefaultProperties::IsBot::Variants
                ]
              )
            end
            def self.variants
            end

            UnionMember3Array =
              T.let(
                OursprivacyIngest::Internal::Type::ArrayOf[
                  OursprivacyIngest::Internal::Type::Unknown
                ],
                OursprivacyIngest::Internal::Type::Converter
              )

            UnionMember4Map =
              T.let(
                OursprivacyIngest::Internal::Type::HashOf[
                  OursprivacyIngest::Internal::Type::Unknown
                ],
                OursprivacyIngest::Internal::Type::Converter
              )
          end
        end

        module EventProperty
          extend OursprivacyIngest::Internal::Type::Union

          Variants =
            T.type_alias do
              T.nilable(
                T.any(
                  String,
                  Float,
                  T::Boolean,
                  T::Array[
                    T.nilable(
                      OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember3::Variants
                    )
                  ],
                  T::Hash[
                    Symbol,
                    T.nilable(
                      OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember4::Variants
                    )
                  ]
                )
              )
            end

          # Any JSON value: string, number, boolean, array, object, or null.
          module UnionMember3
            extend OursprivacyIngest::Internal::Type::Union

            Variants =
              T.type_alias do
                T.nilable(
                  T.any(
                    String,
                    Float,
                    T::Boolean,
                    T::Array[T.anything],
                    T::Hash[Symbol, T.anything]
                  )
                )
              end

            sig do
              override.returns(
                T::Array[
                  OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember3::Variants
                ]
              )
            end
            def self.variants
            end

            UnionMember3Array =
              T.let(
                OursprivacyIngest::Internal::Type::ArrayOf[
                  OursprivacyIngest::Internal::Type::Unknown
                ],
                OursprivacyIngest::Internal::Type::Converter
              )

            UnionMember4Map =
              T.let(
                OursprivacyIngest::Internal::Type::HashOf[
                  OursprivacyIngest::Internal::Type::Unknown
                ],
                OursprivacyIngest::Internal::Type::Converter
              )
          end

          module UnionMember4
            extend OursprivacyIngest::Internal::Type::Union

            Variants =
              T.type_alias do
                T.nilable(
                  T.any(
                    String,
                    Float,
                    T::Boolean,
                    T::Array[
                      T.nilable(
                        OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember4::UnionMember3::Variants
                      )
                    ],
                    T::Hash[
                      Symbol,
                      T.nilable(
                        OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember4::UnionMember4::Variants
                      )
                    ]
                  )
                )
              end

            # Any JSON value: string, number, boolean, array, object, or null.
            module UnionMember3
              extend OursprivacyIngest::Internal::Type::Union

              Variants =
                T.type_alias do
                  T.nilable(
                    T.any(
                      String,
                      Float,
                      T::Boolean,
                      T::Array[T.anything],
                      T::Hash[Symbol, T.anything]
                    )
                  )
                end

              sig do
                override.returns(
                  T::Array[
                    OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember4::UnionMember3::Variants
                  ]
                )
              end
              def self.variants
              end

              UnionMember3Array =
                T.let(
                  OursprivacyIngest::Internal::Type::ArrayOf[
                    OursprivacyIngest::Internal::Type::Unknown
                  ],
                  OursprivacyIngest::Internal::Type::Converter
                )

              UnionMember4Map =
                T.let(
                  OursprivacyIngest::Internal::Type::HashOf[
                    OursprivacyIngest::Internal::Type::Unknown
                  ],
                  OursprivacyIngest::Internal::Type::Converter
                )
            end

            module UnionMember4
              extend OursprivacyIngest::Internal::Type::Union

              Variants =
                T.type_alias do
                  T.nilable(
                    T.any(
                      String,
                      Float,
                      T::Boolean,
                      T::Array[
                        T.nilable(
                          OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember4::UnionMember4::UnionMember3::Variants
                        )
                      ],
                      T::Hash[
                        Symbol,
                        T.nilable(
                          OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember4::UnionMember4::UnionMember4::Variants
                        )
                      ]
                    )
                  )
                end

              # Any JSON value: string, number, boolean, array, object, or null.
              module UnionMember3
                extend OursprivacyIngest::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.nilable(
                      T.any(
                        String,
                        Float,
                        T::Boolean,
                        T::Array[T.anything],
                        T::Hash[Symbol, T.anything]
                      )
                    )
                  end

                sig do
                  override.returns(
                    T::Array[
                      OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember4::UnionMember4::UnionMember3::Variants
                    ]
                  )
                end
                def self.variants
                end

                UnionMember3Array =
                  T.let(
                    OursprivacyIngest::Internal::Type::ArrayOf[
                      OursprivacyIngest::Internal::Type::Unknown
                    ],
                    OursprivacyIngest::Internal::Type::Converter
                  )

                UnionMember4Map =
                  T.let(
                    OursprivacyIngest::Internal::Type::HashOf[
                      OursprivacyIngest::Internal::Type::Unknown
                    ],
                    OursprivacyIngest::Internal::Type::Converter
                  )
              end

              module UnionMember4
                extend OursprivacyIngest::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.nilable(
                      T.any(
                        String,
                        Float,
                        T::Boolean,
                        T::Array[
                          T.nilable(
                            OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember4::UnionMember4::UnionMember4::UnionMember3::Variants
                          )
                        ],
                        T::Hash[
                          Symbol,
                          T.nilable(
                            OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember4::UnionMember4::UnionMember4::UnionMember4::Variants
                          )
                        ]
                      )
                    )
                  end

                # Any JSON value: string, number, boolean, array, object, or null.
                module UnionMember3
                  extend OursprivacyIngest::Internal::Type::Union

                  Variants =
                    T.type_alias do
                      T.nilable(
                        T.any(
                          String,
                          Float,
                          T::Boolean,
                          T::Array[T.anything],
                          T::Hash[Symbol, T.anything]
                        )
                      )
                    end

                  sig do
                    override.returns(
                      T::Array[
                        OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember4::UnionMember4::UnionMember4::UnionMember3::Variants
                      ]
                    )
                  end
                  def self.variants
                  end

                  UnionMember3Array =
                    T.let(
                      OursprivacyIngest::Internal::Type::ArrayOf[
                        OursprivacyIngest::Internal::Type::Unknown
                      ],
                      OursprivacyIngest::Internal::Type::Converter
                    )

                  UnionMember4Map =
                    T.let(
                      OursprivacyIngest::Internal::Type::HashOf[
                        OursprivacyIngest::Internal::Type::Unknown
                      ],
                      OursprivacyIngest::Internal::Type::Converter
                    )
                end

                module UnionMember4
                  extend OursprivacyIngest::Internal::Type::Union

                  Variants =
                    T.type_alias do
                      T.nilable(
                        T.any(
                          String,
                          Float,
                          T::Boolean,
                          T::Array[
                            T.nilable(
                              OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember4::UnionMember4::UnionMember4::UnionMember4::UnionMember3::Variants
                            )
                          ]
                        )
                      )
                    end

                  # Any JSON value: string, number, boolean, array, object, or null.
                  module UnionMember3
                    extend OursprivacyIngest::Internal::Type::Union

                    Variants =
                      T.type_alias do
                        T.nilable(
                          T.any(
                            String,
                            Float,
                            T::Boolean,
                            T::Array[T.anything],
                            T::Hash[Symbol, T.anything]
                          )
                        )
                      end

                    sig do
                      override.returns(
                        T::Array[
                          OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember4::UnionMember4::UnionMember4::UnionMember4::UnionMember3::Variants
                        ]
                      )
                    end
                    def self.variants
                    end

                    UnionMember3Array =
                      T.let(
                        OursprivacyIngest::Internal::Type::ArrayOf[
                          OursprivacyIngest::Internal::Type::Unknown
                        ],
                        OursprivacyIngest::Internal::Type::Converter
                      )

                    UnionMember4Map =
                      T.let(
                        OursprivacyIngest::Internal::Type::HashOf[
                          OursprivacyIngest::Internal::Type::Unknown
                        ],
                        OursprivacyIngest::Internal::Type::Converter
                      )
                  end

                  sig do
                    override.returns(
                      T::Array[
                        OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember4::UnionMember4::UnionMember4::UnionMember4::Variants
                      ]
                    )
                  end
                  def self.variants
                  end

                  UnionMember3Array =
                    T.let(
                      OursprivacyIngest::Internal::Type::ArrayOf[
                        union:
                          OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember4::UnionMember4::UnionMember4::UnionMember4::UnionMember3,
                        nil?: true
                      ],
                      OursprivacyIngest::Internal::Type::Converter
                    )
                end

                sig do
                  override.returns(
                    T::Array[
                      OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember4::UnionMember4::UnionMember4::Variants
                    ]
                  )
                end
                def self.variants
                end

                UnionMember3Array =
                  T.let(
                    OursprivacyIngest::Internal::Type::ArrayOf[
                      union:
                        OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember4::UnionMember4::UnionMember4::UnionMember3,
                      nil?: true
                    ],
                    OursprivacyIngest::Internal::Type::Converter
                  )

                UnionMember4Map =
                  T.let(
                    OursprivacyIngest::Internal::Type::HashOf[
                      union:
                        OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember4::UnionMember4::UnionMember4::UnionMember4,
                      nil?: true
                    ],
                    OursprivacyIngest::Internal::Type::Converter
                  )
              end

              sig do
                override.returns(
                  T::Array[
                    OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember4::UnionMember4::Variants
                  ]
                )
              end
              def self.variants
              end

              UnionMember3Array =
                T.let(
                  OursprivacyIngest::Internal::Type::ArrayOf[
                    union:
                      OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember4::UnionMember4::UnionMember3,
                    nil?: true
                  ],
                  OursprivacyIngest::Internal::Type::Converter
                )

              UnionMember4Map =
                T.let(
                  OursprivacyIngest::Internal::Type::HashOf[
                    union:
                      OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember4::UnionMember4::UnionMember4,
                    nil?: true
                  ],
                  OursprivacyIngest::Internal::Type::Converter
                )
            end

            sig do
              override.returns(
                T::Array[
                  OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember4::Variants
                ]
              )
            end
            def self.variants
            end

            UnionMember3Array =
              T.let(
                OursprivacyIngest::Internal::Type::ArrayOf[
                  union:
                    OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember4::UnionMember3,
                  nil?: true
                ],
                OursprivacyIngest::Internal::Type::Converter
              )

            UnionMember4Map =
              T.let(
                OursprivacyIngest::Internal::Type::HashOf[
                  union:
                    OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember4::UnionMember4,
                  nil?: true
                ],
                OursprivacyIngest::Internal::Type::Converter
              )
          end

          sig do
            override.returns(
              T::Array[
                OursprivacyIngest::BatchCreateParams::Event::EventProperty::Variants
              ]
            )
          end
          def self.variants
          end

          UnionMember3Array =
            T.let(
              OursprivacyIngest::Internal::Type::ArrayOf[
                union:
                  OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember3,
                nil?: true
              ],
              OursprivacyIngest::Internal::Type::Converter
            )

          UnionMember4Map =
            T.let(
              OursprivacyIngest::Internal::Type::HashOf[
                union:
                  OursprivacyIngest::BatchCreateParams::Event::EventProperty::UnionMember4,
                nil?: true
              ],
              OursprivacyIngest::Internal::Type::Converter
            )
        end

        class IdentityContext < OursprivacyIngest::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                OursprivacyIngest::BatchCreateParams::Event::IdentityContext,
                OursprivacyIngest::Internal::AnyHash
              )
            end

          # The end-user IP address (not the server IP).
          sig { returns(String) }
          attr_accessor :ip

          # The end-user User-Agent string (not the server UA).
          sig { returns(String) }
          attr_accessor :user_agent

          # End-user network context for server-side calls. Required for probabilistic
          # identity resolution when the caller is a backend server rather than an end-user
          # browser.
          sig do
            params(ip: String, user_agent: String).returns(T.attached_class)
          end
          def self.new(
            # The end-user IP address (not the server IP).
            ip:,
            # The end-user User-Agent string (not the server UA).
            user_agent:
          )
          end

          sig { override.returns({ ip: String, user_agent: String }) }
          def to_hash
          end
        end

        class UserProperties < OursprivacyIngest::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                OursprivacyIngest::BatchCreateParams::Event::UserProperties,
                OursprivacyIngest::Internal::AnyHash
              )
            end

          # Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :_ef_transaction_id

          sig { returns(T.nilable(String)) }
          attr_accessor :ad_id

          # Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :admitad_uid

          sig { returns(T.nilable(String)) }
          attr_accessor :adset_id

          sig { returns(T.nilable(String)) }
          attr_accessor :alart

          sig { returns(T.nilable(String)) }
          attr_accessor :aleid

          sig { returns(T.nilable(String)) }
          attr_accessor :axwrt

          # Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :basis_cid

          # Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :beeswax_auction_id

          sig { returns(T.nilable(String)) }
          attr_accessor :campaign_id

          # Non-string input is converted to text before validation; clients should send a
          # string. Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :city

          sig { returns(T.nilable(String)) }
          attr_accessor :clickid

          sig { returns(T.nilable(String)) }
          attr_accessor :clid

          # Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :company_name

          # Use at most 200 nonempty property keys and five object levels. Array contents do
          # not count toward the object-depth limit. Empty keys are removed recursively,
          # arrays are truncated to 250 entries, and top-level numbers outside the safe
          # integer range become strings. After normalization, the serialized JSON must be
          # shorter than 1,048,576 UTF-16 code units.
          sig do
            returns(
              T.nilable(
                T::Hash[
                  Symbol,
                  T.nilable(
                    OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::Variants
                  )
                ]
              )
            )
          end
          attr_accessor :consent

          # Non-string input is converted to text before validation; clients should send a
          # string. Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :country

          # Use at most 200 nonempty property keys and five object levels. Array contents do
          # not count toward the object-depth limit. Empty keys are removed recursively,
          # arrays are truncated to 250 entries, and top-level numbers outside the safe
          # integer range become strings. After normalization, the serialized JSON must be
          # shorter than 1,048,576 UTF-16 code units.
          sig do
            returns(
              T.nilable(
                T::Hash[
                  Symbol,
                  T.nilable(
                    OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::Variants
                  )
                ]
              )
            )
          end
          attr_accessor :custom_properties

          # Non-string input is converted to text before validation; clients should send a
          # string. Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :date_of_birth

          sig { returns(T.nilable(String)) }
          attr_accessor :dclid

          # Non-string input is converted to text before validation; clients should send a
          # string. Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :email

          # Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :epik

          # Non-string input is converted to text before validation; clients should send a
          # string. Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :external_id

          sig { returns(T.nilable(String)) }
          attr_accessor :fbc

          sig { returns(T.nilable(String)) }
          attr_accessor :fbclid

          sig { returns(T.nilable(String)) }
          attr_accessor :fbp

          # Non-string input is converted to text before validation; clients should send a
          # string. Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :first_name

          sig { returns(T.nilable(String)) }
          attr_accessor :gad_source

          sig { returns(T.nilable(String)) }
          attr_accessor :gbraid

          sig { returns(T.nilable(String)) }
          attr_accessor :gclid

          # Non-string input is converted to text before validation; clients should send a
          # string. Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :gender

          # Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :graid

          # Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :grclid

          sig { returns(T.nilable(String)) }
          attr_accessor :im_ref

          # The IP address of the user Leading and trailing whitespace is removed before
          # validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :ip

          sig { returns(T.nilable(String)) }
          attr_accessor :irclickid

          # Any JSON value: string, number, boolean, array, object, or null.
          sig do
            returns(
              T.nilable(
                OursprivacyIngest::BatchCreateParams::Event::UserProperties::IsBot::Variants
              )
            )
          end
          attr_accessor :is_bot

          # Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :job_title

          # Non-string input is converted to text before validation; clients should send a
          # string. Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :last_name

          sig { returns(T.nilable(String)) }
          attr_accessor :li_fat_id

          sig { returns(T.nilable(String)) }
          attr_accessor :msclkid

          sig { returns(T.nilable(String)) }
          attr_accessor :ndclid

          # Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :ob_click_id

          sig { returns(T.nilable(String)) }
          attr_accessor :oppref

          # Any JSON value: string, number, boolean, array, object, or null.
          sig do
            returns(
              T.nilable(
                OursprivacyIngest::BatchCreateParams::Event::UserProperties::PhoneNumber::Variants
              )
            )
          end
          attr_accessor :phone_number

          sig { returns(T.nilable(String)) }
          attr_accessor :qclid

          sig { returns(T.nilable(String)) }
          attr_accessor :rdt_cid

          sig { returns(T.nilable(String)) }
          attr_accessor :referrer

          sig { returns(T.nilable(String)) }
          attr_accessor :referring_domain

          # Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :sacid

          sig { returns(T.nilable(String)) }
          attr_accessor :sccid

          # Non-string input is converted to text before validation; clients should send a
          # string.
          sig { returns(T.nilable(String)) }
          attr_accessor :sid

          # Non-string input is converted to text before validation; clients should send a
          # string. Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :state

          sig { returns(T.nilable(String)) }
          attr_accessor :ttclid

          # Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :ttd_impression_id

          sig { returns(T.nilable(String)) }
          attr_accessor :twclid

          sig { returns(T.nilable(String)) }
          attr_accessor :user_agent

          sig { returns(T.nilable(String)) }
          attr_accessor :user_agent_full_list

          # Non-string input is converted to text before validation; clients should send a
          # string.
          sig { returns(T.nilable(String)) }
          attr_accessor :utm_campaign

          # Non-string input is converted to text before validation; clients should send a
          # string.
          sig { returns(T.nilable(String)) }
          attr_accessor :utm_content

          # Non-string input is converted to text before validation; clients should send a
          # string.
          sig { returns(T.nilable(String)) }
          attr_accessor :utm_medium

          # Non-string input is converted to text before validation; clients should send a
          # string.
          sig { returns(T.nilable(String)) }
          attr_accessor :utm_name

          # Non-string input is converted to text before validation; clients should send a
          # string.
          sig { returns(T.nilable(String)) }
          attr_accessor :utm_source

          # Non-string input is converted to text before validation; clients should send a
          # string.
          sig { returns(T.nilable(String)) }
          attr_accessor :utm_term

          # Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :viant_click_id

          # Leading and trailing whitespace is removed before validation.
          sig { returns(T.nilable(String)) }
          attr_accessor :viant_impression_id

          sig { returns(T.nilable(String)) }
          attr_accessor :wbraid

          sig { returns(T.nilable(String)) }
          attr_accessor :ylpcid

          # Any JSON value: string, number, boolean, array, object, or null.
          sig do
            returns(
              T.nilable(
                OursprivacyIngest::BatchCreateParams::Event::UserProperties::Zip::Variants
              )
            )
          end
          attr_accessor :zip

          # Properties to set on the visitor. (optional) You can also update these
          # properties via the identify endpoint.
          sig do
            params(
              _ef_transaction_id: T.nilable(String),
              ad_id: T.nilable(String),
              admitad_uid: T.nilable(String),
              adset_id: T.nilable(String),
              alart: T.nilable(String),
              aleid: T.nilable(String),
              axwrt: T.nilable(String),
              basis_cid: T.nilable(String),
              beeswax_auction_id: T.nilable(String),
              campaign_id: T.nilable(String),
              city: T.nilable(String),
              clickid: T.nilable(String),
              clid: T.nilable(String),
              company_name: T.nilable(String),
              consent:
                T.nilable(
                  T::Hash[
                    Symbol,
                    T.nilable(
                      OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::Variants
                    )
                  ]
                ),
              country: T.nilable(String),
              custom_properties:
                T.nilable(
                  T::Hash[
                    Symbol,
                    T.nilable(
                      OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::Variants
                    )
                  ]
                ),
              date_of_birth: T.nilable(String),
              dclid: T.nilable(String),
              email: T.nilable(String),
              epik: T.nilable(String),
              external_id: T.nilable(String),
              fbc: T.nilable(String),
              fbclid: T.nilable(String),
              fbp: T.nilable(String),
              first_name: T.nilable(String),
              gad_source: T.nilable(String),
              gbraid: T.nilable(String),
              gclid: T.nilable(String),
              gender: T.nilable(String),
              graid: T.nilable(String),
              grclid: T.nilable(String),
              im_ref: T.nilable(String),
              ip: T.nilable(String),
              irclickid: T.nilable(String),
              is_bot:
                T.nilable(
                  OursprivacyIngest::BatchCreateParams::Event::UserProperties::IsBot::Variants
                ),
              job_title: T.nilable(String),
              last_name: T.nilable(String),
              li_fat_id: T.nilable(String),
              msclkid: T.nilable(String),
              ndclid: T.nilable(String),
              ob_click_id: T.nilable(String),
              oppref: T.nilable(String),
              phone_number:
                T.nilable(
                  OursprivacyIngest::BatchCreateParams::Event::UserProperties::PhoneNumber::Variants
                ),
              qclid: T.nilable(String),
              rdt_cid: T.nilable(String),
              referrer: T.nilable(String),
              referring_domain: T.nilable(String),
              sacid: T.nilable(String),
              sccid: T.nilable(String),
              sid: T.nilable(String),
              state: T.nilable(String),
              ttclid: T.nilable(String),
              ttd_impression_id: T.nilable(String),
              twclid: T.nilable(String),
              user_agent: T.nilable(String),
              user_agent_full_list: T.nilable(String),
              utm_campaign: T.nilable(String),
              utm_content: T.nilable(String),
              utm_medium: T.nilable(String),
              utm_name: T.nilable(String),
              utm_source: T.nilable(String),
              utm_term: T.nilable(String),
              viant_click_id: T.nilable(String),
              viant_impression_id: T.nilable(String),
              wbraid: T.nilable(String),
              ylpcid: T.nilable(String),
              zip:
                T.nilable(
                  OursprivacyIngest::BatchCreateParams::Event::UserProperties::Zip::Variants
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Leading and trailing whitespace is removed before validation.
            _ef_transaction_id: nil,
            ad_id: nil,
            # Leading and trailing whitespace is removed before validation.
            admitad_uid: nil,
            adset_id: nil,
            alart: nil,
            aleid: nil,
            axwrt: nil,
            # Leading and trailing whitespace is removed before validation.
            basis_cid: nil,
            # Leading and trailing whitespace is removed before validation.
            beeswax_auction_id: nil,
            campaign_id: nil,
            # Non-string input is converted to text before validation; clients should send a
            # string. Leading and trailing whitespace is removed before validation.
            city: nil,
            clickid: nil,
            clid: nil,
            # Leading and trailing whitespace is removed before validation.
            company_name: nil,
            # Use at most 200 nonempty property keys and five object levels. Array contents do
            # not count toward the object-depth limit. Empty keys are removed recursively,
            # arrays are truncated to 250 entries, and top-level numbers outside the safe
            # integer range become strings. After normalization, the serialized JSON must be
            # shorter than 1,048,576 UTF-16 code units.
            consent: nil,
            # Non-string input is converted to text before validation; clients should send a
            # string. Leading and trailing whitespace is removed before validation.
            country: nil,
            # Use at most 200 nonempty property keys and five object levels. Array contents do
            # not count toward the object-depth limit. Empty keys are removed recursively,
            # arrays are truncated to 250 entries, and top-level numbers outside the safe
            # integer range become strings. After normalization, the serialized JSON must be
            # shorter than 1,048,576 UTF-16 code units.
            custom_properties: nil,
            # Non-string input is converted to text before validation; clients should send a
            # string. Leading and trailing whitespace is removed before validation.
            date_of_birth: nil,
            dclid: nil,
            # Non-string input is converted to text before validation; clients should send a
            # string. Leading and trailing whitespace is removed before validation.
            email: nil,
            # Leading and trailing whitespace is removed before validation.
            epik: nil,
            # Non-string input is converted to text before validation; clients should send a
            # string. Leading and trailing whitespace is removed before validation.
            external_id: nil,
            fbc: nil,
            fbclid: nil,
            fbp: nil,
            # Non-string input is converted to text before validation; clients should send a
            # string. Leading and trailing whitespace is removed before validation.
            first_name: nil,
            gad_source: nil,
            gbraid: nil,
            gclid: nil,
            # Non-string input is converted to text before validation; clients should send a
            # string. Leading and trailing whitespace is removed before validation.
            gender: nil,
            # Leading and trailing whitespace is removed before validation.
            graid: nil,
            # Leading and trailing whitespace is removed before validation.
            grclid: nil,
            im_ref: nil,
            # The IP address of the user Leading and trailing whitespace is removed before
            # validation.
            ip: nil,
            irclickid: nil,
            # Any JSON value: string, number, boolean, array, object, or null.
            is_bot: nil,
            # Leading and trailing whitespace is removed before validation.
            job_title: nil,
            # Non-string input is converted to text before validation; clients should send a
            # string. Leading and trailing whitespace is removed before validation.
            last_name: nil,
            li_fat_id: nil,
            msclkid: nil,
            ndclid: nil,
            # Leading and trailing whitespace is removed before validation.
            ob_click_id: nil,
            oppref: nil,
            # Any JSON value: string, number, boolean, array, object, or null.
            phone_number: nil,
            qclid: nil,
            rdt_cid: nil,
            referrer: nil,
            referring_domain: nil,
            # Leading and trailing whitespace is removed before validation.
            sacid: nil,
            sccid: nil,
            # Non-string input is converted to text before validation; clients should send a
            # string.
            sid: nil,
            # Non-string input is converted to text before validation; clients should send a
            # string. Leading and trailing whitespace is removed before validation.
            state: nil,
            ttclid: nil,
            # Leading and trailing whitespace is removed before validation.
            ttd_impression_id: nil,
            twclid: nil,
            user_agent: nil,
            user_agent_full_list: nil,
            # Non-string input is converted to text before validation; clients should send a
            # string.
            utm_campaign: nil,
            # Non-string input is converted to text before validation; clients should send a
            # string.
            utm_content: nil,
            # Non-string input is converted to text before validation; clients should send a
            # string.
            utm_medium: nil,
            # Non-string input is converted to text before validation; clients should send a
            # string.
            utm_name: nil,
            # Non-string input is converted to text before validation; clients should send a
            # string.
            utm_source: nil,
            # Non-string input is converted to text before validation; clients should send a
            # string.
            utm_term: nil,
            # Leading and trailing whitespace is removed before validation.
            viant_click_id: nil,
            # Leading and trailing whitespace is removed before validation.
            viant_impression_id: nil,
            wbraid: nil,
            ylpcid: nil,
            # Any JSON value: string, number, boolean, array, object, or null.
            zip: nil
          )
          end

          sig do
            override.returns(
              {
                _ef_transaction_id: T.nilable(String),
                ad_id: T.nilable(String),
                admitad_uid: T.nilable(String),
                adset_id: T.nilable(String),
                alart: T.nilable(String),
                aleid: T.nilable(String),
                axwrt: T.nilable(String),
                basis_cid: T.nilable(String),
                beeswax_auction_id: T.nilable(String),
                campaign_id: T.nilable(String),
                city: T.nilable(String),
                clickid: T.nilable(String),
                clid: T.nilable(String),
                company_name: T.nilable(String),
                consent:
                  T.nilable(
                    T::Hash[
                      Symbol,
                      T.nilable(
                        OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::Variants
                      )
                    ]
                  ),
                country: T.nilable(String),
                custom_properties:
                  T.nilable(
                    T::Hash[
                      Symbol,
                      T.nilable(
                        OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::Variants
                      )
                    ]
                  ),
                date_of_birth: T.nilable(String),
                dclid: T.nilable(String),
                email: T.nilable(String),
                epik: T.nilable(String),
                external_id: T.nilable(String),
                fbc: T.nilable(String),
                fbclid: T.nilable(String),
                fbp: T.nilable(String),
                first_name: T.nilable(String),
                gad_source: T.nilable(String),
                gbraid: T.nilable(String),
                gclid: T.nilable(String),
                gender: T.nilable(String),
                graid: T.nilable(String),
                grclid: T.nilable(String),
                im_ref: T.nilable(String),
                ip: T.nilable(String),
                irclickid: T.nilable(String),
                is_bot:
                  T.nilable(
                    OursprivacyIngest::BatchCreateParams::Event::UserProperties::IsBot::Variants
                  ),
                job_title: T.nilable(String),
                last_name: T.nilable(String),
                li_fat_id: T.nilable(String),
                msclkid: T.nilable(String),
                ndclid: T.nilable(String),
                ob_click_id: T.nilable(String),
                oppref: T.nilable(String),
                phone_number:
                  T.nilable(
                    OursprivacyIngest::BatchCreateParams::Event::UserProperties::PhoneNumber::Variants
                  ),
                qclid: T.nilable(String),
                rdt_cid: T.nilable(String),
                referrer: T.nilable(String),
                referring_domain: T.nilable(String),
                sacid: T.nilable(String),
                sccid: T.nilable(String),
                sid: T.nilable(String),
                state: T.nilable(String),
                ttclid: T.nilable(String),
                ttd_impression_id: T.nilable(String),
                twclid: T.nilable(String),
                user_agent: T.nilable(String),
                user_agent_full_list: T.nilable(String),
                utm_campaign: T.nilable(String),
                utm_content: T.nilable(String),
                utm_medium: T.nilable(String),
                utm_name: T.nilable(String),
                utm_source: T.nilable(String),
                utm_term: T.nilable(String),
                viant_click_id: T.nilable(String),
                viant_impression_id: T.nilable(String),
                wbraid: T.nilable(String),
                ylpcid: T.nilable(String),
                zip:
                  T.nilable(
                    OursprivacyIngest::BatchCreateParams::Event::UserProperties::Zip::Variants
                  )
              }
            )
          end
          def to_hash
          end

          module Consent
            extend OursprivacyIngest::Internal::Type::Union

            Variants =
              T.type_alias do
                T.nilable(
                  T.any(
                    String,
                    Float,
                    T::Boolean,
                    T::Array[
                      T.nilable(
                        OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember3::Variants
                      )
                    ],
                    T::Hash[
                      Symbol,
                      T.nilable(
                        OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember4::Variants
                      )
                    ]
                  )
                )
              end

            # Any JSON value: string, number, boolean, array, object, or null.
            module UnionMember3
              extend OursprivacyIngest::Internal::Type::Union

              Variants =
                T.type_alias do
                  T.nilable(
                    T.any(
                      String,
                      Float,
                      T::Boolean,
                      T::Array[T.anything],
                      T::Hash[Symbol, T.anything]
                    )
                  )
                end

              sig do
                override.returns(
                  T::Array[
                    OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember3::Variants
                  ]
                )
              end
              def self.variants
              end

              UnionMember3Array =
                T.let(
                  OursprivacyIngest::Internal::Type::ArrayOf[
                    OursprivacyIngest::Internal::Type::Unknown
                  ],
                  OursprivacyIngest::Internal::Type::Converter
                )

              UnionMember4Map =
                T.let(
                  OursprivacyIngest::Internal::Type::HashOf[
                    OursprivacyIngest::Internal::Type::Unknown
                  ],
                  OursprivacyIngest::Internal::Type::Converter
                )
            end

            module UnionMember4
              extend OursprivacyIngest::Internal::Type::Union

              Variants =
                T.type_alias do
                  T.nilable(
                    T.any(
                      String,
                      Float,
                      T::Boolean,
                      T::Array[
                        T.nilable(
                          OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember4::UnionMember3::Variants
                        )
                      ],
                      T::Hash[
                        Symbol,
                        T.nilable(
                          OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember4::UnionMember4::Variants
                        )
                      ]
                    )
                  )
                end

              # Any JSON value: string, number, boolean, array, object, or null.
              module UnionMember3
                extend OursprivacyIngest::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.nilable(
                      T.any(
                        String,
                        Float,
                        T::Boolean,
                        T::Array[T.anything],
                        T::Hash[Symbol, T.anything]
                      )
                    )
                  end

                sig do
                  override.returns(
                    T::Array[
                      OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember4::UnionMember3::Variants
                    ]
                  )
                end
                def self.variants
                end

                UnionMember3Array =
                  T.let(
                    OursprivacyIngest::Internal::Type::ArrayOf[
                      OursprivacyIngest::Internal::Type::Unknown
                    ],
                    OursprivacyIngest::Internal::Type::Converter
                  )

                UnionMember4Map =
                  T.let(
                    OursprivacyIngest::Internal::Type::HashOf[
                      OursprivacyIngest::Internal::Type::Unknown
                    ],
                    OursprivacyIngest::Internal::Type::Converter
                  )
              end

              module UnionMember4
                extend OursprivacyIngest::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.nilable(
                      T.any(
                        String,
                        Float,
                        T::Boolean,
                        T::Array[
                          T.nilable(
                            OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember4::UnionMember4::UnionMember3::Variants
                          )
                        ],
                        T::Hash[
                          Symbol,
                          T.nilable(
                            OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember4::UnionMember4::UnionMember4::Variants
                          )
                        ]
                      )
                    )
                  end

                # Any JSON value: string, number, boolean, array, object, or null.
                module UnionMember3
                  extend OursprivacyIngest::Internal::Type::Union

                  Variants =
                    T.type_alias do
                      T.nilable(
                        T.any(
                          String,
                          Float,
                          T::Boolean,
                          T::Array[T.anything],
                          T::Hash[Symbol, T.anything]
                        )
                      )
                    end

                  sig do
                    override.returns(
                      T::Array[
                        OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember4::UnionMember4::UnionMember3::Variants
                      ]
                    )
                  end
                  def self.variants
                  end

                  UnionMember3Array =
                    T.let(
                      OursprivacyIngest::Internal::Type::ArrayOf[
                        OursprivacyIngest::Internal::Type::Unknown
                      ],
                      OursprivacyIngest::Internal::Type::Converter
                    )

                  UnionMember4Map =
                    T.let(
                      OursprivacyIngest::Internal::Type::HashOf[
                        OursprivacyIngest::Internal::Type::Unknown
                      ],
                      OursprivacyIngest::Internal::Type::Converter
                    )
                end

                module UnionMember4
                  extend OursprivacyIngest::Internal::Type::Union

                  Variants =
                    T.type_alias do
                      T.nilable(
                        T.any(
                          String,
                          Float,
                          T::Boolean,
                          T::Array[
                            T.nilable(
                              OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember4::UnionMember4::UnionMember4::UnionMember3::Variants
                            )
                          ],
                          T::Hash[
                            Symbol,
                            T.nilable(
                              OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember4::UnionMember4::UnionMember4::UnionMember4::Variants
                            )
                          ]
                        )
                      )
                    end

                  # Any JSON value: string, number, boolean, array, object, or null.
                  module UnionMember3
                    extend OursprivacyIngest::Internal::Type::Union

                    Variants =
                      T.type_alias do
                        T.nilable(
                          T.any(
                            String,
                            Float,
                            T::Boolean,
                            T::Array[T.anything],
                            T::Hash[Symbol, T.anything]
                          )
                        )
                      end

                    sig do
                      override.returns(
                        T::Array[
                          OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember4::UnionMember4::UnionMember4::UnionMember3::Variants
                        ]
                      )
                    end
                    def self.variants
                    end

                    UnionMember3Array =
                      T.let(
                        OursprivacyIngest::Internal::Type::ArrayOf[
                          OursprivacyIngest::Internal::Type::Unknown
                        ],
                        OursprivacyIngest::Internal::Type::Converter
                      )

                    UnionMember4Map =
                      T.let(
                        OursprivacyIngest::Internal::Type::HashOf[
                          OursprivacyIngest::Internal::Type::Unknown
                        ],
                        OursprivacyIngest::Internal::Type::Converter
                      )
                  end

                  module UnionMember4
                    extend OursprivacyIngest::Internal::Type::Union

                    Variants =
                      T.type_alias do
                        T.nilable(
                          T.any(
                            String,
                            Float,
                            T::Boolean,
                            T::Array[
                              T.nilable(
                                OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember4::UnionMember4::UnionMember4::UnionMember4::UnionMember3::Variants
                              )
                            ]
                          )
                        )
                      end

                    # Any JSON value: string, number, boolean, array, object, or null.
                    module UnionMember3
                      extend OursprivacyIngest::Internal::Type::Union

                      Variants =
                        T.type_alias do
                          T.nilable(
                            T.any(
                              String,
                              Float,
                              T::Boolean,
                              T::Array[T.anything],
                              T::Hash[Symbol, T.anything]
                            )
                          )
                        end

                      sig do
                        override.returns(
                          T::Array[
                            OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember4::UnionMember4::UnionMember4::UnionMember4::UnionMember3::Variants
                          ]
                        )
                      end
                      def self.variants
                      end

                      UnionMember3Array =
                        T.let(
                          OursprivacyIngest::Internal::Type::ArrayOf[
                            OursprivacyIngest::Internal::Type::Unknown
                          ],
                          OursprivacyIngest::Internal::Type::Converter
                        )

                      UnionMember4Map =
                        T.let(
                          OursprivacyIngest::Internal::Type::HashOf[
                            OursprivacyIngest::Internal::Type::Unknown
                          ],
                          OursprivacyIngest::Internal::Type::Converter
                        )
                    end

                    sig do
                      override.returns(
                        T::Array[
                          OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember4::UnionMember4::UnionMember4::UnionMember4::Variants
                        ]
                      )
                    end
                    def self.variants
                    end

                    UnionMember3Array =
                      T.let(
                        OursprivacyIngest::Internal::Type::ArrayOf[
                          union:
                            OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember4::UnionMember4::UnionMember4::UnionMember4::UnionMember3,
                          nil?: true
                        ],
                        OursprivacyIngest::Internal::Type::Converter
                      )
                  end

                  sig do
                    override.returns(
                      T::Array[
                        OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember4::UnionMember4::UnionMember4::Variants
                      ]
                    )
                  end
                  def self.variants
                  end

                  UnionMember3Array =
                    T.let(
                      OursprivacyIngest::Internal::Type::ArrayOf[
                        union:
                          OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember4::UnionMember4::UnionMember4::UnionMember3,
                        nil?: true
                      ],
                      OursprivacyIngest::Internal::Type::Converter
                    )

                  UnionMember4Map =
                    T.let(
                      OursprivacyIngest::Internal::Type::HashOf[
                        union:
                          OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember4::UnionMember4::UnionMember4::UnionMember4,
                        nil?: true
                      ],
                      OursprivacyIngest::Internal::Type::Converter
                    )
                end

                sig do
                  override.returns(
                    T::Array[
                      OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember4::UnionMember4::Variants
                    ]
                  )
                end
                def self.variants
                end

                UnionMember3Array =
                  T.let(
                    OursprivacyIngest::Internal::Type::ArrayOf[
                      union:
                        OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember4::UnionMember4::UnionMember3,
                      nil?: true
                    ],
                    OursprivacyIngest::Internal::Type::Converter
                  )

                UnionMember4Map =
                  T.let(
                    OursprivacyIngest::Internal::Type::HashOf[
                      union:
                        OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember4::UnionMember4::UnionMember4,
                      nil?: true
                    ],
                    OursprivacyIngest::Internal::Type::Converter
                  )
              end

              sig do
                override.returns(
                  T::Array[
                    OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember4::Variants
                  ]
                )
              end
              def self.variants
              end

              UnionMember3Array =
                T.let(
                  OursprivacyIngest::Internal::Type::ArrayOf[
                    union:
                      OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember4::UnionMember3,
                    nil?: true
                  ],
                  OursprivacyIngest::Internal::Type::Converter
                )

              UnionMember4Map =
                T.let(
                  OursprivacyIngest::Internal::Type::HashOf[
                    union:
                      OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember4::UnionMember4,
                    nil?: true
                  ],
                  OursprivacyIngest::Internal::Type::Converter
                )
            end

            sig do
              override.returns(
                T::Array[
                  OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::Variants
                ]
              )
            end
            def self.variants
            end

            UnionMember3Array =
              T.let(
                OursprivacyIngest::Internal::Type::ArrayOf[
                  union:
                    OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember3,
                  nil?: true
                ],
                OursprivacyIngest::Internal::Type::Converter
              )

            UnionMember4Map =
              T.let(
                OursprivacyIngest::Internal::Type::HashOf[
                  union:
                    OursprivacyIngest::BatchCreateParams::Event::UserProperties::Consent::UnionMember4,
                  nil?: true
                ],
                OursprivacyIngest::Internal::Type::Converter
              )
          end

          module CustomProperty
            extend OursprivacyIngest::Internal::Type::Union

            Variants =
              T.type_alias do
                T.nilable(
                  T.any(
                    String,
                    Float,
                    T::Boolean,
                    T::Array[
                      T.nilable(
                        OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember3::Variants
                      )
                    ],
                    T::Hash[
                      Symbol,
                      T.nilable(
                        OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember4::Variants
                      )
                    ]
                  )
                )
              end

            # Any JSON value: string, number, boolean, array, object, or null.
            module UnionMember3
              extend OursprivacyIngest::Internal::Type::Union

              Variants =
                T.type_alias do
                  T.nilable(
                    T.any(
                      String,
                      Float,
                      T::Boolean,
                      T::Array[T.anything],
                      T::Hash[Symbol, T.anything]
                    )
                  )
                end

              sig do
                override.returns(
                  T::Array[
                    OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember3::Variants
                  ]
                )
              end
              def self.variants
              end

              UnionMember3Array =
                T.let(
                  OursprivacyIngest::Internal::Type::ArrayOf[
                    OursprivacyIngest::Internal::Type::Unknown
                  ],
                  OursprivacyIngest::Internal::Type::Converter
                )

              UnionMember4Map =
                T.let(
                  OursprivacyIngest::Internal::Type::HashOf[
                    OursprivacyIngest::Internal::Type::Unknown
                  ],
                  OursprivacyIngest::Internal::Type::Converter
                )
            end

            module UnionMember4
              extend OursprivacyIngest::Internal::Type::Union

              Variants =
                T.type_alias do
                  T.nilable(
                    T.any(
                      String,
                      Float,
                      T::Boolean,
                      T::Array[
                        T.nilable(
                          OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember4::UnionMember3::Variants
                        )
                      ],
                      T::Hash[
                        Symbol,
                        T.nilable(
                          OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember4::UnionMember4::Variants
                        )
                      ]
                    )
                  )
                end

              # Any JSON value: string, number, boolean, array, object, or null.
              module UnionMember3
                extend OursprivacyIngest::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.nilable(
                      T.any(
                        String,
                        Float,
                        T::Boolean,
                        T::Array[T.anything],
                        T::Hash[Symbol, T.anything]
                      )
                    )
                  end

                sig do
                  override.returns(
                    T::Array[
                      OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember4::UnionMember3::Variants
                    ]
                  )
                end
                def self.variants
                end

                UnionMember3Array =
                  T.let(
                    OursprivacyIngest::Internal::Type::ArrayOf[
                      OursprivacyIngest::Internal::Type::Unknown
                    ],
                    OursprivacyIngest::Internal::Type::Converter
                  )

                UnionMember4Map =
                  T.let(
                    OursprivacyIngest::Internal::Type::HashOf[
                      OursprivacyIngest::Internal::Type::Unknown
                    ],
                    OursprivacyIngest::Internal::Type::Converter
                  )
              end

              module UnionMember4
                extend OursprivacyIngest::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.nilable(
                      T.any(
                        String,
                        Float,
                        T::Boolean,
                        T::Array[
                          T.nilable(
                            OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember4::UnionMember4::UnionMember3::Variants
                          )
                        ],
                        T::Hash[
                          Symbol,
                          T.nilable(
                            OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember4::UnionMember4::UnionMember4::Variants
                          )
                        ]
                      )
                    )
                  end

                # Any JSON value: string, number, boolean, array, object, or null.
                module UnionMember3
                  extend OursprivacyIngest::Internal::Type::Union

                  Variants =
                    T.type_alias do
                      T.nilable(
                        T.any(
                          String,
                          Float,
                          T::Boolean,
                          T::Array[T.anything],
                          T::Hash[Symbol, T.anything]
                        )
                      )
                    end

                  sig do
                    override.returns(
                      T::Array[
                        OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember4::UnionMember4::UnionMember3::Variants
                      ]
                    )
                  end
                  def self.variants
                  end

                  UnionMember3Array =
                    T.let(
                      OursprivacyIngest::Internal::Type::ArrayOf[
                        OursprivacyIngest::Internal::Type::Unknown
                      ],
                      OursprivacyIngest::Internal::Type::Converter
                    )

                  UnionMember4Map =
                    T.let(
                      OursprivacyIngest::Internal::Type::HashOf[
                        OursprivacyIngest::Internal::Type::Unknown
                      ],
                      OursprivacyIngest::Internal::Type::Converter
                    )
                end

                module UnionMember4
                  extend OursprivacyIngest::Internal::Type::Union

                  Variants =
                    T.type_alias do
                      T.nilable(
                        T.any(
                          String,
                          Float,
                          T::Boolean,
                          T::Array[
                            T.nilable(
                              OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember4::UnionMember4::UnionMember4::UnionMember3::Variants
                            )
                          ],
                          T::Hash[
                            Symbol,
                            T.nilable(
                              OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember4::UnionMember4::UnionMember4::UnionMember4::Variants
                            )
                          ]
                        )
                      )
                    end

                  # Any JSON value: string, number, boolean, array, object, or null.
                  module UnionMember3
                    extend OursprivacyIngest::Internal::Type::Union

                    Variants =
                      T.type_alias do
                        T.nilable(
                          T.any(
                            String,
                            Float,
                            T::Boolean,
                            T::Array[T.anything],
                            T::Hash[Symbol, T.anything]
                          )
                        )
                      end

                    sig do
                      override.returns(
                        T::Array[
                          OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember4::UnionMember4::UnionMember4::UnionMember3::Variants
                        ]
                      )
                    end
                    def self.variants
                    end

                    UnionMember3Array =
                      T.let(
                        OursprivacyIngest::Internal::Type::ArrayOf[
                          OursprivacyIngest::Internal::Type::Unknown
                        ],
                        OursprivacyIngest::Internal::Type::Converter
                      )

                    UnionMember4Map =
                      T.let(
                        OursprivacyIngest::Internal::Type::HashOf[
                          OursprivacyIngest::Internal::Type::Unknown
                        ],
                        OursprivacyIngest::Internal::Type::Converter
                      )
                  end

                  module UnionMember4
                    extend OursprivacyIngest::Internal::Type::Union

                    Variants =
                      T.type_alias do
                        T.nilable(
                          T.any(
                            String,
                            Float,
                            T::Boolean,
                            T::Array[
                              T.nilable(
                                OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember4::UnionMember4::UnionMember4::UnionMember4::UnionMember3::Variants
                              )
                            ]
                          )
                        )
                      end

                    # Any JSON value: string, number, boolean, array, object, or null.
                    module UnionMember3
                      extend OursprivacyIngest::Internal::Type::Union

                      Variants =
                        T.type_alias do
                          T.nilable(
                            T.any(
                              String,
                              Float,
                              T::Boolean,
                              T::Array[T.anything],
                              T::Hash[Symbol, T.anything]
                            )
                          )
                        end

                      sig do
                        override.returns(
                          T::Array[
                            OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember4::UnionMember4::UnionMember4::UnionMember4::UnionMember3::Variants
                          ]
                        )
                      end
                      def self.variants
                      end

                      UnionMember3Array =
                        T.let(
                          OursprivacyIngest::Internal::Type::ArrayOf[
                            OursprivacyIngest::Internal::Type::Unknown
                          ],
                          OursprivacyIngest::Internal::Type::Converter
                        )

                      UnionMember4Map =
                        T.let(
                          OursprivacyIngest::Internal::Type::HashOf[
                            OursprivacyIngest::Internal::Type::Unknown
                          ],
                          OursprivacyIngest::Internal::Type::Converter
                        )
                    end

                    sig do
                      override.returns(
                        T::Array[
                          OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember4::UnionMember4::UnionMember4::UnionMember4::Variants
                        ]
                      )
                    end
                    def self.variants
                    end

                    UnionMember3Array =
                      T.let(
                        OursprivacyIngest::Internal::Type::ArrayOf[
                          union:
                            OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember4::UnionMember4::UnionMember4::UnionMember4::UnionMember3,
                          nil?: true
                        ],
                        OursprivacyIngest::Internal::Type::Converter
                      )
                  end

                  sig do
                    override.returns(
                      T::Array[
                        OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember4::UnionMember4::UnionMember4::Variants
                      ]
                    )
                  end
                  def self.variants
                  end

                  UnionMember3Array =
                    T.let(
                      OursprivacyIngest::Internal::Type::ArrayOf[
                        union:
                          OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember4::UnionMember4::UnionMember4::UnionMember3,
                        nil?: true
                      ],
                      OursprivacyIngest::Internal::Type::Converter
                    )

                  UnionMember4Map =
                    T.let(
                      OursprivacyIngest::Internal::Type::HashOf[
                        union:
                          OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember4::UnionMember4::UnionMember4::UnionMember4,
                        nil?: true
                      ],
                      OursprivacyIngest::Internal::Type::Converter
                    )
                end

                sig do
                  override.returns(
                    T::Array[
                      OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember4::UnionMember4::Variants
                    ]
                  )
                end
                def self.variants
                end

                UnionMember3Array =
                  T.let(
                    OursprivacyIngest::Internal::Type::ArrayOf[
                      union:
                        OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember4::UnionMember4::UnionMember3,
                      nil?: true
                    ],
                    OursprivacyIngest::Internal::Type::Converter
                  )

                UnionMember4Map =
                  T.let(
                    OursprivacyIngest::Internal::Type::HashOf[
                      union:
                        OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember4::UnionMember4::UnionMember4,
                      nil?: true
                    ],
                    OursprivacyIngest::Internal::Type::Converter
                  )
              end

              sig do
                override.returns(
                  T::Array[
                    OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember4::Variants
                  ]
                )
              end
              def self.variants
              end

              UnionMember3Array =
                T.let(
                  OursprivacyIngest::Internal::Type::ArrayOf[
                    union:
                      OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember4::UnionMember3,
                    nil?: true
                  ],
                  OursprivacyIngest::Internal::Type::Converter
                )

              UnionMember4Map =
                T.let(
                  OursprivacyIngest::Internal::Type::HashOf[
                    union:
                      OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember4::UnionMember4,
                    nil?: true
                  ],
                  OursprivacyIngest::Internal::Type::Converter
                )
            end

            sig do
              override.returns(
                T::Array[
                  OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::Variants
                ]
              )
            end
            def self.variants
            end

            UnionMember3Array =
              T.let(
                OursprivacyIngest::Internal::Type::ArrayOf[
                  union:
                    OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember3,
                  nil?: true
                ],
                OursprivacyIngest::Internal::Type::Converter
              )

            UnionMember4Map =
              T.let(
                OursprivacyIngest::Internal::Type::HashOf[
                  union:
                    OursprivacyIngest::BatchCreateParams::Event::UserProperties::CustomProperty::UnionMember4,
                  nil?: true
                ],
                OursprivacyIngest::Internal::Type::Converter
              )
          end

          # Any JSON value: string, number, boolean, array, object, or null.
          module IsBot
            extend OursprivacyIngest::Internal::Type::Union

            Variants =
              T.type_alias do
                T.nilable(
                  T.any(
                    String,
                    Float,
                    T::Boolean,
                    T::Array[T.anything],
                    T::Hash[Symbol, T.anything]
                  )
                )
              end

            sig do
              override.returns(
                T::Array[
                  OursprivacyIngest::BatchCreateParams::Event::UserProperties::IsBot::Variants
                ]
              )
            end
            def self.variants
            end

            UnionMember3Array =
              T.let(
                OursprivacyIngest::Internal::Type::ArrayOf[
                  OursprivacyIngest::Internal::Type::Unknown
                ],
                OursprivacyIngest::Internal::Type::Converter
              )

            UnionMember4Map =
              T.let(
                OursprivacyIngest::Internal::Type::HashOf[
                  OursprivacyIngest::Internal::Type::Unknown
                ],
                OursprivacyIngest::Internal::Type::Converter
              )
          end

          # Any JSON value: string, number, boolean, array, object, or null.
          module PhoneNumber
            extend OursprivacyIngest::Internal::Type::Union

            Variants =
              T.type_alias do
                T.nilable(
                  T.any(
                    String,
                    Float,
                    T::Boolean,
                    T::Array[T.anything],
                    T::Hash[Symbol, T.anything]
                  )
                )
              end

            sig do
              override.returns(
                T::Array[
                  OursprivacyIngest::BatchCreateParams::Event::UserProperties::PhoneNumber::Variants
                ]
              )
            end
            def self.variants
            end

            UnionMember3Array =
              T.let(
                OursprivacyIngest::Internal::Type::ArrayOf[
                  OursprivacyIngest::Internal::Type::Unknown
                ],
                OursprivacyIngest::Internal::Type::Converter
              )

            UnionMember4Map =
              T.let(
                OursprivacyIngest::Internal::Type::HashOf[
                  OursprivacyIngest::Internal::Type::Unknown
                ],
                OursprivacyIngest::Internal::Type::Converter
              )
          end

          # Any JSON value: string, number, boolean, array, object, or null.
          module Zip
            extend OursprivacyIngest::Internal::Type::Union

            Variants =
              T.type_alias do
                T.nilable(
                  T.any(
                    String,
                    Float,
                    T::Boolean,
                    T::Array[T.anything],
                    T::Hash[Symbol, T.anything]
                  )
                )
              end

            sig do
              override.returns(
                T::Array[
                  OursprivacyIngest::BatchCreateParams::Event::UserProperties::Zip::Variants
                ]
              )
            end
            def self.variants
            end

            UnionMember3Array =
              T.let(
                OursprivacyIngest::Internal::Type::ArrayOf[
                  OursprivacyIngest::Internal::Type::Unknown
                ],
                OursprivacyIngest::Internal::Type::Converter
              )

            UnionMember4Map =
              T.let(
                OursprivacyIngest::Internal::Type::HashOf[
                  OursprivacyIngest::Internal::Type::Unknown
                ],
                OursprivacyIngest::Internal::Type::Converter
              )
          end
        end
      end
    end
  end
end
