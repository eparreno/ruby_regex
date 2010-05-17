require 'test/unit'
require 'rubygems'
require 'active_support'
require 'active_support/test_case'
require 'ruby_regex'

class RubyRegexTest < ActiveSupport::TestCase
  #Username
  def test_valid_usernames
    usernames = ['test', 'test_test', 'test1', 'test_1']
    usernames.each do |username|
      message = build_message(message, '<?> do not pass the test', username)
      assert(username =~ RubyRegex::Username, username)
    end
  end
  
  def test_invalid_usernames
    usernames = ['test-test', 'test.test', 'test/test', 'test@test']
    usernames.each do |username|
      message = build_message(message, '<?> do not pass the test', username)
      assert(username !~ RubyRegex::Username, username)
    end
  end
  
  # DNI
  def test_valid_dnis
    dnis = ['40990889J', '99888777h']
    dnis.each do |dni|
      message = build_message(message, '<?> do not pass the test', dni)
      assert(dni =~ RubyRegex::Username, dni)
    end
  end
  
  def test_invalid_dnis
    dnis = ['90.900.900V', '90900900-V']
    dnis.each do |dni|
      message = build_message(message, '<?> do not pass the test', dni)
      assert(dni !~ RubyRegex::Username, dni)
    end
  end
  
  # Email
  def test_valid_emails
    emails = ['test@test.com', 'test@test.co.uk', 'test@test.es', 'test@test.info']
    emails.each do |email|
      message = build_message(message, '<?> do not pass the test', email)
      assert(email =~ RubyRegex::Email, email)
    end
  end

  #TODO: 'test@test' is a valid domain, fix!!!
  def test_invalid_emails
    emails = ['test/test.com', 'test', 'test-test.com', 'test.test.com']
    emails.each do |email|
      message = build_message(message, '<?> do not pass the test', email)
      assert(email !~ RubyRegex::Email, message)
    end
  end
  
  # Domains
  def test_valid_domains
    domains = [ 'test.com', 'www.test.com', 'test.es', 'www.test.es', 'test.co.uk', 'www.test.co.uk', 'test.info', 'www.test.info', 'test.com.es', 'www.test.com.es']
    domains.each do |domain|
      message = build_message(message, '<?> do not pass the test', domain)
      assert(domain =~ RubyRegex::Domain, message)
    end
  end
  
  def test_invalid_domains
    domains = [ 'test.', 'www.test.e', 'www.test.', 'test.e', '!test.com', 'test/test.com']
    domains.each do |domain|
      message = build_message(message, '<?> do not pass the test', domain)
      assert(domain !~ RubyRegex::Domain, message)
    end
  end
  
  # Url
  def test_valid_url
    urls = [ 'http://test.com', 'http://www.test.com', 'http://test.es/index', 'http://www.test.es/index.html', 
      'https://test.co.uk', 'http://www.test.co.uk/index.html?id=34&name=username']
    urls.each do |url|
      message = build_message('<?> do not pass the test', url)
      assert(url =~ RubyRegex::URL, message)
    end
  end
  
  def test_invalid_url
    urls = [ 'test.com', 'www.test.com', 'http://test.es-index', 'http://www.test.es?index.html']
    urls.each do |url|
      message = build_message(message, '<?> do not pass the test', url)
      assert(url !~ RubyRegex::URL, message)
    end
  end
  
  # CreditCard
  def test_valid_credit_cards
    credit_cards = [ '1234123412341234', '1234 1234 1234 1234', '1234-1234-1234-1234']
    credit_cards.each do |credit_card|
      message = build_message(message, '<?> do not pass the test', credit_card)
      assert(credit_card =~ RubyRegex::CreditCard, message)
    end
  end
  
  def test_invalid_credit_cards
    credit_cards = [ '1234_1234_1234_1234', '1234', '12341234', '123412341234', 
      '1234  1234 1234 1234', '1234-1234 12341234', '123a-1234-1234-1234']
    credit_cards.each do |credit_card|
      message = build_message(message, '<?> do not pass the test', credit_card)
      assert(credit_card !~ RubyRegex::Domain, message)
    end
  end
  
  # US Social Security
  def test_valid_usss_numbers
    usss_numbers = [ '123-12-1234']
    usss_numbers.each do |usss_number|
      message = build_message(message, '<?> do not pass the test', usss_number)
      assert(usss_number =~ RubyRegex::USSocialSecurity, message)
    end
  end
  
  def test_invalid_usss_numbers
    usss_numbers = [ '1234_1234_1234_1234', '1234', '123121234', '123_12_1234', '123 12 1234']
    usss_numbers.each do |usss_number|
      message = build_message(message, '<?> do not pass the test', usss_number)
      assert(usss_number !~ RubyRegex::USSocialSecurity, message)
    end
  end
  
  # General Postal Code
  def test_valid_postal_codes
    postal_codes = [ '12345']
    postal_codes.each do |postal_code|
      message = build_message(message, '<?> do not pass the test', postal_code)
      assert(postal_code =~ RubyRegex::GeneralPostalCode, message)
    end
  end
  
  def test_invalid_postal_codes
    postal_codes = [ '1', '12', '123', '1234', '123456']
    postal_codes.each do |postal_code|
      message = build_message(message, '<?> do not pass the test', postal_code)
      assert(postal_code !~ RubyRegex::GeneralPostalCode, message)
    end
  end
  
  # ZIP Code
  def test_valid_zip_codes
    zip_codes = [ '12345', '12345-1234']
    zip_codes.each do |zip_code|
      message = build_message(message, '<?> do not pass the test', zip_code)
      assert(zip_code =~ RubyRegex::ZIPCode, message)
    end
  end
  
  def test_invalid_zip_codes
    zip_codes = [ '1', '12', '123', '1234', '123456', '12345_1234', '12345 1234', '1234-1234']
    zip_codes.each do |zip_code|
      message = build_message(message, '<?> do not pass the test', zip_code)
      assert(zip_code !~ RubyRegex::ZIPCode, message)
    end
  end
  
  # Twitter usernames
  def test_valid_twitter_usernames
    twitter_usernames = ['ji', 'nickel84', 'sepa_rate']
    twitter_usernames.each do |twitter_username|
      message = build_message(message, '<?> does not pass the test', twitter_username)
      assert(twitter_username =~ RubyRegex::TwitterUsername, message)
    end
  end
  
  def test_invalid_twitter_usernames
    twitter_usernames = ['nickel 83', 'h.ppywebcoder']
    twitter_usernames.each do |twitter_username|
      message = build_message(message, '<?> does not pass the test', twitter_username)
      assert(twitter_username !~ RubyRegex::TwitterUsername, message)
    end
  end  
end