# Goworker / Resque Ruby Worker example

Playing around with [goworker](https://github.com/benmanns/goworker) and by extension [resque](https://github.com/resque/resque).

Inspired by a guy complaining about 'having' to rewrite all his workers in go. Just port the ones that have already reached the limit of available performance or don't bother.

## Installation

`go build` the `goworker/worker.go` example, it's just the one from the goworker website.

`bundle install` the ruby dependencies.

`apt-get install redis-server` or equivalent for your platform.

`bundle exec foreman start` to launch sinatra, a ruby worker, a go worker and redis-server. - nb. this has only been used on Ubuntu 14.10 so your mileage may vary.

## Usage

The sinatra application has the following endpoints:

```
/ruby    enqueues a job to the ruby worker queue
         response: {"job":"HelloRuby","enqueued":true}
/go      enqueues a job to the go worker queue
         response: {"job":"HelloGo","enqueued":true}
/queues  gets the current queue count for all registered queues
         response: [{"name":"hello\_ruby","count":0},{"name":"hello\_go","count":0}]
```
