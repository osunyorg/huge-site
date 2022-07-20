require 'faker'
require 'fileutils'

quantity = 10
path = 'content/posts/'
medias = [
    'fd27ad0e-4144-4625-95c0-f7e6d940aea0',
    '7b416344-4789-4485-83ac-2751aa740f10'
]

quantity.times do
    date = Date.today - (rand * 365 * 10)
    title = Faker::Book.title
    slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    puts slug
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
blocks:
  - template: chapter
    title: >-
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