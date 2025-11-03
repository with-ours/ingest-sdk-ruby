# typed: strong

module OursPrivacy
  module Models
    class TrackEventResponse < OursPrivacy::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            OursPrivacy::Models::TrackEventResponse,
            OursPrivacy::Internal::AnyHash
          )
        end

      sig do
        returns(OursPrivacy::Models::TrackEventResponse::Success::TaggedBoolean)
      end
      attr_accessor :success

      sig do
        params(
          success: OursPrivacy::Models::TrackEventResponse::Success::OrBoolean
        ).returns(T.attached_class)
      end
      def self.new(success:)
      end

      sig do
        override.returns(
          {
            success:
              OursPrivacy::Models::TrackEventResponse::Success::TaggedBoolean
          }
        )
      end
      def to_hash
      end

      module Success
        extend OursPrivacy::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, OursPrivacy::Models::TrackEventResponse::Success)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            OursPrivacy::Models::TrackEventResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              OursPrivacy::Models::TrackEventResponse::Success::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
