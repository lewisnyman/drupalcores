#!/usr/bin/env ruby

Encoding.default_external = Encoding::UTF_8
require 'erb'
require 'yaml'
require 'time'
require 'json'

kittencount = %x[#{'grep -roh kitten ../drupalcore/ | wc -w'}]
llamacount = %x[#{'grep -roh llama ../drupalcore/ | wc -w'}]
time = Time.now()
description = "Kittens or Llamas, who wins?"
header = ERB.new(File.new("../templates/partials/header.html.erb").read).result(binding)
footer = ERB.new(File.new("../templates/partials/footer.html.erb").read).result(binding)
index_template = File.open("../templates/kittens-vs-llamas.html.erb", 'r').read
renderer = ERB.new(index_template)
puts output = renderer.result()

__END__
