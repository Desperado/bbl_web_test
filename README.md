## Overview

The proposed solution is a handful example of the good usage of BDD against front-end web application.
For this purpose, I have selected http://check24.de as it is very well known in Germany.

Both [Cucumber](https://cucumber.io/) and [Capybara](http://jnicklas.github.io/capybara/) are used here.


### Installation

#### MacOS

Please Install *Xcode Commandline tools* and `gpg` before `rvm`

```
xcode-select --install
brew install gpg
``` 

Add executable to system path
The Selenium client bindings will try to locate the geckodriver executable from the system path. You will need to add the directory containing the executable to the system path.

Also make sure you have installed `marionette\geckodriver`, since modern Firefox and Chrome browser will not run tests currently without it
https://stackoverflow.com/questions/41310586/ruby-selenium-webdriver-unable-to-find-mozilla-geckodriver
On Unix systems you can do the following to append it to your system’s search path, if you’re using a bash-compatible shell:
```
export PATH=$PATH:/path/to/geckodriver
```

Please install [rvm](http://rvm.io/) with Ruby version 2.4.1 or higher
after that in checked out directory please do the following to install the dependencies:
```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.4.1
```

Checkout and cd to repository contents, then do:

```
source /<your_local_dir>/.rvm/scripts/rvm
rvm use 2.4.1
gem install bundler
bundle install
```

### Testing

#### Running e2e tests
The tools used to run e2e tests are [Cucumber](https://cucumber.io/) and [Capybara](http://jnicklas.github.io/capybara/). Configuration file `application.yml` is located in the project root. To run test execute the following command:
```
cucumber --format pretty
```

To execute just one Test Scenario you need to run:
```
cucumber features/sign_in.feature
```

By default, tests would run on firefox, but if you need them to run on chrome, you need to run:
```
BROWSER='chrome' cucumber features/search.feature
```

To get also json output format, please run
```
cucumber --format pretty --format json --out report/report.json
```

#### Other

The solution is also designed to save screenshots upon failure. They would be saved to `./features/screenshots` directory.
