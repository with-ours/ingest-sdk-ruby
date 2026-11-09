# frozen_string_literal: true

require_relative "../test_helper"

class OursprivacyIngest::Test::RedactionTest < Minitest::Test
  SECRET = "SENTINEL_SECRET_DO_NOT_LOG"

  class Login < OursprivacyIngest::Internal::Type::BaseModel
    required :user, String
    required :password, String
    optional :nested, -> { Login }
  end

  def login
    Login.new(user: "still_visible", password: SECRET, nested: {user: "nested", password: SECRET})
  end

  def test_printing_a_model_hides_secrets_at_any_depth
    {inspect: login.inspect, to_s: login.to_s, interpolated: "login: #{login}"}.each do |name, output|
      refute_includes(output, SECRET, name)
      assert_includes(output, "still_visible", name)
      assert_includes(output, "***", name)
    end
  end

  def test_data_and_serialization_keep_the_secret
    assert_equal(SECRET, login.password)
    assert_includes(login.to_json, SECRET)
    assert_includes(login.deep_to_h.to_s, SECRET)
  end

  def test_status_error_message_hides_echoed_secrets
    error = OursprivacyIngest::Errors::APIStatusError.new(
      url: URI("https://example.test/x"),
      status: 400,
      headers: {},
      body: {password: SECRET, code: "still_visible"},
      request: nil,
      response: nil
    )

    refute_includes(error.message, SECRET)
    refute_includes(error.inspect, SECRET)
    assert_includes(error.message, "still_visible")
    assert_equal(SECRET, error.body[:password])
  end

  def test_redact_sensitive_matches_any_spelling_of_a_name
    assert_equal(
      {"PassWord" => "***", list: [{pass_word: "***"}], text: "password"},
      OursprivacyIngest::Internal::Util.redact_sensitive(
        {"PassWord" => "x", list: [{pass_word: ["y"]}], text: "password"}
      )
    )
  end
end
