# typed: strong

module OursprivacyIngest
  module Models
    class VisitorUpsertResponse < OursprivacyIngest::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            OursprivacyIngest::Models::VisitorUpsertResponse,
            OursprivacyIngest::Internal::AnyHash
          )
        end

      sig do
        returns(
          OursprivacyIngest::Models::VisitorUpsertResponse::Success::TaggedBoolean
        )
      end
      attr_accessor :success

      sig do
        params(
          success:
            OursprivacyIngest::Models::VisitorUpsertResponse::Success::OrBoolean
        ).returns(T.attached_class)
      end
      def self.new(success:)
      end

      sig do
        override.returns(
          {
            success:
              OursprivacyIngest::Models::VisitorUpsertResponse::Success::TaggedBoolean
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
              OursprivacyIngest::Models::VisitorUpsertResponse::Success
            )
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            OursprivacyIngest::Models::VisitorUpsertResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              OursprivacyIngest::Models::VisitorUpsertResponse::Success::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
