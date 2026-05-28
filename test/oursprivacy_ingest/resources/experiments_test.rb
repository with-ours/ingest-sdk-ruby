# frozen_string_literal: true

require_relative "../test_helper"

class OursprivacyIngest::Test::Resources::ExperimentsTest < OursprivacyIngest::Test::ResourceTest
  def test_assignment_required_params
    skip("Mock server tests are disabled")

    response = @ours_privacy.experiments.assignment("experiment_key", token: "token", visitor_id: "x")

    assert_pattern do
      response => OursprivacyIngest::Models::ExperimentAssignmentResponse
    end

    assert_pattern do
      case response
      in OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0
      in OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1
      end
    end
  end

  def test_personalization_required_params
    skip("Mock server tests are disabled")

    response = @ours_privacy.experiments.personalization(token: "token", visitor_id: "x")

    assert_pattern do
      response => OursprivacyIngest::Models::ExperimentPersonalizationResponse
    end

    assert_pattern do
      response => {
        personalizations: ^(OursprivacyIngest::Internal::Type::ArrayOf[OursprivacyIngest::Models::ExperimentPersonalizationResponse::Personalization]),
        success: OursprivacyIngest::Models::ExperimentPersonalizationResponse::Success
      }
    end
  end
end
