require 'test/unit'
require 'yaml'
require File.join( File.dirname(__FILE__), '../lib/ruby_regex' )

class RubyRegexTest < Test::Unit::TestCase

  #Username
  def test_valid_usernames
    check_valid_regex RubyRegex::Username, ['test', 'test_test', 'test1', 'test_1']
  end

  def test_invalid_usernames
    check_invalid_regex RubyRegex::Username, ['test-test', 'test.test', 'test/test', 'test@test']
  end

  # DNI
  def test_valid_dnis
    check_valid_regex RubyRegex::Dni, ['40990889J', '99888777h']
  end

  def test_invalid_dnis
    check_invalid_regex RubyRegex::Dni, ['90.900.900V', '90900900-V']
  end

  # Email
  def test_valid_emails
    check_valid_regex RubyRegex::Email, load_fixture('emails')['valid']
  end

  def test_invalid_emails
    check_invalid_regex RubyRegex::Email, load_fixture('emails')["invalid"]
  end

  # Domains
  def test_valid_domains
    check_valid_regex RubyRegex::Domain, ['test.com', 'www.test.com', 'test.es', 'www.test.es', 'test.co.uk', 'www.test.co.uk', 'test.info', 'www.test.info', 'test.com.es', 'www.test.com.es', 'test-test.com']
  end

  def test_invalid_domains
    check_invalid_regex RubyRegex::Domain, ['test.', 'www.test.e', 'www.test.', 'test.e', '!test.com', 'test/test.com', 'test_test.com']
  end

  # Url
  def test_valid_url
    check_valid_regex RubyRegex::URL, ['http://test.com', 'http://www.test.com', 'http://test.es/index', 'http://www.test.es/index.html', 'https://test.co.uk', 'http://www.test.co.uk/index.html?id=34&name=username']
  end

  def test_invalid_url
    check_invalid_regex RubyRegex::URL, ['test.com', 'www.test.com', 'http://test.es-index', 'http://www.test.es?index.html']
  end

  # CreditCard
  def test_valid_credit_cards
    check_valid_regex RubyRegex::CreditCard, [ '1234123412341234', '1234 1234 1234 1234', '1234-1234-1234-1234']
  end

  def test_invalid_credit_cards
    check_invalid_regex RubyRegex::CreditCard, ['1234_1234_1234_1234', '1234', '12341234', '123412341234', '1234  1234 1234 1234', '1234-1234 12341234', '123a-1234-1234-1234']
  end

  # US Social Security
  def test_valid_usss_numbers
    check_valid_regex RubyRegex::USSocialSecurity, ['123-12-1234']
  end

  def test_invalid_usss_numbers
    check_invalid_regex RubyRegex::USSocialSecurity, [ '1234_1234_1234_1234', '1234', '123121234', '123_12_1234', '123 12 1234']
  end

  # General Postal Code
  def test_valid_postal_codes
    check_valid_regex RubyRegex::GeneralPostalCode, ['12345']
  end

  def test_invalid_postal_codes
    check_invalid_regex RubyRegex::GeneralPostalCode, [ '1', '12', '123', '1234', '123456']
  end

  # ZIP Code
  def test_valid_zip_codes
    check_valid_regex RubyRegex::ZIPCode, [ '12345', '12345-1234']
  end

  def test_invalid_zip_codes
    check_invalid_regex RubyRegex::ZIPCode, [ '1', '12', '123', '1234', '123456', '12345_1234', '12345 1234', '1234-1234']
  end

  # Twitter usernames
  def test_valid_twitter_usernames
    check_valid_regex RubyRegex::TwitterUsername, ['ji', 'nickel84', 'sepa_rate']
  end

  def test_invalid_twitter_usernames
    check_invalid_regex RubyRegex::TwitterUsername, ['nickel 83', 'h.ppywebcoder']
  end

  # Github usernames
  def test_valid_github_usernames
    check_valid_regex RubyRegex::GithubUsername, ['ji', 'nickel84', 'sepa_rate', 'ernesto-jimenez']
  end

  def test_invalid_github_usernames
    check_invalid_regex RubyRegex::GithubUsername, ['nickel 84', 'h.ppywebcoder']
  end

  # Slideshare usernames
  def test_valid_slideshare_usernames
    check_valid_regex RubyRegex::SlideshareUsername, ['ji', 'nickel84']
  end

  def test_invalid_slideshare_usernames
    check_invalid_regex RubyRegex::SlideshareUsername, ['nickel 84', 'h.ppywebcoder', 'sepa_rate', 'ernesto-jimenez']
  end

  # Del.icio.us usernames
  def test_valid_delicious_usernames
    check_valid_regex RubyRegex::DeliciousUsername, ['ji', 'nickel84', 'sepa_rate', 'ernesto-jimenez']
  end

  def test_invalid_delicious_usernames
    check_invalid_regex RubyRegex::DeliciousUsername, ['nickel 84', 'h.ppywebcoder']
  end

  def test_valid_uuids
    check_valid_regex RubyRegex::UUID, ['550e8400e29b41d4a716446655440000', '550e8400-e29b-41d4-a716-446655440000', '6ba7b8109dad11d180b400c04fd430c8', '6ba7b810-9dad-11d1-80b4-00c04fd430c8']
  end

  def test_invalid_uuids
    check_invalid_regex RubyRegex::UUID, ['6ba7b810-9dad-11d180b400c04fd430c8', 'zba7b810-9dad-11d1-80b4-00c04fd430c8', '6ba7b81-9ad-1d1-0b4-00c04fd430c8', '1234', 'asdf', '555-555-5555', 'abcd@qwerty.com']
  end

  # DBDate
  def test_valid_db_dates
    check_valid_regex RubyRegex::DBDate, load_fixture('db_dates')['valid']
  end

  def test_invalid_db_dates
    check_invalid_regex RubyRegex::DBDate, load_fixture('db_dates')['invalid']
  end

  # DBDateTime
  def test_valid_db_date_times
    check_valid_regex RubyRegex::DBDateTime, load_fixture('db_date_times')['valid']
  end

  def test_invalid_db_date_times
    check_invalid_regex RubyRegex::DBDateTime, load_fixture('db_date_times')['invalid']
  end

  # SpanishBankAccountNumber
  def test_valid_spanish_bank_account_numbers
    check_valid_regex RubyRegex::SpanishBankAccountNumber, load_fixture('spanish_bank_account_numbers')['valid']
  end

  def test_invalid_spanish_bank_account_numbers
    check_invalid_regex RubyRegex::SpanishBankAccountNumber, load_fixture('spanish_bank_account_numbers')['invalid']
  end

  # IBAN
  def test_valid_iban
    check_valid_regex RubyRegex::IBAN, load_fixture('ibans')['valid']
  end

  def test_invalid_iban
    check_invalid_regex RubyRegex::IBAN, load_fixture('ibans')['invalid']
  end

  # MacAddress
  def test_valid_mac_addresses
    check_valid_regex RubyRegex::MacAddress, load_fixture('mac_addresses')['valid']
  end

  def test_invalid_mac_addresses
    check_invalid_regex RubyRegex::SpanishBankAccountNumber, load_fixture('mac_addresses')['invalid']
  end

  private
    def load_fixture( name )
      YAML.load( File.read( File.join( File.dirname(__FILE__), 'fixtures', "#{name}.yml" ) ) )
    end

    def check_valid_regex(regexp, strings)
      strings.each do |str|
        message = build_message(message, '<?> should be valid but it is not', str)
        assert(str =~ regexp, message)
      end
    end

    def check_invalid_regex(regexp, strings)
      strings.each do |str|
        message = build_message(message, '<?> should be invalid but it is not', str)
        assert(str !~ regexp, message)
      end
    end
end