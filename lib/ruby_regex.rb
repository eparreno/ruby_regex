module RubyRegex
  # Username
  # This regular expression doesn't validate username's length
  Username = /^[a-zA-Z0-9_]*$/
  
  # Dni (spanish ID card)
  Dni = /^\d{8}[A-Za-z]{1}$/
  
  # URL
  Url = URL = /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix
  
  # Domain
  Domain = /(^$)|(^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?)?$)/ix
  
  # CreditCard
  # Validates Credit Card numbers, Checks if it contains 16 numbers in groups of 4 separated by -, space or nothing
  CreditCard = /^(\d{4}-){3}\d{4}$|^(\d{4}\s){3}\d{4}$|^\d{16}$/
  
  # MasterCard credit card
  MasterCard = /^5[1-5]\d{14}$/
  
  # Visa credit card
  Visa = /^4\d{15}$/
  
  # US Social Security
  USSocialSecurity = /^\d{3}-\d{2}-\d{4}$/
  
  # General postal code
  # Validates a 5 digits postal code
  GeneralPostalCode = /^\d{5}$/
  
  # US ZIP code
  # Validates US ZIP Code (basic and extended format)
  ZIPCode = /^(\d{5}$)|(\d{5}-\d{4}$)/
  
  # Twitter username
  TwitterUsername = /^([a-z0-9\_])+$/ix
  
  # Github username
  GithubUsername = /^([a-z0-9\_\-])+$/ix
  
  # Slideshare username
  SlideshareUsername = /^([a-z0-9])+$/ix
  
  # Del.icio.us username
  DeliciousUsername = /^([a-z0-9\_\-])+$/ix
  
  # RFC822 Email Address Regex
  # 
  # Originally written by Cal Henderson
  # c.f. http://iamcal.com/publish/articles/php/parsing_email/
  #
  # Translated to Ruby by Tim Fletcher, with changes suggested by Dan Kubb.
  #
  # Licensed under a Creative Commons Attribution-ShareAlike 2.5 License
  # http://creativecommons.org/licenses/by-sa/2.5/
  Email = begin
    qtext = '[^\\x0d\\x22\\x5c\\x80-\\xff]'
    dtext = '[^\\x0d\\x5b-\\x5d\\x80-\\xff]'
    atom = '[^\\x00-\\x20\\x22\\x28\\x29\\x2c\\x2e\\x3a-' +
      '\\x3c\\x3e\\x40\\x5b-\\x5d\\x7f-\\xff]+'
    quoted_pair = '\\x5c[\\x00-\\x7f]'
    domain_literal = "\\x5b(?:#{dtext}|#{quoted_pair})*\\x5d"
    quoted_string = "\\x22(?:#{qtext}|#{quoted_pair})*\\x22"
    domain_ref = atom
    sub_domain = "(?:#{domain_ref}|#{domain_literal})"
    word = "(?:#{atom}|#{quoted_string})"
    domain = "#{sub_domain}(?:\\x2e#{sub_domain})*"
    local_part = "#{word}(?:\\x2e#{word})*"
    addr_spec = "#{local_part}\\x40#{domain}"
    pattern = /\A#{addr_spec}\z/
  end
end