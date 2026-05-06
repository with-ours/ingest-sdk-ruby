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

      sig { returns(Integer) }
      attr_accessor :failed

      sig do
        returns(
          T::Array[
            OursprivacyIngest::Models::BatchCreateResponse::Result::Variants
          ]
        )
      end
      attr_accessor :results

      sig { returns(T::Boolean) }
      attr_accessor :success

      sig do
        params(
          accepted: Integer,
          failed: Integer,
          results:
            T::Array[
              T.any(
                OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember0::OrHash,
                OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1::OrHash
              )
            ],
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(accepted:, failed:, results:, success:)
      end

      sig do
        override.returns(
          {
            accepted: Integer,
            failed: Integer,
            results:
              T::Array[
                OursprivacyIngest::Models::BatchCreateResponse::Result::Variants
              ],
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      module Result
        extend OursprivacyIngest::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember0,
              OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1
            )
          end

        class UnionMember0 < OursprivacyIngest::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember0,
                OursprivacyIngest::Internal::AnyHash
              )
            end

          sig { returns(Integer) }
          attr_accessor :index

          sig do
            returns(
              OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember0::Success::TaggedBoolean
            )
          end
          attr_accessor :success

          sig do
            params(
              index: Integer,
              success:
                OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember0::Success::OrBoolean
            ).returns(T.attached_class)
          end
          def self.new(index:, success:)
          end

          sig do
            override.returns(
              {
                index: Integer,
                success:
                  OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember0::Success::TaggedBoolean
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
                  OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember0::Success
                )
              end
            OrBoolean = T.type_alias { T::Boolean }

            TRUE =
              T.let(
                true,
                OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember0::Success::TaggedBoolean
              )

            sig do
              override.returns(
                T::Array[
                  OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember0::Success::TaggedBoolean
                ]
              )
            end
            def self.values
            end
          end
        end

        class UnionMember1 < OursprivacyIngest::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1,
                OursprivacyIngest::Internal::AnyHash
              )
            end

          sig do
            returns(
              OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1::Code::TaggedSymbol
            )
          end
          attr_accessor :code

          sig { returns(Integer) }
          attr_accessor :index

          sig { returns(String) }
          attr_accessor :message

          sig do
            returns(
              OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1::Success::TaggedBoolean
            )
          end
          attr_accessor :success

          sig do
            params(
              code:
                OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1::Code::OrSymbol,
              index: Integer,
              message: String,
              success:
                OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1::Success::OrBoolean
            ).returns(T.attached_class)
          end
          def self.new(code:, index:, message:, success:)
          end

          sig do
            override.returns(
              {
                code:
                  OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1::Code::TaggedSymbol,
                index: Integer,
                message: String,
                success:
                  OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1::Success::TaggedBoolean
              }
            )
          end
          def to_hash
          end

          module Code
            extend OursprivacyIngest::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1::Code
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INVALID_EVENT =
              T.let(
                :invalid_event,
                OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1::Code::TaggedSymbol
              )
            QUEUE_FAILED =
              T.let(
                :queue_failed,
                OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1::Code::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1::Code::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module Success
            extend OursprivacyIngest::Internal::Type::Enum

            TaggedBoolean =
              T.type_alias do
                T.all(
                  T::Boolean,
                  OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1::Success
                )
              end
            OrBoolean = T.type_alias { T::Boolean }

            FALSE =
              T.let(
                false,
                OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1::Success::TaggedBoolean
              )

            sig do
              override.returns(
                T::Array[
                  OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1::Success::TaggedBoolean
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(
            T::Array[
              OursprivacyIngest::Models::BatchCreateResponse::Result::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
