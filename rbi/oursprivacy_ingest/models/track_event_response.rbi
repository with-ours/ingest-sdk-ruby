# typed: strong

module OursprivacyIngest
  module Models
    class TrackEventResponse < OursprivacyIngest::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            OursprivacyIngest::Models::TrackEventResponse,
            OursprivacyIngest::Internal::AnyHash
          )
        end

      sig do
        returns(
          OursprivacyIngest::Models::TrackEventResponse::Success::TaggedBoolean
        )
      end
      attr_accessor :success

      sig do
        params(
          success:
            OursprivacyIngest::Models::TrackEventResponse::Success::OrBoolean
        ).returns(T.attached_class)
      end
      def self.new(success:)
      end

      sig do
        override.returns(
          {
            success:
              OursprivacyIngest::Models::TrackEventResponse::Success::TaggedBoolean
          }
        )
      end
      def to_hash
      end

      module Success
        extend OursprivacyIngest::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(
              T::Boolean,
              OursprivacyIngest::Models::TrackEventResponse::Success
            )
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            OursprivacyIngest::Models::TrackEventResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              OursprivacyIngest::Models::TrackEventResponse::Success::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
