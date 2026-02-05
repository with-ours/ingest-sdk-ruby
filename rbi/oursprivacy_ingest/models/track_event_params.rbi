# typed: strong

module OursprivacyIngest
  module Models
    class TrackEventParams < OursprivacyIngest::Internal::Type::BaseModel
      extend OursprivacyIngest::Internal::Type::RequestParameters::Converter
      include OursprivacyIngest::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            OursprivacyIngest::TrackEventParams,
            OursprivacyIngest::Internal::AnyHash
          )
        end

      # The token for your Source. You can find this in the dashboard.
      sig { returns(String) }
      attr_accessor :token

      # The name of the event you're tracking. This must be whitelisted in the Ours
      # dashboard.
      sig { returns(String) }
      attr_accessor :event

      # These properties are used throughout the Ours app to pass known values onto
      # destinations
      sig do
        returns(
          T.nilable(OursprivacyIngest::TrackEventParams::DefaultProperties)
        )
      end
      attr_reader :default_properties

      sig do
        params(
          default_properties:
            T.nilable(
              OursprivacyIngest::TrackEventParams::DefaultProperties::OrHash
            )
        ).void
      end
      attr_writer :default_properties

      # A unique identifier for the event. This helps prevent duplicate events.
      sig { returns(T.nilable(String)) }
      attr_accessor :distinct_id

      # The email address of a user. We will associate this event with the user or
      # create a user. Used for lookup if externalId and userId are not included in the
      # request.
      sig { returns(T.nilable(String)) }
      attr_accessor :email

      # Any additional event properties you want to pass along.
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
      attr_accessor :event_properties

      # The externalId (the ID in your system) of a user. We will associate this event
      # with the user or create a user. If included in the request, email lookup is
      # ignored.
      sig { returns(T.nilable(String)) }
      attr_accessor :external_id

      # The time at which the event occurred in milliseconds since UTC epoch. The time
      # must be in the past and within the last 7 days.
      sig { returns(T.nilable(Float)) }
      attr_accessor :time

      # The Ours user id stored in local storage and cookies on your web properties. If
      # userId is included in the request, we do not lookup the user by email or
      # externalId.
      sig { returns(T.nilable(String)) }
      attr_accessor :user_id

      # Properties to set on the visitor. (optional) You can also update these
      # properties via the identify endpoint.
      sig do
        returns(T.nilable(OursprivacyIngest::TrackEventParams::UserProperties))
      end
      attr_reader :user_properties

      sig do
        params(
          user_properties:
            T.nilable(
              OursprivacyIngest::TrackEventParams::UserProperties::OrHash
            )
        ).void
      end
      attr_writer :user_properties

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
          time: T.nilable(Float),
          user_id: T.nilable(String),
          user_properties:
            T.nilable(
              OursprivacyIngest::TrackEventParams::UserProperties::OrHash
            ),
          request_options: OursprivacyIngest::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override.returns(
          {
            token: String,
            event: String,
            default_properties:
              T.nilable(OursprivacyIngest::TrackEventParams::DefaultProperties),
            distinct_id: T.nilable(String),
            email: T.nilable(String),
            event_properties: T.nilable(T::Hash[Symbol, T.nilable(String)]),
            external_id: T.nilable(String),
            time: T.nilable(Float),
            user_id: T.nilable(String),
            user_properties:
              T.nilable(OursprivacyIngest::TrackEventParams::UserProperties),
            request_options: OursprivacyIngest::RequestOptions
          }
        )
      end
      def to_hash
      end

      class DefaultProperties < OursprivacyIngest::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              OursprivacyIngest::TrackEventParams::DefaultProperties,
              OursprivacyIngest::Internal::AnyHash
            )
          end

        # The active time in milliseconds that the user had this tab active
        sig { returns(T.nilable(Float)) }
        attr_accessor :active_duration

        # The ad id for detected in the session. This is set by the web sdk automatically.
        sig { returns(T.nilable(String)) }
        attr_accessor :ad_id

        # The adset id for detected in the session. This is set by the web sdk
        # automatically.
        sig { returns(T.nilable(String)) }
        attr_accessor :adset_id

        # The AppLovin alart query parameter. Ex: alart123
        sig { returns(T.nilable(String)) }
        attr_accessor :alart

        # The AppLovin aleid query parameter. Ex: aleid123
        sig { returns(T.nilable(String)) }
        attr_accessor :aleid

        # The Basis DSP Click ID. Ex: basis_cid123
        sig { returns(T.nilable(String)) }
        attr_accessor :basis_cid

        # The language of the browser. Ex: en-US
        sig { returns(T.nilable(String)) }
        attr_accessor :browser_language

        # The name of the browser. Ex: Chrome
        sig { returns(T.nilable(String)) }
        attr_accessor :browser_name

        # The version of the browser. Ex: 114.0
        sig { returns(T.nilable(String)) }
        attr_accessor :browser_version

        # The campaign id for detected in the session. This is set by the web sdk
        # automatically.
        sig { returns(T.nilable(String)) }
        attr_accessor :campaign_id

        # The Click ID. Ex: clickid123
        sig { returns(T.nilable(String)) }
        attr_accessor :clickid

        # The Generic Click ID. Ex: clid123
        sig { returns(T.nilable(String)) }
        attr_accessor :clid

        # The architecture of the CPU. Ex: x64
        sig { returns(T.nilable(String)) }
        attr_accessor :cpu_architecture

        # The full url (including query params) of the current page
        sig { returns(T.nilable(String)) }
        attr_accessor :current_url

        # The DoubleClick Click ID. Ex: dclid123
        sig { returns(T.nilable(String)) }
        attr_accessor :dclid

        # The model of the device. Ex: iPhone 13
        sig { returns(T.nilable(String)) }
        attr_accessor :device_model

        # The type of device the user is using. Ex: mobile
        sig { returns(T.nilable(String)) }
        attr_accessor :device_type

        # The vendor of the device. Ex: Apple
        sig { returns(T.nilable(String)) }
        attr_accessor :device_vendor

        # The time in milliseconds since the page was loaded // script was loaded
        sig { returns(T.nilable(Float)) }
        attr_accessor :duration

        # The browsers encoding. Ex: UTF-8
        sig { returns(T.nilable(String)) }
        attr_accessor :encoding

        # The name of the browser engine. Ex: Blink
        sig { returns(T.nilable(String)) }
        attr_accessor :engine_name

        # The version of the browser engine. Ex: 114.0
        sig { returns(T.nilable(String)) }
        attr_accessor :engine_version

        # The Pinterest Click ID. Ex: epik456
        sig { returns(T.nilable(String)) }
        attr_accessor :epik

        # Facebook Click ID with prefix format for Conversions API tracking. Ex:
        # fb.1.1554763741205.AbCdEfGhIjKlMnOpQrStUvWxYz1234567890
        sig { returns(T.nilable(String)) }
        attr_accessor :fbc

        # Raw Facebook Click ID query parameter without prefix from ad clicks. Ex:
        # AbCdEfGhIjKlMnOpQrStUvWxYz1234567890
        sig { returns(T.nilable(String)) }
        attr_accessor :fbclid

        # Facebook Browser ID parameter for identifying browsers and attributing events.
        # Ex: fb.1.1554763741205.1098115397
        sig { returns(T.nilable(String)) }
        attr_accessor :fbp

        # Deprecated
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :fv

        # The Google Ad Source. Ex: google
        sig { returns(T.nilable(String)) }
        attr_accessor :gad_source

        # The Google Braid ID. Ex: gbraid123
        sig { returns(T.nilable(String)) }
        attr_accessor :gbraid

        # The Google Click ID. Ex: gclid123
        sig { returns(T.nilable(String)) }
        attr_accessor :gclid

        # The host of the current page. Ex: example.com
        sig { returns(T.nilable(String)) }
        attr_accessor :host

        # Whether the user is in an iframe. Ex: true
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :iframe

        # The Impact Click ID reference. Ex: im_ref123
        sig { returns(T.nilable(String)) }
        attr_accessor :im_ref

        # The IP address of the user. Ex: 127.0.0.1
        sig { returns(T.nilable(String)) }
        attr_accessor :ip

        # The Impact Click ID. Ex: irclickid123
        sig { returns(T.nilable(String)) }
        attr_accessor :irclickid

        # Whether we have detected that the user is a bot. This is set automatically by
        # the Ours server primarily for events tracked through the web SDK.
        sig { returns(T.nilable(String)) }
        attr_accessor :is_bot

        # The LinkedIn Click ID. Ex: li_fat_id123
        sig { returns(T.nilable(String)) }
        attr_accessor :li_fat_id

        # The Microsoft Click ID. Ex: msclkid123
        sig { returns(T.nilable(String)) }
        attr_accessor :msclkid

        # The NextDoor Click ID. Ex: ndclid123
        sig { returns(T.nilable(String)) }
        attr_accessor :ndclid

        # Deprecated
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :new_s

        # The name of the operating system. Ex: Windows
        sig { returns(T.nilable(String)) }
        attr_accessor :os_name

        # The version of the operating system. Ex: 10.0
        sig { returns(T.nilable(String)) }
        attr_accessor :os_version

        # A random set of numbers for the page load
        sig { returns(T.nilable(Float)) }
        attr_accessor :page_hash

        # The pathname of the current page. Ex: /home
        sig { returns(T.nilable(String)) }
        attr_accessor :pathname

        # The Quora Click ID. Ex: qclid123
        sig { returns(T.nilable(String)) }
        attr_accessor :qclid

        # The Reddit Click ID. Ex: rdt_cid123
        sig { returns(T.nilable(String)) }
        attr_accessor :rdt_cid

        # The time the event was received by an Ours server in ISO format
        sig { returns(T.nilable(String)) }
        attr_accessor :received_at

        # The referrer URL of the current page
        sig { returns(T.nilable(String)) }
        attr_accessor :referrer

        # The referring domain of the current page
        sig { returns(T.nilable(String)) }
        attr_accessor :referring_domain

        # The StackAdapt Tracking ID. Ex: sacid123
        sig { returns(T.nilable(String)) }
        attr_accessor :sacid

        # The SnapChat Click ID. Ex: sccid123
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
        # session replay
        sig { returns(T.nilable(String)) }
        attr_accessor :sid

        sig { returns(T.nilable(String)) }
        attr_accessor :sr

        # The title of the current page
        sig { returns(T.nilable(String)) }
        attr_accessor :title

        # The TikTok Click ID. Ex: ttclid123
        sig { returns(T.nilable(String)) }
        attr_accessor :ttclid

        # The Twitter Click ID. Ex: twclid123
        sig { returns(T.nilable(String)) }
        attr_accessor :twclid

        # User agent as a full list of strings.
        sig { returns(T.nilable(String)) }
        attr_accessor :uafvl

        # The user agent of the browser
        sig { returns(T.nilable(String)) }
        attr_accessor :user_agent

        # The UTM Campaign. The web SDK automatically captures this from the query params.
        sig { returns(T.nilable(String)) }
        attr_accessor :utm_campaign

        # The UTM Content. The web SDK automatically captures this from the query params.
        sig { returns(T.nilable(String)) }
        attr_accessor :utm_content

        # The UTM Medium. The web SDK automatically captures this from the query params.
        sig { returns(T.nilable(String)) }
        attr_accessor :utm_medium

        # The UTM Name. The web SDK automatically captures this from the query params.
        sig { returns(T.nilable(String)) }
        attr_accessor :utm_name

        # The UTM Source. The web SDK automatically captures this from the query params.
        sig { returns(T.nilable(String)) }
        attr_accessor :utm_source

        # The UTM Term. The web SDK automatically captures this from the query params.
        sig { returns(T.nilable(String)) }
        attr_accessor :utm_term

        # The version of the web SDK
        sig { returns(T.nilable(String)) }
        attr_accessor :version

        # The WBRAID Identifier. The web SDK automatically captures this from the query
        # params.
        sig { returns(T.nilable(String)) }
        attr_accessor :wbraid

        # Whether the user is in a webview. Ex: true
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :webview

        # These properties are used throughout the Ours app to pass known values onto
        # destinations
        sig do
          params(
            active_duration: T.nilable(Float),
            ad_id: T.nilable(String),
            adset_id: T.nilable(String),
            alart: T.nilable(String),
            aleid: T.nilable(String),
            basis_cid: T.nilable(String),
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
            host: T.nilable(String),
            iframe: T.nilable(T::Boolean),
            im_ref: T.nilable(String),
            ip: T.nilable(String),
            irclickid: T.nilable(String),
            is_bot: T.nilable(String),
            li_fat_id: T.nilable(String),
            msclkid: T.nilable(String),
            ndclid: T.nilable(String),
            new_s: T.nilable(T::Boolean),
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
            wbraid: T.nilable(String),
            webview: T.nilable(T::Boolean)
          ).returns(T.attached_class)
        end
        def self.new(
          # The active time in milliseconds that the user had this tab active
          active_duration: nil,
          # The ad id for detected in the session. This is set by the web sdk automatically.
          ad_id: nil,
          # The adset id for detected in the session. This is set by the web sdk
          # automatically.
          adset_id: nil,
          # The AppLovin alart query parameter. Ex: alart123
          alart: nil,
          # The AppLovin aleid query parameter. Ex: aleid123
          aleid: nil,
          # The Basis DSP Click ID. Ex: basis_cid123
          basis_cid: nil,
          # The language of the browser. Ex: en-US
          browser_language: nil,
          # The name of the browser. Ex: Chrome
          browser_name: nil,
          # The version of the browser. Ex: 114.0
          browser_version: nil,
          # The campaign id for detected in the session. This is set by the web sdk
          # automatically.
          campaign_id: nil,
          # The Click ID. Ex: clickid123
          clickid: nil,
          # The Generic Click ID. Ex: clid123
          clid: nil,
          # The architecture of the CPU. Ex: x64
          cpu_architecture: nil,
          # The full url (including query params) of the current page
          current_url: nil,
          # The DoubleClick Click ID. Ex: dclid123
          dclid: nil,
          # The model of the device. Ex: iPhone 13
          device_model: nil,
          # The type of device the user is using. Ex: mobile
          device_type: nil,
          # The vendor of the device. Ex: Apple
          device_vendor: nil,
          # The time in milliseconds since the page was loaded // script was loaded
          duration: nil,
          # The browsers encoding. Ex: UTF-8
          encoding: nil,
          # The name of the browser engine. Ex: Blink
          engine_name: nil,
          # The version of the browser engine. Ex: 114.0
          engine_version: nil,
          # The Pinterest Click ID. Ex: epik456
          epik: nil,
          # Facebook Click ID with prefix format for Conversions API tracking. Ex:
          # fb.1.1554763741205.AbCdEfGhIjKlMnOpQrStUvWxYz1234567890
          fbc: nil,
          # Raw Facebook Click ID query parameter without prefix from ad clicks. Ex:
          # AbCdEfGhIjKlMnOpQrStUvWxYz1234567890
          fbclid: nil,
          # Facebook Browser ID parameter for identifying browsers and attributing events.
          # Ex: fb.1.1554763741205.1098115397
          fbp: nil,
          # Deprecated
          fv: nil,
          # The Google Ad Source. Ex: google
          gad_source: nil,
          # The Google Braid ID. Ex: gbraid123
          gbraid: nil,
          # The Google Click ID. Ex: gclid123
          gclid: nil,
          # The host of the current page. Ex: example.com
          host: nil,
          # Whether the user is in an iframe. Ex: true
          iframe: nil,
          # The Impact Click ID reference. Ex: im_ref123
          im_ref: nil,
          # The IP address of the user. Ex: 127.0.0.1
          ip: nil,
          # The Impact Click ID. Ex: irclickid123
          irclickid: nil,
          # Whether we have detected that the user is a bot. This is set automatically by
          # the Ours server primarily for events tracked through the web SDK.
          is_bot: nil,
          # The LinkedIn Click ID. Ex: li_fat_id123
          li_fat_id: nil,
          # The Microsoft Click ID. Ex: msclkid123
          msclkid: nil,
          # The NextDoor Click ID. Ex: ndclid123
          ndclid: nil,
          # Deprecated
          new_s: nil,
          # The name of the operating system. Ex: Windows
          os_name: nil,
          # The version of the operating system. Ex: 10.0
          os_version: nil,
          # A random set of numbers for the page load
          page_hash: nil,
          # The pathname of the current page. Ex: /home
          pathname: nil,
          # The Quora Click ID. Ex: qclid123
          qclid: nil,
          # The Reddit Click ID. Ex: rdt_cid123
          rdt_cid: nil,
          # The time the event was received by an Ours server in ISO format
          received_at: nil,
          # The referrer URL of the current page
          referrer: nil,
          # The referring domain of the current page
          referring_domain: nil,
          # The StackAdapt Tracking ID. Ex: sacid123
          sacid: nil,
          # The SnapChat Click ID. Ex: sccid123
          sccid: nil,
          # The height of the screen. Ex: 1080
          screen_height: nil,
          # The width of the screen. Ex: 1920
          screen_width: nil,
          # The number of sessions the user has had. Ex: 3
          session_count: nil,
          # The session ID as assigned automatically by the web SDK. This is required for
          # session replay
          sid: nil,
          sr: nil,
          # The title of the current page
          title: nil,
          # The TikTok Click ID. Ex: ttclid123
          ttclid: nil,
          # The Twitter Click ID. Ex: twclid123
          twclid: nil,
          # User agent as a full list of strings.
          uafvl: nil,
          # The user agent of the browser
          user_agent: nil,
          # The UTM Campaign. The web SDK automatically captures this from the query params.
          utm_campaign: nil,
          # The UTM Content. The web SDK automatically captures this from the query params.
          utm_content: nil,
          # The UTM Medium. The web SDK automatically captures this from the query params.
          utm_medium: nil,
          # The UTM Name. The web SDK automatically captures this from the query params.
          utm_name: nil,
          # The UTM Source. The web SDK automatically captures this from the query params.
          utm_source: nil,
          # The UTM Term. The web SDK automatically captures this from the query params.
          utm_term: nil,
          # The version of the web SDK
          version: nil,
          # The WBRAID Identifier. The web SDK automatically captures this from the query
          # params.
          wbraid: nil,
          # Whether the user is in a webview. Ex: true
          webview: nil
        )
        end

        sig do
          override.returns(
            {
              active_duration: T.nilable(Float),
              ad_id: T.nilable(String),
              adset_id: T.nilable(String),
              alart: T.nilable(String),
              aleid: T.nilable(String),
              basis_cid: T.nilable(String),
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
              host: T.nilable(String),
              iframe: T.nilable(T::Boolean),
              im_ref: T.nilable(String),
              ip: T.nilable(String),
              irclickid: T.nilable(String),
              is_bot: T.nilable(String),
              li_fat_id: T.nilable(String),
              msclkid: T.nilable(String),
              ndclid: T.nilable(String),
              new_s: T.nilable(T::Boolean),
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
              wbraid: T.nilable(String),
              webview: T.nilable(T::Boolean)
            }
          )
        end
        def to_hash
        end
      end

      class UserProperties < OursprivacyIngest::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              OursprivacyIngest::TrackEventParams::UserProperties,
              OursprivacyIngest::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_accessor :ad_id

        sig { returns(T.nilable(String)) }
        attr_accessor :adset_id

        sig { returns(T.nilable(String)) }
        attr_accessor :alart

        sig { returns(T.nilable(String)) }
        attr_accessor :aleid

        sig { returns(T.nilable(String)) }
        attr_accessor :basis_cid

        sig { returns(T.nilable(String)) }
        attr_accessor :campaign_id

        sig { returns(T.nilable(String)) }
        attr_accessor :city

        sig { returns(T.nilable(String)) }
        attr_accessor :clickid

        sig { returns(T.nilable(String)) }
        attr_accessor :clid

        sig { returns(T.nilable(String)) }
        attr_accessor :company_name

        sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
        attr_accessor :consent

        sig { returns(T.nilable(String)) }
        attr_accessor :country

        sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
        attr_accessor :custom_properties

        sig { returns(T.nilable(String)) }
        attr_accessor :date_of_birth

        sig { returns(T.nilable(String)) }
        attr_accessor :dclid

        sig { returns(T.nilable(String)) }
        attr_accessor :email

        sig { returns(T.nilable(String)) }
        attr_accessor :epik

        sig { returns(T.nilable(String)) }
        attr_accessor :external_id

        sig { returns(T.nilable(String)) }
        attr_accessor :fbc

        sig { returns(T.nilable(String)) }
        attr_accessor :fbclid

        sig { returns(T.nilable(String)) }
        attr_accessor :fbp

        sig { returns(T.nilable(String)) }
        attr_accessor :first_name

        sig { returns(T.nilable(String)) }
        attr_accessor :gad_source

        sig { returns(T.nilable(String)) }
        attr_accessor :gbraid

        sig { returns(T.nilable(String)) }
        attr_accessor :gclid

        sig { returns(T.nilable(String)) }
        attr_accessor :gender

        sig { returns(T.nilable(String)) }
        attr_accessor :im_ref

        # The IP address of the user
        sig { returns(T.nilable(String)) }
        attr_accessor :ip

        sig { returns(T.nilable(String)) }
        attr_accessor :irclickid

        sig { returns(T.nilable(String)) }
        attr_accessor :is_bot

        sig { returns(T.nilable(String)) }
        attr_accessor :job_title

        sig { returns(T.nilable(String)) }
        attr_accessor :last_name

        sig { returns(T.nilable(String)) }
        attr_accessor :li_fat_id

        sig { returns(T.nilable(String)) }
        attr_accessor :msclkid

        sig { returns(T.nilable(String)) }
        attr_accessor :ndclid

        sig { returns(T.nilable(String)) }
        attr_accessor :phone_number

        sig { returns(T.nilable(String)) }
        attr_accessor :qclid

        sig { returns(T.nilable(String)) }
        attr_accessor :rdt_cid

        sig { returns(T.nilable(String)) }
        attr_accessor :referrer

        sig { returns(T.nilable(String)) }
        attr_accessor :referring_domain

        sig { returns(T.nilable(String)) }
        attr_accessor :sacid

        sig { returns(T.nilable(String)) }
        attr_accessor :sccid

        sig { returns(T.nilable(String)) }
        attr_accessor :sid

        sig { returns(T.nilable(String)) }
        attr_accessor :state

        sig { returns(T.nilable(String)) }
        attr_accessor :ttclid

        sig { returns(T.nilable(String)) }
        attr_accessor :twclid

        sig { returns(T.nilable(String)) }
        attr_accessor :user_agent

        sig { returns(T.nilable(String)) }
        attr_accessor :user_agent_full_list

        sig { returns(T.nilable(String)) }
        attr_accessor :utm_campaign

        sig { returns(T.nilable(String)) }
        attr_accessor :utm_content

        sig { returns(T.nilable(String)) }
        attr_accessor :utm_medium

        sig { returns(T.nilable(String)) }
        attr_accessor :utm_name

        sig { returns(T.nilable(String)) }
        attr_accessor :utm_source

        sig { returns(T.nilable(String)) }
        attr_accessor :utm_term

        sig { returns(T.nilable(String)) }
        attr_accessor :wbraid

        sig { returns(T.nilable(String)) }
        attr_accessor :zip

        # Properties to set on the visitor. (optional) You can also update these
        # properties via the identify endpoint.
        sig do
          params(
            ad_id: T.nilable(String),
            adset_id: T.nilable(String),
            alart: T.nilable(String),
            aleid: T.nilable(String),
            basis_cid: T.nilable(String),
            campaign_id: T.nilable(String),
            city: T.nilable(String),
            clickid: T.nilable(String),
            clid: T.nilable(String),
            company_name: T.nilable(String),
            consent: T.nilable(T::Hash[Symbol, T.nilable(String)]),
            country: T.nilable(String),
            custom_properties: T.nilable(T::Hash[Symbol, T.nilable(String)]),
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
            im_ref: T.nilable(String),
            ip: T.nilable(String),
            irclickid: T.nilable(String),
            is_bot: T.nilable(String),
            job_title: T.nilable(String),
            last_name: T.nilable(String),
            li_fat_id: T.nilable(String),
            msclkid: T.nilable(String),
            ndclid: T.nilable(String),
            phone_number: T.nilable(String),
            qclid: T.nilable(String),
            rdt_cid: T.nilable(String),
            referrer: T.nilable(String),
            referring_domain: T.nilable(String),
            sacid: T.nilable(String),
            sccid: T.nilable(String),
            sid: T.nilable(String),
            state: T.nilable(String),
            ttclid: T.nilable(String),
            twclid: T.nilable(String),
            user_agent: T.nilable(String),
            user_agent_full_list: T.nilable(String),
            utm_campaign: T.nilable(String),
            utm_content: T.nilable(String),
            utm_medium: T.nilable(String),
            utm_name: T.nilable(String),
            utm_source: T.nilable(String),
            utm_term: T.nilable(String),
            wbraid: T.nilable(String),
            zip: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          ad_id: nil,
          adset_id: nil,
          alart: nil,
          aleid: nil,
          basis_cid: nil,
          campaign_id: nil,
          city: nil,
          clickid: nil,
          clid: nil,
          company_name: nil,
          consent: nil,
          country: nil,
          custom_properties: nil,
          date_of_birth: nil,
          dclid: nil,
          email: nil,
          epik: nil,
          external_id: nil,
          fbc: nil,
          fbclid: nil,
          fbp: nil,
          first_name: nil,
          gad_source: nil,
          gbraid: nil,
          gclid: nil,
          gender: nil,
          im_ref: nil,
          # The IP address of the user
          ip: nil,
          irclickid: nil,
          is_bot: nil,
          job_title: nil,
          last_name: nil,
          li_fat_id: nil,
          msclkid: nil,
          ndclid: nil,
          phone_number: nil,
          qclid: nil,
          rdt_cid: nil,
          referrer: nil,
          referring_domain: nil,
          sacid: nil,
          sccid: nil,
          sid: nil,
          state: nil,
          ttclid: nil,
          twclid: nil,
          user_agent: nil,
          user_agent_full_list: nil,
          utm_campaign: nil,
          utm_content: nil,
          utm_medium: nil,
          utm_name: nil,
          utm_source: nil,
          utm_term: nil,
          wbraid: nil,
          zip: nil
        )
        end

        sig do
          override.returns(
            {
              ad_id: T.nilable(String),
              adset_id: T.nilable(String),
              alart: T.nilable(String),
              aleid: T.nilable(String),
              basis_cid: T.nilable(String),
              campaign_id: T.nilable(String),
              city: T.nilable(String),
              clickid: T.nilable(String),
              clid: T.nilable(String),
              company_name: T.nilable(String),
              consent: T.nilable(T::Hash[Symbol, T.nilable(String)]),
              country: T.nilable(String),
              custom_properties: T.nilable(T::Hash[Symbol, T.nilable(String)]),
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
              im_ref: T.nilable(String),
              ip: T.nilable(String),
              irclickid: T.nilable(String),
              is_bot: T.nilable(String),
              job_title: T.nilable(String),
              last_name: T.nilable(String),
              li_fat_id: T.nilable(String),
              msclkid: T.nilable(String),
              ndclid: T.nilable(String),
              phone_number: T.nilable(String),
              qclid: T.nilable(String),
              rdt_cid: T.nilable(String),
              referrer: T.nilable(String),
              referring_domain: T.nilable(String),
              sacid: T.nilable(String),
              sccid: T.nilable(String),
              sid: T.nilable(String),
              state: T.nilable(String),
              ttclid: T.nilable(String),
              twclid: T.nilable(String),
              user_agent: T.nilable(String),
              user_agent_full_list: T.nilable(String),
              utm_campaign: T.nilable(String),
              utm_content: T.nilable(String),
              utm_medium: T.nilable(String),
              utm_name: T.nilable(String),
              utm_source: T.nilable(String),
              utm_term: T.nilable(String),
              wbraid: T.nilable(String),
              zip: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
