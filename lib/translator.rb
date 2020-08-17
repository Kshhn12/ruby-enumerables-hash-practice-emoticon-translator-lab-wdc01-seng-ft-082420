# require modules here
require 'pry'
require "yaml"

def load_library(emoticons)
  # code goes here
  emoticon_hash = {}
  file = YAML.load_file(emoticons)
  final_hash = {}
  file.each do |meaning, array_of_emoticons|
    emoticon_hash[meaning] = 
    { 
      :english => array_of_emoticons.first,
      :japanese => array_of_emoticons.last
    } 
  end
  emoticon_hash
end

def get_japanese_emoticon(path, emoticon)
  result = nil
  emoticon_hash = load_library(path)
  emoticon_hash.each do |meaning, emoticon_array|
    if emoticon == emoticon_array[:english]
      result = emoticon_array[:japanese]
    end
  end
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  result
end

def get_english_meaning(path, emoticon)
  result = nil
  emoticon_hash = load_library(path)
  emoticon_hash.each do |meaning, emoticon_array|
    if emoticon == emoticon_array[:japanese]
      result = meaning
    end
  end
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  result
end