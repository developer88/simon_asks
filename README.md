simon-ask
=========

[Working in progress]

## Abit of History:

I worked on some project in 2013 and at some time decided to move out some code to external module (e.g. Gem), so that is how branch v0.0.1 has been created. Next I tried to finish the gem (master branch) but the code is a crap, to tell the truth, so I will not do anything with it. You may create a fork if you like and finish it :(


![Travis-ci](https://travis-ci.org/developer88/simon_asks.png)

![Codeclimate](https://codeclimate.com/github/developer88/simon_asks.png)

Q&amp;A Gem for Rails inspired by [Stackoverflow](http://stackoverflow.com).



 rake simon_asks:install:migrations

 
will create votes table for gem acts_as_votable



## Installation

Add this line to your application's Gemfile:

    gem 'simon_asks'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simon_asks

Install gem to your project:

    $ rails g simon_asks:install

Run migrations as:

    $ rake db:migrate

Copy views, controllers, models and ActiveAdmin Resources if you need them:

    $ rails g simon_asks:views
    $ rails g simon_asks:controllers
    $ rails g simon_asks:models
    $ rails g simon_asks:active_admin

## Usage


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Licence

This code is [MIT][mit] licenced:

Copyright (c) 2013 Eremin Andrey & Volkov Anton

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


[mit]: http://www.opensource.org/licenses/mit-license.php
[murmur]: http://en.wikipedia.org/wiki/MurmurHash
[research]: https://panopticlick.eff.org/browser-uniqueness.pdf
