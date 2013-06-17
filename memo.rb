#coding: utf-8

class UrlEncoder
  def encoder(order_now)
    "eviterra.com/" + order_now.values.join("/")
  end

  def decoder(url_decode)

    decode = url_decode.split("/") - ["eviterra.com"]
    order_now = {}
    segment_count ||= 0
    date_count ||= 0

    decode.each do |array|
      if array.size == 3
        segment_count += 1
        order_now["segment#{segment_count}".to_sym] = array
      elsif array.size == 10
        date_count += 1
        order_now["date#{date_count}".to_sym] = array
      elsif array =~ /^adults/
        order_now[:adults] = array
      elsif array =~ /^children/
        order_now[:children] = array
      elsif array =~ /^baby/
        order_now[:baby] = array
      elsif array =~ /^economy|^business|^first/
        order_now[:cabin] = array
      else
        puts "no_segment"
      end
    end
    order_now
  end
end

require "rubygems"

require "minitest"

require "minitest/autorun"

class TestMeme < Minitest::Test

  # из Москвы в Санкт-петербург 10 мая 2013
  # Санкт-петербург Сочи 15 мая 2013
  # 2 детей, 1 младенец

  # 1 полетных сегментов
  # 2 откуда куда когда
  # 3 количество пасажиров (взрослых, детей, младенцев)
  # 4 эконом, бизнес, первый класс.
  # До 6 сегментов
  def test_encoder

    order_now = Hash.new

    order_now[:segment1]   = "MOW"
    order_now[:segment2]   = "LED"
    order_now[:date1]      = "15-06-2013"

    order_now[:segment3]   = "LED"
    order_now[:segment4 ]  = "MOW"
    order_now[:date2]      = "25-06-2013"

    order_now[:adults]     = "adults2"
    order_now[:children]   = "children1"
    order_now[:baby]       = "baby1"

    order_now[:cabin]      = "business"

    url = UrlEncoder.new.encoder(order_now)
    assert_equal url, "eviterra.com/MOW/LED/15-06-2013/LED/MOW/25-06-2013/adults2/children1/baby1/business"
  end

  def test_decoder
    order_now = Hash.new

    order_now[:segment1]   = "MOW"
    order_now[:segment2]   = "LED"
    order_now[:date1]      = "15-06-2013"

    order_now[:segment3]   = "LED"
    order_now[:segment4 ]  = "MOW"
    order_now[:date2]      = "25-06-2013"

    order_now[:adults]     = "adults2"
    order_now[:children]   = "children1"
    order_now[:baby]       = "baby1"

    order_now[:cabin]      = "business"

    url_decode = "eviterra.com/MOW/LED/15-06-2013/LED/MOW/25-06-2013/adults2/children1/baby1/business"
    url_decode = UrlEncoder.new.decoder(url_decode)
    assert_equal url_decode, order_now
  end
end