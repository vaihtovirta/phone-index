[![Codeship Status for olympicsmoker/phone-index](https://codeship.com/projects/f52805b0-6008-0134-1d94-065e33494ddb/status?branch=master)](https://codeship.com/projects/174462)
[![Code Climate](https://codeclimate.com/github/vaihtovirta/phone-index/badges/gpa.svg)](https://codeclimate.com/github/vaihtovirta/phone-index)

Web application for searching information about mobile devices from http://www.gsmarena.com

This application was implemented as part of the test task. I decided to release it in public repo for the history :smile:

It built with simple Rails backend and AngularJS for frontend. It doesn't use any database for storing information, it just parses fetched pages on the fly.

# Demo

http://phone-index.herokuapp.com

# Usage
  Run setup script:
   
  ```bash
  bin/setup
  ```
  
  Start Rails server:
  
  ```bash
  bin/rails s
  ```
  
# Adding new searching sources

New search sources can be easily added by creating appropriate [Page](https://github.com/vaihtovirta/phone-index/blob/master/app/pages) and [Client](https://github.com/vaihtovirta/phone-index/blob/master/app/clients) classes.
See also [SourceManager service](https://github.com/vaihtovirta/phone-index/blob/master/app/services/source_manager.rb) for naming convention reference.

