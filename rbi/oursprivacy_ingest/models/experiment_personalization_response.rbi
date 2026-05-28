# typed: strong

module OursprivacyIngest
  module Models
    class ExperimentPersonalizationResponse < OursprivacyIngest::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            OursprivacyIngest::Models::ExperimentPersonalizationResponse,
            OursprivacyIngest::Internal::AnyHash
          )
        end

      sig do
        returns(
          T::Array[
            OursprivacyIngest::Models::ExperimentPersonalizationResponse::Personalization
          ]
        )
      end
      attr_accessor :personalizations

      sig do
        returns(
          OursprivacyIngest::Models::ExperimentPersonalizationResponse::Success::TaggedBoolean
        )
      end
      attr_accessor :success

      sig do
        params(
          personalizations:
            T::Array[
              OursprivacyIngest::Models::ExperimentPersonalizationResponse::Personalization::OrHash
            ],
          success:
            OursprivacyIngest::Models::ExperimentPersonalizationResponse::Success::OrBoolean
        ).returns(T.attached_class)
      end
      def self.new(personalizations:, success:)
      end

      sig do
        override.returns(
          {
            personalizations:
              T::Array[
                OursprivacyIngest::Models::ExperimentPersonalizationResponse::Personalization
              ],
            success:
              OursprivacyIngest::Models::ExperimentPersonalizationResponse::Success::TaggedBoolean
          }
        )
      end
      def to_hash
      end

      class Personalization < OursprivacyIngest::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              OursprivacyIngest::Models::ExperimentPersonalizationResponse::Personalization,
              OursprivacyIngest::Internal::AnyHash
            )
          end

        sig { returns(Float) }
        attr_accessor :assigned_at

        sig { returns(String) }
        attr_accessor :experiment_id

        sig { returns(String) }
        attr_accessor :variant_id

        sig { returns(T.nilable(String)) }
        attr_accessor :experiment_key

        sig { returns(T.nilable(String)) }
        attr_accessor :experiment_name

        sig { returns(T.nilable(String)) }
        attr_accessor :variant_name

        sig do
          params(
            assigned_at: Float,
            experiment_id: String,
            variant_id: String,
            experiment_key: T.nilable(String),
            experiment_name: T.nilable(String),
            variant_name: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          assigned_at:,
          experiment_id:,
          variant_id:,
          experiment_key: nil,
          experiment_name: nil,
          variant_name: nil
        )
        end

        sig do
          override.returns(
            {
              assigned_at: Float,
              experiment_id: String,
              variant_id: String,
              experiment_key: T.nilable(String),
              experiment_name: T.nilable(String),
              variant_name: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end

      module Success
        extend OursprivacyIngest::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(
              T::Boolean,
              OursprivacyIngest::Models::ExperimentPersonalizationResponse::Success
            )
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            OursprivacyIngest::Models::ExperimentPersonalizationResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              OursprivacyIngest::Models::ExperimentPersonalizationResponse::Success::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
