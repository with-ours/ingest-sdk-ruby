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
