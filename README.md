# RubyRegex

[![Gem Version](https://badge.fury.io/rb/ruby_regex.svg)](http://badge.fury.io/rb/ruby_regex)
[![Build Status](https://travis-ci.org/eparreno/ruby_regex.svg)](https://travis-ci.org/eparreno/ruby_regex)
[![Code Climate](https://codeclimate.com/github/eparreno/ruby_regex/badges/gpa.svg)](https://codeclimate.com/github/eparreno/ruby_regex)

RubyRegex is a nice collection of regular expressions in Ruby

## Regular expressions

```
RubyRegex::Url
RubyRegex::Domain
RubyRegex::Email
RubyRegex::Username
RubyRegex::USSocialSecurity
RubyRegex::GeneralPostalCode
RubyRegex::ZIPCode
RubyRegex::CreditCard
RubyRegex::MasterCard
RubyRegex::Visa
RubyRegex::TwitterUsername
RubyRegex::DeliciousUsername
RubyRegex::SlideshareUsername
RubyRegex::GithubUsername
RubyRegex::UUID
RubyRegex::DBDate
RubyRegex::DBDatetime
RubyRegex::SpanishBankAccountNumber
RubyRegex::Dni
```

## Rails

  Add to your Gemfile

    gem 'ruby_regex'

  In the models

    validates_format_of :email, :with => RubyRegex::Email

## Contribute

Of course, contributions will be apreciated.

If you want to contribute send me a pull request with new regular expressions (and their tests) or send me an email  with your desired regular expression to emili@eparreno.com

---

RubyRegex is released under the MIT-License and is Copyright (c)2010 Emili Parreño.
