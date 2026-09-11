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

      # The visitor traits accumulated by your personalization property rules, keyed by
      # property key. Values are always scalars — a string, number, or boolean, or null
      # when the captured field was itself empty. Empty for a visitor who has not
      # matched any rule yet. These same values are delivered to the visitor's browser
      # and are readable by anyone who knows the visitor_id, so never accumulate
      # secrets, credentials, PHI, or confidential data into a property.
      sig do
        returns(
          T::Hash[
            Symbol,
            OursprivacyIngest::Models::ExperimentPersonalizationResponse::Property::Variants
          ]
        )
      end
      attr_accessor :properties

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
          properties:
            T::Hash[
              Symbol,
              OursprivacyIngest::Models::ExperimentPersonalizationResponse::Property::Variants
            ],
          success:
            OursprivacyIngest::Models::ExperimentPersonalizationResponse::Success::OrBoolean
        ).returns(T.attached_class)
      end
      def self.new(
        personalizations:,
        # The visitor traits accumulated by your personalization property rules, keyed by
        # property key. Values are always scalars — a string, number, or boolean, or null
        # when the captured field was itself empty. Empty for a visitor who has not
        # matched any rule yet. These same values are delivered to the visitor's browser
        # and are readable by anyone who knows the visitor_id, so never accumulate
        # secrets, credentials, PHI, or confidential data into a property.
        properties:,
        success:
      )
      end

      sig do
        override.returns(
          {
            personalizations:
              T::Array[
                OursprivacyIngest::Models::ExperimentPersonalizationResponse::Personalization
              ],
            properties:
              T::Hash[
                Symbol,
                OursprivacyIngest::Models::ExperimentPersonalizationResponse::Property::Variants
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

      module Property
        extend OursprivacyIngest::Internal::Type::Union

        Variants = T.type_alias { T.any(String, Float, T::Boolean) }

        sig do
          override.returns(
            T::Array[
              OursprivacyIngest::Models::ExperimentPersonalizationResponse::Property::Variants
            ]
          )
        end
        def self.variants
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
