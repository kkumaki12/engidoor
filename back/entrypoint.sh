#!/bin/bash

sudo service nginx start
cd /back
bin/setup
bundle exec pumactl start
