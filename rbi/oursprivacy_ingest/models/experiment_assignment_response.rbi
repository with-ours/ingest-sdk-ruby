# typed: strong

module OursprivacyIngest
  module Models
    module ExperimentAssignmentResponse
      extend OursprivacyIngest::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0,
            OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1
          )
        end

      class UnionMember0 < OursprivacyIngest::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0,
              OursprivacyIngest::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :experiment_id

        sig do
          returns(
            OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0::InExperiment::TaggedBoolean
          )
        end
        attr_accessor :in_experiment

        sig do
          returns(
            OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0::Success::TaggedBoolean
          )
        end
        attr_accessor :success

        sig { returns(String) }
        attr_accessor :variant_id

        sig { returns(T.nilable(String)) }
        attr_accessor :experiment_key

        sig { returns(T.nilable(String)) }
        attr_accessor :experiment_name

        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :is_control

        # Redirect destination for redirect (split-URL) variants — a same-domain relative
        # path or an absolute https:// URL. Present only when the assigned variant is a
        # redirect; absent for on-page (DOM-modification) variants. Read it straight off
        # the payload and issue the redirect server-side.
        sig { returns(T.nilable(String)) }
        attr_accessor :redirect

        sig { returns(T.nilable(String)) }
        attr_accessor :type

        sig { returns(T.nilable(String)) }
        attr_accessor :variant_name

        sig do
          params(
            experiment_id: String,
            in_experiment:
              OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0::InExperiment::OrBoolean,
            success:
              OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0::Success::OrBoolean,
            variant_id: String,
            experiment_key: T.nilable(String),
            experiment_name: T.nilable(String),
            is_control: T.nilable(T::Boolean),
            redirect: T.nilable(String),
            type: T.nilable(String),
            variant_name: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          experiment_id:,
          in_experiment:,
          success:,
          variant_id:,
          experiment_key: nil,
          experiment_name: nil,
          is_control: nil,
          # Redirect destination for redirect (split-URL) variants — a same-domain relative
          # path or an absolute https:// URL. Present only when the assigned variant is a
          # redirect; absent for on-page (DOM-modification) variants. Read it straight off
          # the payload and issue the redirect server-side.
          redirect: nil,
          type: nil,
          variant_name: nil
        )
        end

        sig do
          override.returns(
            {
              experiment_id: String,
              in_experiment:
                OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0::InExperiment::TaggedBoolean,
              success:
                OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0::Success::TaggedBoolean,
              variant_id: String,
              experiment_key: T.nilable(String),
              experiment_name: T.nilable(String),
              is_control: T.nilable(T::Boolean),
              redirect: T.nilable(String),
              type: T.nilable(String),
              variant_name: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        module InExperiment
          extend OursprivacyIngest::Internal::Type::Enum

          TaggedBoolean =
            T.type_alias do
              T.all(
                T::Boolean,
                OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0::InExperiment
              )
            end
          OrBoolean = T.type_alias { T::Boolean }

          TRUE =
            T.let(
              true,
              OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0::InExperiment::TaggedBoolean
            )

          sig do
            override.returns(
              T::Array[
                OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0::InExperiment::TaggedBoolean
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
                OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0::Success
              )
            end
          OrBoolean = T.type_alias { T::Boolean }

          TRUE =
            T.let(
              true,
              OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0::Success::TaggedBoolean
            )

          sig do
            override.returns(
              T::Array[
                OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0::Success::TaggedBoolean
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
              OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1,
              OursprivacyIngest::Internal::AnyHash
            )
          end

        sig do
          returns(
            OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1::InExperiment::TaggedBoolean
          )
        end
        attr_accessor :in_experiment

        sig do
          returns(
            OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1::Success::TaggedBoolean
          )
        end
        attr_accessor :success

        sig do
          params(
            in_experiment:
              OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1::InExperiment::OrBoolean,
            success:
              OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1::Success::OrBoolean
          ).returns(T.attached_class)
        end
        def self.new(in_experiment:, success:)
        end

        sig do
          override.returns(
            {
              in_experiment:
                OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1::InExperiment::TaggedBoolean,
              success:
                OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1::Success::TaggedBoolean
            }
          )
        end
        def to_hash
        end

        module InExperiment
          extend OursprivacyIngest::Internal::Type::Enum

          TaggedBoolean =
            T.type_alias do
              T.all(
                T::Boolean,
                OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1::InExperiment
              )
            end
          OrBoolean = T.type_alias { T::Boolean }

          FALSE =
            T.let(
              false,
              OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1::InExperiment::TaggedBoolean
            )

          sig do
            override.returns(
              T::Array[
                OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1::InExperiment::TaggedBoolean
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
                OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1::Success
              )
            end
          OrBoolean = T.type_alias { T::Boolean }

          TRUE =
            T.let(
              true,
              OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1::Success::TaggedBoolean
            )

          sig do
            override.returns(
              T::Array[
                OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1::Success::TaggedBoolean
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
            OursprivacyIngest::Models::ExperimentAssignmentResponse::Variants
          ]
        )
      end
      def self.variants
      end
    end
  end
end
