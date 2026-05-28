# typed: strong

module OursprivacyIngest
  module Models
    class ExperimentPersonalizationParams < OursprivacyIngest::Internal::Type::BaseModel
      extend OursprivacyIngest::Internal::Type::RequestParameters::Converter
      include OursprivacyIngest::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            OursprivacyIngest::ExperimentPersonalizationParams,
            OursprivacyIngest::Internal::AnyHash
          )
        end

      # The experiment token (`exp_*`).
      sig { returns(String) }
      attr_accessor :token

      sig { returns(String) }
      attr_accessor :visitor_id

      sig do
        params(
          token: String,
          visitor_id: String,
          request_options: OursprivacyIngest::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The experiment token (`exp_*`).
        token:,
        visitor_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            token: String,
            visitor_id: String,
            request_options: OursprivacyIngest::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
