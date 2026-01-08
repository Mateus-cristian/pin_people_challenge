# frozen_string_literal: true

require 'pragmatic_segmenter'
require_relative 'lexicon'
require 'unicode_utils/downcase'
require 'unicode_utils/nfkd'

module Sentiment
  class Analyzer
    def initialize(text)
      @text = normalize(text)
    end

    def call
      return :neutral if @text.blank?

      sentences = PragmaticSegmenter::Segmenter.new(text: @text, language: 'pt').segment
      return :neutral if sentences.empty?

      scores = sentences.map { |sentence| sentiment_score(sentence) }
      avg_score = scores.sum.to_f / scores.size

      if avg_score > 0
        :positive
      elsif avg_score < 0
        :negative
      else
        :neutral
      end
    end

    private

    def normalize(text)
      t = text.to_s
      t = UnicodeUtils.nfkd(t).gsub(/\p{Mn}/, '')
      t = UnicodeUtils.downcase(t)
      t.gsub(/[^\p{L}\s]/, '')
    end

    def sentiment_score(text)
      words = text.split
      positive = words.count { |w| Lexicon::POSITIVE.include?(w) }
      negative = words.count { |w| Lexicon::NEGATIVE.include?(w) }
      positive - negative
    end
  end
end
