require 'test_helper'

class PhrasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @phrase = phrases(:one)
  end

  test "should get index" do
    get phrases_url, as: :json
    assert_response :success
  end

  test "should create phrase" do
    assert_difference('Phrase.count') do
      post phrases_url, params: { phrase: { english_phrase: @phrase.english_phrase, foreign_phrase: @phrase.foreign_phrase, language_id: @phrase.language_id } }, as: :json
    end

    assert_response 201
  end

  test "should show phrase" do
    get phrase_url(@phrase), as: :json
    assert_response :success
  end

  test "should update phrase" do
    patch phrase_url(@phrase), params: { phrase: { english_phrase: @phrase.english_phrase, foreign_phrase: @phrase.foreign_phrase, language_id: @phrase.language_id } }, as: :json
    assert_response 200
  end

  test "should destroy phrase" do
    assert_difference('Phrase.count', -1) do
      delete phrase_url(@phrase), as: :json
    end

    assert_response 204
  end
end
