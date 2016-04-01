module RubyRegex
  # Username
  # This regular expression doesn't validate username's length
  Username = /\A[a-zA-Z0-9_]*\z/

  # Dni (spanish ID card)
  Dni = /\A\d{8}[A-Za-z]{1}\z/

  # URL
  Url = URL = /(\A\z)|(\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?\z)/ix

  # Domain
  Domain = /(\A\z)|(\A[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?)?\z)/ix

  # CreditCard
  # Validates Credit Card numbers, Checks if it contains 16 numbers in groups of 4 separated by -, space or nothing
  CreditCard = /\A(\d{4}-){3}\d{4}\z|\A(\d{4}\s){3}\d{4}\z|\A\d{16}\z/

  # MasterCard credit card
  MasterCard = /\A5[1-5]\d{14}\z/

  # Visa credit card
  Visa = /\A4\d{15}\z/

  # US Social Security
  USSocialSecurity = /\A\d{3}-\d{2}-\d{4}\z/

  # General postal code
  # Validates a 5 digits postal code
  GeneralPostalCode = /\A\d{5}\z/

  # US ZIP code
  # Validates US ZIP Code (basic and extended format)
  ZIPCode = /\A(\d{5}\z)|(\d{5}-\d{4}\z)/

  # Twitter username
  TwitterUsername = /\A([a-z0-9\_])+\z/ix

  # Github username
  GithubUsername = /\A([a-z0-9\_\-])+\z/ix

  # Slideshare username
  SlideshareUsername = /\A([a-z0-9])+\z/ix

  # Del.icio.us username
  DeliciousUsername = /\A([a-z0-9\_\-])+\z/ix

  # Email
  # From the email regex research: http://fightingforalostcause.net/misc/2006/compare-email-regex.php
  # Authors: James Watts and Francisco Jose Martin Moreno
  Email = /\A([\w\!\#\z\%\&\'\*\+\-\/\=\?\\A\`{\|\}\~]+\.)*[\w\+-]+@((((([a-z0-9]{1}[a-z0-9\-]{0,62}[a-z0-9]{1})|[a-z])\.)+[a-z]{2,6})|(\d{1,3}\.){3}\d{1,3}(\:\d{1,5})?)\z/i

  # UUID
  # Validates a UUID as defined: http://en.wikipedia.org/wiki/Universally_unique_identifier
  UUID = /\A([0-9a-fA-F]{32}|[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12})\z/

  # Date DB format YYYY-MM-DD
  # I know it will validate 2001-02-31 but is I think we are focusing in formats more than in parsing
  DBDate = /\A\d{4}-(#{("01".."12").to_a.join("|")})-(#{("01".."31").to_a.join("|")})\z/

  # Date Time DB format YYYY-MM-DD hh:mm:ss
  DBDateTime = /\A\d{4}-(#{("01".."12").to_a.join("|")})-(#{("01".."31").to_a.join("|")})\s(#{("00".."23").to_a.join("|")}):(#{("00".."59").to_a.join("|")}):(#{("00".."59").to_a.join("|")})\z/

  # SpanishBankAccountNumber
  SpanishBankAccountNumber = /\A\d{4}[ -]?\d{4}[ -]?\d{2}[ -]?\d{10}\z/

  # IBAN
  # Source: http://snipplr.com/view/15322/iban-regex-all-ibans/
  # You have to remove spaces or any separator character from the original field before use this regex
  IBAN = /[a-zA-Z]{2}[0-9]{2}[a-zA-Z0-9]{4}[0-9]{7}([a-zA-Z0-9]?){0,16}/

  # MacAddress
  MacAddress = /\A([0-9A-F]{2}[:-]){5}([0-9A-F]{2})\z/i
end
