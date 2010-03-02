require 'test/unit'
require 'rubygems'
require 'active_support'
require 'active_support/test_case'
require 'ruby_regex'

class RubyRegexTest < ActiveSupport::TestCase
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
end