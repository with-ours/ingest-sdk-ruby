# frozen_string_literal: true

module OursprivacyIngest
  module Models
    # @see OursprivacyIngest::Resources::Track#event
    class TrackEventParams < OursprivacyIngest::Internal::Type::BaseModel
      extend OursprivacyIngest::Internal::Type::RequestParameters::Converter
      include OursprivacyIngest::Internal::Type::RequestParameters

      # @!attribute token
      #   The token for your Source. You can find this in the dashboard.
      #
      #   @return [String]
      required :token, String

      # @!attribute event
      #   The name of the event you're tracking. This must be whitelisted in the Ours
      #   dashboard.
      #
      #   @return [String]
      required :event, String

      # @!attribute default_properties
      #   These properties are used throughout the Ours app to pass known values onto
      #   destinations
      #
      #   @return [OursprivacyIngest::Models::TrackEventParams::DefaultProperties, nil]
      optional :default_properties,
               -> { OursprivacyIngest::TrackEventParams::DefaultProperties },
               api_name: :defaultProperties,
               nil?: true

      # @!attribute distinct_id
      #   A unique identifier for this event used for deduplication. Highly recommended —
      #   if omitted, Ours will generate one for you, but supplying your own gives you
      #   stronger idempotency guarantees (e.g. a Stripe payment intent ID or your
      #   internal order ID).
      #
      #   @return [String, nil]
      optional :distinct_id, String, api_name: :distinctId, nil?: true

      # @!attribute email
      #   The email address of a user. Used as a fallback lookup when neither userId nor
      #   externalId is provided. We search your account for a visitor with this email and
      #   attach the event to them. If no match is found, a new visitor is created.
      #
      #   @return [String, nil]
      optional :email, String, nil?: true

      # @!attribute event_properties
      #   Any additional event properties you want to pass along.
      #
      #   @return [Hash{Symbol=>String, nil}, nil]
      optional :event_properties,
               OursprivacyIngest::Internal::Type::HashOf[String, nil?: true],
               api_name: :eventProperties,
               nil?: true

      # @!attribute external_id
      #   Your system's unique identifier for this user. We search your account for an
      #   existing visitor with this externalId and attach the event to them (resolving to
      #   their Ours Visitor ID). If no match is found, a new visitor is created. When
      #   present, email lookup is skipped. If you also have the userId from cookies or
      #   local storage, send both — it removes the lookup round-trip.
      #
      #   @return [String, nil]
      optional :external_id, String, api_name: :externalId, nil?: true

      # @!attribute identity_context
      #   End-user network context for server-side calls. Required for probabilistic
      #   identity resolution when the caller is a backend server rather than an end-user
      #   browser.
      #
      #   @return [OursprivacyIngest::Models::TrackEventParams::IdentityContext, nil]
      optional :identity_context,
               -> { OursprivacyIngest::TrackEventParams::IdentityContext },
               api_name: :identityContext,
               nil?: true

      # @!attribute time
      #   The time at which the event occurred in milliseconds since UTC epoch. The time
      #   must be in the past and within the last 7 days.
      #
      #   @return [Float, nil]
      optional :time, Float, nil?: true

      # @!attribute user_id
      #   The Ours Visitor ID stored in local storage and cookies on your web properties.
      #   When present, this is used directly — no lookup by externalId or email is
      #   performed. If you have both a userId and an externalId, send both so the event
      #   is attached to the right visitor without any lookup overhead.
      #
      #   @return [String, nil]
      optional :user_id, String, api_name: :userId, nil?: true

      # @!attribute user_properties
      #   Properties to set on the visitor. (optional) You can also update these
      #   properties via the identify endpoint.
      #
      #   @return [OursprivacyIngest::Models::TrackEventParams::UserProperties, nil]
      optional :user_properties,
               -> { OursprivacyIngest::TrackEventParams::UserProperties },
               api_name: :userProperties,
               nil?: true

      # @!method initialize(token:, event:, default_properties: nil, distinct_id: nil, email: nil, event_properties: nil, external_id: nil, identity_context: nil, time: nil, user_id: nil, user_properties: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {OursprivacyIngest::Models::TrackEventParams} for more details.
      #
      #   @param token [String] The token for your Source. You can find this in the dashboard.
      #
      #   @param event [String] The name of the event you're tracking. This must be whitelisted in the Ours dash
      #
      #   @param default_properties [OursprivacyIngest::Models::TrackEventParams::DefaultProperties, nil] These properties are used throughout the Ours app to pass known values onto dest
      #
      #   @param distinct_id [String, nil] A unique identifier for this event used for deduplication. Highly recommended —
      #
      #   @param email [String, nil] The email address of a user. Used as a fallback lookup when neither userId nor e
      #
      #   @param event_properties [Hash{Symbol=>String, nil}, nil] Any additional event properties you want to pass along.
      #
      #   @param external_id [String, nil] Your system's unique identifier for this user. We search your account for an exi
      #
      #   @param identity_context [OursprivacyIngest::Models::TrackEventParams::IdentityContext, nil] End-user network context for server-side calls. Required for probabilistic ident
      #
      #   @param time [Float, nil] The time at which the event occurred in milliseconds since UTC epoch. The time m
      #
      #   @param user_id [String, nil] The Ours Visitor ID stored in local storage and cookies on your web properties.
      #
      #   @param user_properties [OursprivacyIngest::Models::TrackEventParams::UserProperties, nil] Properties to set on the visitor. (optional) You can also update these propertie
      #
      #   @param request_options [OursprivacyIngest::RequestOptions, Hash{Symbol=>Object}]

      class DefaultProperties < OursprivacyIngest::Internal::Type::BaseModel
        # @!attribute _ef_transaction_id
        #   The Everflow affiliate Click (Transaction) ID, captured from the
        #   `_ef_transaction_id` URL parameter. Ex: ef_click_abc123
        #
        #   @return [String, nil]
        optional :_ef_transaction_id, String, nil?: true

        # @!attribute active_duration
        #   The active time in milliseconds that the user had this tab active
        #
        #   @return [Float, nil]
        optional :active_duration, Float, api_name: :activeDuration, nil?: true

        # @!attribute ad_id
        #   The ad id for detected in the session. This is set by the web sdk automatically.
        #
        #   @return [String, nil]
        optional :ad_id, String, nil?: true

        # @!attribute admitad_uid
        #   The Admitad (Mitgo) affiliate Click ID. Ex: admitad_uid_abc123
        #
        #   @return [String, nil]
        optional :admitad_uid, String, nil?: true

        # @!attribute adset_id
        #   The adset id for detected in the session. This is set by the web sdk
        #   automatically.
        #
        #   @return [String, nil]
        optional :adset_id, String, nil?: true

        # @!attribute alart
        #   The AppLovin alart query parameter. Ex: alart123
        #
        #   @return [String, nil]
        optional :alart, String, nil?: true

        # @!attribute aleid
        #   The AppLovin aleid query parameter. Ex: aleid123
        #
        #   @return [String, nil]
        optional :aleid, String, nil?: true

        # @!attribute axwrt
        #   The AppLovin Axon pixel cookie value (\_axwrt). Web-only.
        #
        #   @return [String, nil]
        optional :axwrt, String, nil?: true

        # @!attribute basis_cid
        #   The Basis DSP Click ID. Ex: basis_cid123
        #
        #   @return [String, nil]
        optional :basis_cid, String, nil?: true

        # @!attribute browser_language
        #   The language of the browser. Ex: en-US
        #
        #   @return [String, nil]
        optional :browser_language, String, nil?: true

        # @!attribute browser_name
        #   The name of the browser. Ex: Chrome
        #
        #   @return [String, nil]
        optional :browser_name, String, nil?: true

        # @!attribute browser_version
        #   The version of the browser. Ex: 114.0
        #
        #   @return [String, nil]
        optional :browser_version, String, nil?: true

        # @!attribute campaign_id
        #   The campaign id for detected in the session. This is set by the web sdk
        #   automatically.
        #
        #   @return [String, nil]
        optional :campaign_id, String, nil?: true

        # @!attribute clickid
        #   The Click ID. Ex: clickid123
        #
        #   @return [String, nil]
        optional :clickid, String, nil?: true

        # @!attribute clid
        #   The Generic Click ID. Ex: clid123
        #
        #   @return [String, nil]
        optional :clid, String, nil?: true

        # @!attribute cpu_architecture
        #   The architecture of the CPU. Ex: x64
        #
        #   @return [String, nil]
        optional :cpu_architecture, String, nil?: true

        # @!attribute current_url
        #   The full url (including query params) of the current page
        #
        #   @return [String, nil]
        optional :current_url, String, nil?: true

        # @!attribute dclid
        #   The DoubleClick Click ID. Ex: dclid123
        #
        #   @return [String, nil]
        optional :dclid, String, nil?: true

        # @!attribute device_model
        #   The model of the device. Ex: iPhone 13
        #
        #   @return [String, nil]
        optional :device_model, String, nil?: true

        # @!attribute device_type
        #   The type of device the user is using. Ex: mobile
        #
        #   @return [String, nil]
        optional :device_type, String, nil?: true

        # @!attribute device_vendor
        #   The vendor of the device. Ex: Apple
        #
        #   @return [String, nil]
        optional :device_vendor, String, nil?: true

        # @!attribute duration
        #   The time in milliseconds since the page was loaded // script was loaded
        #
        #   @return [Float, nil]
        optional :duration, Float, nil?: true

        # @!attribute encoding
        #   The browsers encoding. Ex: UTF-8
        #
        #   @return [String, nil]
        optional :encoding, String, nil?: true

        # @!attribute engine_name
        #   The name of the browser engine. Ex: Blink
        #
        #   @return [String, nil]
        optional :engine_name, String, nil?: true

        # @!attribute engine_version
        #   The version of the browser engine. Ex: 114.0
        #
        #   @return [String, nil]
        optional :engine_version, String, nil?: true

        # @!attribute epik
        #   The Pinterest Click ID. Ex: epik456
        #
        #   @return [String, nil]
        optional :epik, String, nil?: true

        # @!attribute fbc
        #   Facebook Click ID with prefix format for Conversions API tracking. Ex:
        #   fb.1.1554763741205.AbCdEfGhIjKlMnOpQrStUvWxYz1234567890
        #
        #   @return [String, nil]
        optional :fbc, String, nil?: true

        # @!attribute fbclid
        #   Raw Facebook Click ID query parameter without prefix from ad clicks. Ex:
        #   AbCdEfGhIjKlMnOpQrStUvWxYz1234567890
        #
        #   @return [String, nil]
        optional :fbclid, String, nil?: true

        # @!attribute fbp
        #   Facebook Browser ID parameter for identifying browsers and attributing events.
        #   Ex: fb.1.1554763741205.1098115397
        #
        #   @return [String, nil]
        optional :fbp, String, nil?: true

        # @!attribute fv
        #   Deprecated
        #
        #   @return [Boolean, nil]
        optional :fv, OursprivacyIngest::Internal::Type::Boolean, nil?: true

        # @!attribute gad_source
        #   The Google Ad Source. Ex: google
        #
        #   @return [String, nil]
        optional :gad_source, String, nil?: true

        # @!attribute gbraid
        #   The Google Braid ID. Ex: gbraid123
        #
        #   @return [String, nil]
        optional :gbraid, String, nil?: true

        # @!attribute gclid
        #   The Google Click ID. Ex: gclid123
        #
        #   @return [String, nil]
        optional :gclid, String, nil?: true

        # @!attribute host
        #   The host of the current page. Ex: example.com
        #
        #   @return [String, nil]
        optional :host, String, nil?: true

        # @!attribute iframe
        #   Whether the user is in an iframe. Ex: true
        #
        #   @return [Boolean, nil]
        optional :iframe, OursprivacyIngest::Internal::Type::Boolean, nil?: true

        # @!attribute im_ref
        #   The Impact Click ID reference. Ex: im_ref123
        #
        #   @return [String, nil]
        optional :im_ref, String, nil?: true

        # @!attribute ip
        #   The IP address of the user. Ex: 127.0.0.1
        #
        #   @return [String, nil]
        optional :ip, String, nil?: true

        # @!attribute irclickid
        #   The Impact Click ID. Ex: irclickid123
        #
        #   @return [String, nil]
        optional :irclickid, String, nil?: true

        # @!attribute is_bot
        #   Whether we have detected that the user is a bot. This is set automatically by
        #   the Ours server primarily for events tracked through the web SDK.
        #
        #   @return [String, nil]
        optional :is_bot, String, nil?: true

        # @!attribute li_fat_id
        #   The LinkedIn Click ID. Ex: li_fat_id123
        #
        #   @return [String, nil]
        optional :li_fat_id, String, nil?: true

        # @!attribute msclkid
        #   The Microsoft Click ID. Ex: msclkid123
        #
        #   @return [String, nil]
        optional :msclkid, String, nil?: true

        # @!attribute ndclid
        #   The NextDoor Click ID. Ex: ndclid123
        #
        #   @return [String, nil]
        optional :ndclid, String, nil?: true

        # @!attribute new_s
        #   Deprecated
        #
        #   @return [Boolean, nil]
        optional :new_s, OursprivacyIngest::Internal::Type::Boolean, nil?: true

        # @!attribute os_name
        #   The name of the operating system. Ex: Windows
        #
        #   @return [String, nil]
        optional :os_name, String, nil?: true

        # @!attribute os_version
        #   The version of the operating system. Ex: 10.0
        #
        #   @return [String, nil]
        optional :os_version, String, nil?: true

        # @!attribute page_hash
        #   A random set of numbers for the page load
        #
        #   @return [Float, nil]
        optional :page_hash, Float, nil?: true

        # @!attribute pathname
        #   The pathname of the current page. Ex: /home
        #
        #   @return [String, nil]
        optional :pathname, String, nil?: true

        # @!attribute qclid
        #   The Quora Click ID. Ex: qclid123
        #
        #   @return [String, nil]
        optional :qclid, String, nil?: true

        # @!attribute rdt_cid
        #   The Reddit Click ID. Ex: rdt_cid123
        #
        #   @return [String, nil]
        optional :rdt_cid, String, nil?: true

        # @!attribute received_at
        #   The time the event was received by an Ours server in ISO format
        #
        #   @return [String, nil]
        optional :received_at, String, nil?: true

        # @!attribute referrer
        #   The referrer URL of the current page
        #
        #   @return [String, nil]
        optional :referrer, String, nil?: true

        # @!attribute referring_domain
        #   The referring domain of the current page
        #
        #   @return [String, nil]
        optional :referring_domain, String, nil?: true

        # @!attribute sacid
        #   The StackAdapt Tracking ID. Ex: sacid123
        #
        #   @return [String, nil]
        optional :sacid, String, nil?: true

        # @!attribute sccid
        #   The SnapChat Click ID. Ex: sccid123
        #
        #   @return [String, nil]
        optional :sccid, String, nil?: true

        # @!attribute screen_height
        #   The height of the screen. Ex: 1080
        #
        #   @return [Float, nil]
        optional :screen_height, Float, nil?: true

        # @!attribute screen_width
        #   The width of the screen. Ex: 1920
        #
        #   @return [Float, nil]
        optional :screen_width, Float, nil?: true

        # @!attribute session_count
        #   The number of sessions the user has had. Ex: 3
        #
        #   @return [Float, nil]
        optional :session_count, Float, api_name: :sessionCount, nil?: true

        # @!attribute sid
        #   The session ID as assigned automatically by the web SDK. This is required for
        #   session replay
        #
        #   @return [String, nil]
        optional :sid, String, nil?: true

        # @!attribute sr
        #
        #   @return [String, nil]
        optional :sr, String, nil?: true

        # @!attribute title
        #   The title of the current page
        #
        #   @return [String, nil]
        optional :title, String, nil?: true

        # @!attribute ttclid
        #   The TikTok Click ID. Ex: ttclid123
        #
        #   @return [String, nil]
        optional :ttclid, String, nil?: true

        # @!attribute twclid
        #   The Twitter Click ID. Ex: twclid123
        #
        #   @return [String, nil]
        optional :twclid, String, nil?: true

        # @!attribute uafvl
        #   User agent as a full list of strings.
        #
        #   @return [String, nil]
        optional :uafvl, String, nil?: true

        # @!attribute user_agent
        #   The user agent of the browser
        #
        #   @return [String, nil]
        optional :user_agent, String, nil?: true

        # @!attribute utm_campaign
        #   The UTM Campaign. The web SDK automatically captures this from the query params.
        #
        #   @return [String, nil]
        optional :utm_campaign, String, nil?: true

        # @!attribute utm_content
        #   The UTM Content. The web SDK automatically captures this from the query params.
        #
        #   @return [String, nil]
        optional :utm_content, String, nil?: true

        # @!attribute utm_medium
        #   The UTM Medium. The web SDK automatically captures this from the query params.
        #
        #   @return [String, nil]
        optional :utm_medium, String, nil?: true

        # @!attribute utm_name
        #   The UTM Name. The web SDK automatically captures this from the query params.
        #
        #   @return [String, nil]
        optional :utm_name, String, nil?: true

        # @!attribute utm_source
        #   The UTM Source. The web SDK automatically captures this from the query params.
        #
        #   @return [String, nil]
        optional :utm_source, String, nil?: true

        # @!attribute utm_term
        #   The UTM Term. The web SDK automatically captures this from the query params.
        #
        #   @return [String, nil]
        optional :utm_term, String, nil?: true

        # @!attribute version
        #   The version of the web SDK
        #
        #   @return [String, nil]
        optional :version, String, nil?: true

        # @!attribute wbraid
        #   The WBRAID Identifier. The web SDK automatically captures this from the query
        #   params.
        #
        #   @return [String, nil]
        optional :wbraid, String, nil?: true

        # @!attribute webview
        #   Whether the user is in a webview. Ex: true
        #
        #   @return [Boolean, nil]
        optional :webview, OursprivacyIngest::Internal::Type::Boolean, nil?: true

        # @!method initialize(_ef_transaction_id: nil, active_duration: nil, ad_id: nil, admitad_uid: nil, adset_id: nil, alart: nil, aleid: nil, axwrt: nil, basis_cid: nil, browser_language: nil, browser_name: nil, browser_version: nil, campaign_id: nil, clickid: nil, clid: nil, cpu_architecture: nil, current_url: nil, dclid: nil, device_model: nil, device_type: nil, device_vendor: nil, duration: nil, encoding: nil, engine_name: nil, engine_version: nil, epik: nil, fbc: nil, fbclid: nil, fbp: nil, fv: nil, gad_source: nil, gbraid: nil, gclid: nil, host: nil, iframe: nil, im_ref: nil, ip: nil, irclickid: nil, is_bot: nil, li_fat_id: nil, msclkid: nil, ndclid: nil, new_s: nil, os_name: nil, os_version: nil, page_hash: nil, pathname: nil, qclid: nil, rdt_cid: nil, received_at: nil, referrer: nil, referring_domain: nil, sacid: nil, sccid: nil, screen_height: nil, screen_width: nil, session_count: nil, sid: nil, sr: nil, title: nil, ttclid: nil, twclid: nil, uafvl: nil, user_agent: nil, utm_campaign: nil, utm_content: nil, utm_medium: nil, utm_name: nil, utm_source: nil, utm_term: nil, version: nil, wbraid: nil, webview: nil)
        #   Some parameter documentations has been truncated, see
        #   {OursprivacyIngest::Models::TrackEventParams::DefaultProperties} for more
        #   details.
        #
        #   These properties are used throughout the Ours app to pass known values onto
        #   destinations
        #
        #   @param _ef_transaction_id [String, nil] The Everflow affiliate Click (Transaction) ID, captured from the
        #   `\_ef_transactio
        #
        #   @param active_duration [Float, nil] The active time in milliseconds that the user had this tab active
        #
        #   @param ad_id [String, nil] The ad id for detected in the session. This is set by the web sdk automatically.
        #
        #   @param admitad_uid [String, nil] The Admitad (Mitgo) affiliate Click ID. Ex: admitad_uid_abc123
        #
        #   @param adset_id [String, nil] The adset id for detected in the session. This is set by the web sdk automatical
        #
        #   @param alart [String, nil] The AppLovin alart query parameter. Ex: alart123
        #
        #   @param aleid [String, nil] The AppLovin aleid query parameter. Ex: aleid123
        #
        #   @param axwrt [String, nil] The AppLovin Axon pixel cookie value (\_axwrt). Web-only.
        #
        #   @param basis_cid [String, nil] The Basis DSP Click ID. Ex: basis_cid123
        #
        #   @param browser_language [String, nil] The language of the browser. Ex: en-US
        #
        #   @param browser_name [String, nil] The name of the browser. Ex: Chrome
        #
        #   @param browser_version [String, nil] The version of the browser. Ex: 114.0
        #
        #   @param campaign_id [String, nil] The campaign id for detected in the session. This is set by the web sdk automati
        #
        #   @param clickid [String, nil] The Click ID. Ex: clickid123
        #
        #   @param clid [String, nil] The Generic Click ID. Ex: clid123
        #
        #   @param cpu_architecture [String, nil] The architecture of the CPU. Ex: x64
        #
        #   @param current_url [String, nil] The full url (including query params) of the current page
        #
        #   @param dclid [String, nil] The DoubleClick Click ID. Ex: dclid123
        #
        #   @param device_model [String, nil] The model of the device. Ex: iPhone 13
        #
        #   @param device_type [String, nil] The type of device the user is using. Ex: mobile
        #
        #   @param device_vendor [String, nil] The vendor of the device. Ex: Apple
        #
        #   @param duration [Float, nil] The time in milliseconds since the page was loaded // script was loaded
        #
        #   @param encoding [String, nil] The browsers encoding. Ex: UTF-8
        #
        #   @param engine_name [String, nil] The name of the browser engine. Ex: Blink
        #
        #   @param engine_version [String, nil] The version of the browser engine. Ex: 114.0
        #
        #   @param epik [String, nil] The Pinterest Click ID. Ex: epik456
        #
        #   @param fbc [String, nil] Facebook Click ID with prefix format for Conversions API tracking. Ex: fb.1.1554
        #
        #   @param fbclid [String, nil] Raw Facebook Click ID query parameter without prefix from ad clicks. Ex: AbCdEfG
        #
        #   @param fbp [String, nil] Facebook Browser ID parameter for identifying browsers and attributing events. E
        #
        #   @param fv [Boolean, nil] Deprecated
        #
        #   @param gad_source [String, nil] The Google Ad Source. Ex: google
        #
        #   @param gbraid [String, nil] The Google Braid ID. Ex: gbraid123
        #
        #   @param gclid [String, nil] The Google Click ID. Ex: gclid123
        #
        #   @param host [String, nil] The host of the current page. Ex: example.com
        #
        #   @param iframe [Boolean, nil] Whether the user is in an iframe. Ex: true
        #
        #   @param im_ref [String, nil] The Impact Click ID reference. Ex: im_ref123
        #
        #   @param ip [String, nil] The IP address of the user. Ex: 127.0.0.1
        #
        #   @param irclickid [String, nil] The Impact Click ID. Ex: irclickid123
        #
        #   @param is_bot [String, nil] Whether we have detected that the user is a bot. This is set automatically by th
        #
        #   @param li_fat_id [String, nil] The LinkedIn Click ID. Ex: li_fat_id123
        #
        #   @param msclkid [String, nil] The Microsoft Click ID. Ex: msclkid123
        #
        #   @param ndclid [String, nil] The NextDoor Click ID. Ex: ndclid123
        #
        #   @param new_s [Boolean, nil] Deprecated
        #
        #   @param os_name [String, nil] The name of the operating system. Ex: Windows
        #
        #   @param os_version [String, nil] The version of the operating system. Ex: 10.0
        #
        #   @param page_hash [Float, nil] A random set of numbers for the page load
        #
        #   @param pathname [String, nil] The pathname of the current page. Ex: /home
        #
        #   @param qclid [String, nil] The Quora Click ID. Ex: qclid123
        #
        #   @param rdt_cid [String, nil] The Reddit Click ID. Ex: rdt_cid123
        #
        #   @param received_at [String, nil] The time the event was received by an Ours server in ISO format
        #
        #   @param referrer [String, nil] The referrer URL of the current page
        #
        #   @param referring_domain [String, nil] The referring domain of the current page
        #
        #   @param sacid [String, nil] The StackAdapt Tracking ID. Ex: sacid123
        #
        #   @param sccid [String, nil] The SnapChat Click ID. Ex: sccid123
        #
        #   @param screen_height [Float, nil] The height of the screen. Ex: 1080
        #
        #   @param screen_width [Float, nil] The width of the screen. Ex: 1920
        #
        #   @param session_count [Float, nil] The number of sessions the user has had. Ex: 3
        #
        #   @param sid [String, nil] The session ID as assigned automatically by the web SDK. This is required for se
        #
        #   @param sr [String, nil]
        #
        #   @param title [String, nil] The title of the current page
        #
        #   @param ttclid [String, nil] The TikTok Click ID. Ex: ttclid123
        #
        #   @param twclid [String, nil] The Twitter Click ID. Ex: twclid123
        #
        #   @param uafvl [String, nil] User agent as a full list of strings.
        #
        #   @param user_agent [String, nil] The user agent of the browser
        #
        #   @param utm_campaign [String, nil] The UTM Campaign. The web SDK automatically captures this from the query params.
        #
        #   @param utm_content [String, nil] The UTM Content. The web SDK automatically captures this from the query params.
        #
        #   @param utm_medium [String, nil] The UTM Medium. The web SDK automatically captures this from the query params.
        #
        #   @param utm_name [String, nil] The UTM Name. The web SDK automatically captures this from the query params.
        #
        #   @param utm_source [String, nil] The UTM Source. The web SDK automatically captures this from the query params.
        #
        #   @param utm_term [String, nil] The UTM Term. The web SDK automatically captures this from the query params.
        #
        #   @param version [String, nil] The version of the web SDK
        #
        #   @param wbraid [String, nil] The WBRAID Identifier. The web SDK automatically captures this from the query pa
        #
        #   @param webview [Boolean, nil] Whether the user is in a webview. Ex: true
      end

      class IdentityContext < OursprivacyIngest::Internal::Type::BaseModel
        # @!attribute ip
        #   The end-user IP address (not the server IP).
        #
        #   @return [String]
        required :ip, String

        # @!attribute user_agent
        #   The end-user User-Agent string (not the server UA).
        #
        #   @return [String]
        required :user_agent, String, api_name: :userAgent

        # @!method initialize(ip:, user_agent:)
        #   End-user network context for server-side calls. Required for probabilistic
        #   identity resolution when the caller is a backend server rather than an end-user
        #   browser.
        #
        #   @param ip [String] The end-user IP address (not the server IP).
        #
        #   @param user_agent [String] The end-user User-Agent string (not the server UA).
      end

      class UserProperties < OursprivacyIngest::Internal::Type::BaseModel
        # @!attribute _ef_transaction_id
        #
        #   @return [String, nil]
        optional :_ef_transaction_id, String, nil?: true

        # @!attribute ad_id
        #
        #   @return [String, nil]
        optional :ad_id, String, nil?: true

        # @!attribute admitad_uid
        #
        #   @return [String, nil]
        optional :admitad_uid, String, nil?: true

        # @!attribute adset_id
        #
        #   @return [String, nil]
        optional :adset_id, String, nil?: true

        # @!attribute alart
        #
        #   @return [String, nil]
        optional :alart, String, nil?: true

        # @!attribute aleid
        #
        #   @return [String, nil]
        optional :aleid, String, nil?: true

        # @!attribute axwrt
        #
        #   @return [String, nil]
        optional :axwrt, String, nil?: true

        # @!attribute basis_cid
        #
        #   @return [String, nil]
        optional :basis_cid, String, nil?: true

        # @!attribute campaign_id
        #
        #   @return [String, nil]
        optional :campaign_id, String, nil?: true

        # @!attribute city
        #
        #   @return [String, nil]
        optional :city, String, nil?: true

        # @!attribute clickid
        #
        #   @return [String, nil]
        optional :clickid, String, nil?: true

        # @!attribute clid
        #
        #   @return [String, nil]
        optional :clid, String, nil?: true

        # @!attribute company_name
        #
        #   @return [String, nil]
        optional :company_name, String, nil?: true

        # @!attribute consent
        #
        #   @return [Hash{Symbol=>String, nil}, nil]
        optional :consent, OursprivacyIngest::Internal::Type::HashOf[String, nil?: true], nil?: true

        # @!attribute country
        #
        #   @return [String, nil]
        optional :country, String, nil?: true

        # @!attribute custom_properties
        #
        #   @return [Hash{Symbol=>String, nil}, nil]
        optional :custom_properties, OursprivacyIngest::Internal::Type::HashOf[String, nil?: true], nil?: true

        # @!attribute date_of_birth
        #
        #   @return [String, nil]
        optional :date_of_birth, String, nil?: true

        # @!attribute dclid
        #
        #   @return [String, nil]
        optional :dclid, String, nil?: true

        # @!attribute email
        #
        #   @return [String, nil]
        optional :email, String, nil?: true

        # @!attribute epik
        #
        #   @return [String, nil]
        optional :epik, String, nil?: true

        # @!attribute external_id
        #
        #   @return [String, nil]
        optional :external_id, String, nil?: true

        # @!attribute fbc
        #
        #   @return [String, nil]
        optional :fbc, String, nil?: true

        # @!attribute fbclid
        #
        #   @return [String, nil]
        optional :fbclid, String, nil?: true

        # @!attribute fbp
        #
        #   @return [String, nil]
        optional :fbp, String, nil?: true

        # @!attribute first_name
        #
        #   @return [String, nil]
        optional :first_name, String, nil?: true

        # @!attribute gad_source
        #
        #   @return [String, nil]
        optional :gad_source, String, nil?: true

        # @!attribute gbraid
        #
        #   @return [String, nil]
        optional :gbraid, String, nil?: true

        # @!attribute gclid
        #
        #   @return [String, nil]
        optional :gclid, String, nil?: true

        # @!attribute gender
        #
        #   @return [String, nil]
        optional :gender, String, nil?: true

        # @!attribute im_ref
        #
        #   @return [String, nil]
        optional :im_ref, String, nil?: true

        # @!attribute ip
        #   The IP address of the user
        #
        #   @return [String, nil]
        optional :ip, String, nil?: true

        # @!attribute irclickid
        #
        #   @return [String, nil]
        optional :irclickid, String, nil?: true

        # @!attribute is_bot
        #
        #   @return [String, nil]
        optional :is_bot, String, nil?: true

        # @!attribute job_title
        #
        #   @return [String, nil]
        optional :job_title, String, nil?: true

        # @!attribute last_name
        #
        #   @return [String, nil]
        optional :last_name, String, nil?: true

        # @!attribute li_fat_id
        #
        #   @return [String, nil]
        optional :li_fat_id, String, nil?: true

        # @!attribute msclkid
        #
        #   @return [String, nil]
        optional :msclkid, String, nil?: true

        # @!attribute ndclid
        #
        #   @return [String, nil]
        optional :ndclid, String, nil?: true

        # @!attribute phone_number
        #
        #   @return [String, nil]
        optional :phone_number, String, nil?: true

        # @!attribute qclid
        #
        #   @return [String, nil]
        optional :qclid, String, nil?: true

        # @!attribute rdt_cid
        #
        #   @return [String, nil]
        optional :rdt_cid, String, nil?: true

        # @!attribute referrer
        #
        #   @return [String, nil]
        optional :referrer, String, nil?: true

        # @!attribute referring_domain
        #
        #   @return [String, nil]
        optional :referring_domain, String, nil?: true

        # @!attribute sacid
        #
        #   @return [String, nil]
        optional :sacid, String, nil?: true

        # @!attribute sccid
        #
        #   @return [String, nil]
        optional :sccid, String, nil?: true

        # @!attribute sid
        #
        #   @return [String, nil]
        optional :sid, String, nil?: true

        # @!attribute state
        #
        #   @return [String, nil]
        optional :state, String, nil?: true

        # @!attribute ttclid
        #
        #   @return [String, nil]
        optional :ttclid, String, nil?: true

        # @!attribute twclid
        #
        #   @return [String, nil]
        optional :twclid, String, nil?: true

        # @!attribute user_agent
        #
        #   @return [String, nil]
        optional :user_agent, String, nil?: true

        # @!attribute user_agent_full_list
        #
        #   @return [String, nil]
        optional :user_agent_full_list, String, nil?: true

        # @!attribute utm_campaign
        #
        #   @return [String, nil]
        optional :utm_campaign, String, nil?: true

        # @!attribute utm_content
        #
        #   @return [String, nil]
        optional :utm_content, String, nil?: true

        # @!attribute utm_medium
        #
        #   @return [String, nil]
        optional :utm_medium, String, nil?: true

        # @!attribute utm_name
        #
        #   @return [String, nil]
        optional :utm_name, String, nil?: true

        # @!attribute utm_source
        #
        #   @return [String, nil]
        optional :utm_source, String, nil?: true

        # @!attribute utm_term
        #
        #   @return [String, nil]
        optional :utm_term, String, nil?: true

        # @!attribute wbraid
        #
        #   @return [String, nil]
        optional :wbraid, String, nil?: true

        # @!attribute zip
        #
        #   @return [String, nil]
        optional :zip, String, nil?: true

        # @!method initialize(_ef_transaction_id: nil, ad_id: nil, admitad_uid: nil, adset_id: nil, alart: nil, aleid: nil, axwrt: nil, basis_cid: nil, campaign_id: nil, city: nil, clickid: nil, clid: nil, company_name: nil, consent: nil, country: nil, custom_properties: nil, date_of_birth: nil, dclid: nil, email: nil, epik: nil, external_id: nil, fbc: nil, fbclid: nil, fbp: nil, first_name: nil, gad_source: nil, gbraid: nil, gclid: nil, gender: nil, im_ref: nil, ip: nil, irclickid: nil, is_bot: nil, job_title: nil, last_name: nil, li_fat_id: nil, msclkid: nil, ndclid: nil, phone_number: nil, qclid: nil, rdt_cid: nil, referrer: nil, referring_domain: nil, sacid: nil, sccid: nil, sid: nil, state: nil, ttclid: nil, twclid: nil, user_agent: nil, user_agent_full_list: nil, utm_campaign: nil, utm_content: nil, utm_medium: nil, utm_name: nil, utm_source: nil, utm_term: nil, wbraid: nil, zip: nil)
        #   Properties to set on the visitor. (optional) You can also update these
        #   properties via the identify endpoint.
        #
        #   @param _ef_transaction_id [String, nil]
        #
        #   @param ad_id [String, nil]
        #
        #   @param admitad_uid [String, nil]
        #
        #   @param adset_id [String, nil]
        #
        #   @param alart [String, nil]
        #
        #   @param aleid [String, nil]
        #
        #   @param axwrt [String, nil]
        #
        #   @param basis_cid [String, nil]
        #
        #   @param campaign_id [String, nil]
        #
        #   @param city [String, nil]
        #
        #   @param clickid [String, nil]
        #
        #   @param clid [String, nil]
        #
        #   @param company_name [String, nil]
        #
        #   @param consent [Hash{Symbol=>String, nil}, nil]
        #
        #   @param country [String, nil]
        #
        #   @param custom_properties [Hash{Symbol=>String, nil}, nil]
        #
        #   @param date_of_birth [String, nil]
        #
        #   @param dclid [String, nil]
        #
        #   @param email [String, nil]
        #
        #   @param epik [String, nil]
        #
        #   @param external_id [String, nil]
        #
        #   @param fbc [String, nil]
        #
        #   @param fbclid [String, nil]
        #
        #   @param fbp [String, nil]
        #
        #   @param first_name [String, nil]
        #
        #   @param gad_source [String, nil]
        #
        #   @param gbraid [String, nil]
        #
        #   @param gclid [String, nil]
        #
        #   @param gender [String, nil]
        #
        #   @param im_ref [String, nil]
        #
        #   @param ip [String, nil] The IP address of the user
        #
        #   @param irclickid [String, nil]
        #
        #   @param is_bot [String, nil]
        #
        #   @param job_title [String, nil]
        #
        #   @param last_name [String, nil]
        #
        #   @param li_fat_id [String, nil]
        #
        #   @param msclkid [String, nil]
        #
        #   @param ndclid [String, nil]
        #
        #   @param phone_number [String, nil]
        #
        #   @param qclid [String, nil]
        #
        #   @param rdt_cid [String, nil]
        #
        #   @param referrer [String, nil]
        #
        #   @param referring_domain [String, nil]
        #
        #   @param sacid [String, nil]
        #
        #   @param sccid [String, nil]
        #
        #   @param sid [String, nil]
        #
        #   @param state [String, nil]
        #
        #   @param ttclid [String, nil]
        #
        #   @param twclid [String, nil]
        #
        #   @param user_agent [String, nil]
        #
        #   @param user_agent_full_list [String, nil]
        #
        #   @param utm_campaign [String, nil]
        #
        #   @param utm_content [String, nil]
        #
        #   @param utm_medium [String, nil]
        #
        #   @param utm_name [String, nil]
        #
        #   @param utm_source [String, nil]
        #
        #   @param utm_term [String, nil]
        #
        #   @param wbraid [String, nil]
        #
        #   @param zip [String, nil]
      end
    end
  end
end
