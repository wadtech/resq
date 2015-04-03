web: ruby server.rb
redis: redis-server
rb_worker: TERM_CHILD=1 rake resque:work QUEUE=hello_ruby
go_worker: goworker -queues=hello_go -use-number=true
