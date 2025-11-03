# typed: strong

module OursPrivacy
  module Models
    class VisitorUpsertResponse < OursPrivacy::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            OursPrivacy::Models::VisitorUpsertResponse,
            OursPrivacy::Internal::AnyHash
          )
        end

      sig do
        returns(
          OursPrivacy::Models::VisitorUpsertResponse::Success::TaggedBoolean
        )
      end
      attr_accessor :success

      sig do
        params(
          success:
            OursPrivacy::Models::VisitorUpsertResponse::Success::OrBoolean
        ).returns(T.attached_class)
      end
      def self.new(success:)
      end

      sig do
        override.returns(
          {
            success:
              OursPrivacy::Models::VisitorUpsertResponse::Success::TaggedBoolean
          }
        )
      end
      def to_hash
      end

      module Success
        extend OursPrivacy::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(
              T::Boolean,
              OursPrivacy::Models::VisitorUpsertResponse::Success
            )
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            OursPrivacy::Models::VisitorUpsertResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              OursPrivacy::Models::VisitorUpsertResponse::Success::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
