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
  
  # Email
  # From the email regex research: http://fightingforalostcause.net/misc/2006/compare-email-regex.php
  # Authors: James Watts and Francisco Jose Martin Moreno
  Email = /^([\w\!\#$\%\&\'\*\+\-\/\=\?\^\`{\|\}\~]+\.)*[\w-]+@((((([a-z0-9]{1}[a-z0-9\-]{0,62}[a-z0-9]{1})|[a-z])\.)+[a-z]{2,6})|(\d{1,3}\.){3}\d{1,3}(\:\d{1,5})?)$/i
  
  # UUID
  # Validates a UUID as defined: http://en.wikipedia.org/wiki/Universally_unique_identifier
  UUID = /^(\h{32}|\h{8}-\h{4}-\h{4}-\h{4}-\h{12})$/
end