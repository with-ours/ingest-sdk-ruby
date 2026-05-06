# typed: strong

module OursprivacyIngest
  module Models
    class BatchCreateResponse < OursprivacyIngest::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            OursprivacyIngest::Models::BatchCreateResponse,
            OursprivacyIngest::Internal::AnyHash
          )
        end

      sig { returns(Integer) }
      attr_accessor :accepted

      sig do
        returns(
          OursprivacyIngest::Models::BatchCreateResponse::Failed::TaggedFloat
        )
      end
      attr_accessor :failed

      sig do
        returns(
          T::Array[OursprivacyIngest::Models::BatchCreateResponse::Result]
        )
      end
      attr_accessor :results

      sig do
        returns(
          OursprivacyIngest::Models::BatchCreateResponse::Success::TaggedBoolean
        )
      end
      attr_accessor :success

      sig do
        params(
          accepted: Integer,
          failed:
            OursprivacyIngest::Models::BatchCreateResponse::Failed::OrFloat,
          results:
            T::Array[
              OursprivacyIngest::Models::BatchCreateResponse::Result::OrHash
            ],
          success:
            OursprivacyIngest::Models::BatchCreateResponse::Success::OrBoolean
        ).returns(T.attached_class)
      end
      def self.new(accepted:, failed:, results:, success:)
      end

      sig do
        override.returns(
          {
            accepted: Integer,
            failed:
              OursprivacyIngest::Models::BatchCreateResponse::Failed::TaggedFloat,
            results:
              T::Array[OursprivacyIngest::Models::BatchCreateResponse::Result],
            success:
              OursprivacyIngest::Models::BatchCreateResponse::Success::TaggedBoolean
          }
        )
      end
      def to_hash
      end

      module Failed
        extend OursprivacyIngest::Internal::Type::Enum

        TaggedFloat =
          T.type_alias do
            T.all(Float, OursprivacyIngest::Models::BatchCreateResponse::Failed)
          end
        OrFloat = T.type_alias { Float }

        FAILED_0 =
          T.let(
            0,
            OursprivacyIngest::Models::BatchCreateResponse::Failed::TaggedFloat
          )

        sig do
          override.returns(
            T::Array[
              OursprivacyIngest::Models::BatchCreateResponse::Failed::TaggedFloat
            ]
          )
        end
        def self.values
        end
      end

      class Result < OursprivacyIngest::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              OursprivacyIngest::Models::BatchCreateResponse::Result,
              OursprivacyIngest::Internal::AnyHash
            )
          end

        sig { returns(Integer) }
        attr_accessor :index

        sig do
          returns(
            OursprivacyIngest::Models::BatchCreateResponse::Result::Success::TaggedBoolean
          )
        end
        attr_accessor :success

        sig do
          params(
            index: Integer,
            success:
              OursprivacyIngest::Models::BatchCreateResponse::Result::Success::OrBoolean
          ).returns(T.attached_class)
        end
        def self.new(index:, success:)
        end

        sig do
          override.returns(
            {
              index: Integer,
              success:
                OursprivacyIngest::Models::BatchCreateResponse::Result::Success::TaggedBoolean
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
                OursprivacyIngest::Models::BatchCreateResponse::Result::Success
              )
            end
          OrBoolean = T.type_alias { T::Boolean }

          TRUE =
            T.let(
              true,
              OursprivacyIngest::Models::BatchCreateResponse::Result::Success::TaggedBoolean
            )

          sig do
            override.returns(
              T::Array[
                OursprivacyIngest::Models::BatchCreateResponse::Result::Success::TaggedBoolean
              ]
            )
          end
          def self.values
          end
        end
      end

      module Success
        extend OursprivacyIngest::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(
              T::Boolean,
              OursprivacyIngest::Models::BatchCreateResponse::Success
            )
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            OursprivacyIngest::Models::BatchCreateResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              OursprivacyIngest::Models::BatchCreateResponse::Success::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
