require 'faker'
require 'fileutils'

quantity = 10000
path = '../content/fr/posts/'
medias = [
    '2f0c2f50-84fe-4fab-8e33-62cae514828a',
    '7b416344-4789-4485-83ac-2751aa740f10'
]

quantity.times do |index|
    date = Date.today - (rand * 365 * 10)
    title = Faker::Book.title
    slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    puts "#{index} #{slug}"
    file = "#{path}#{date.year}/#{date.strftime "%Y-%m-%d"}-#{slug}.html"
    directory = File.dirname file
    FileUtils.mkdir_p directory
    File.write(file, "---
title: #{title}
date: #{date.iso8601}
slug: #{slug}
image:
  id: #{medias.sample}
  alt: 
  credit: >
description_short: >
  #{Faker::Lorem.paragraph_by_chars number: 200}
contents:
  - kind: block
    template: chapter
    title: >-

    ranks:
      self: false
    position: 1
    data:
      text: >-
        <p>#{Faker::Lorem.paragraph_by_chars number: 3000, supplemental: true }</p>
        <p>#{Faker::Lorem.paragraph_by_chars number: 3000, supplemental: true }</p>
        <p>#{Faker::Lorem.paragraph_by_chars number: 3000, supplemental: true }</p>
      notes: >-
      alt: >-
      credit: >-
---")
end