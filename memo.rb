#coding: utf-8

class UrlEncoder
  def encoder(order_now)
    url = "eviterra.com/#{order_now[:flight][:from]}-#{order_now[:flight][:to]}/#{order_now[:flight][:date]}/#{order_now[:flight2][:from]}-#{order_now[:flight2][:to]}/#{order_now[:flight2][:date]}/#{order_now[:order][:cabins]}/#{order_now[:order][:adult]}".gsub('//','/')
  end

  def decoder

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
  def test_first
    order_now = {

        :order   => { :id => nil, :child => nil,  :adult => nil, :baby => nil   },
        :flight  => { :id => nil, :from => nil, :to => nil,  :date => nil },
        :flight2 => { :id => nil, :from => nil, :to => nil,  :date => nil },
        #:flight3 => { :id => nil, :from => nil, :to => nil,  :date => nil },
        #:flight4 => { :id => nil, :from => nil, :to => nil,  :date => nil },
        #:flight5 => { :id => nil, :from => nil, :to => nil,  :date => nil },
        #:flight6 => { :id => nil, :from => nil, :to => nil,  :date => nil },

    }

    order_now[:order][:id]      = 1
    order_now[:order][:baby]    = 1

    order_now[:flight][:id]     = 1
    order_now[:flight][:from]   = "MOW"
    order_now[:flight][:to]     = "LED"
    order_now[:flight][:date]   = "15-06-2013"

    order_now[:flight2][:id]    = 2
    order_now[:flight2][:from]  = "LED"
    order_now[:flight2][:to]    = "MOW"
    order_now[:flight2][:date]  = "25-06-2013"

    url = UrlEncoder.new.encoder(order_now)
    assert_equal url, "eviterra.com/MOW-LED/15-06-2013/LED-MOW/25-06-2013/"
  end

  def test_two
    order_now = {

        :order   => { :id => nil, :child => nil,  :adult => nil, :baby => nil   },
        :flight  => { :id => nil, :from => nil, :to => nil,  :date => nil },
        :flight2 => { :id => nil, :from => nil, :to => nil,  :date => nil },
        #:flight3 => { :id => nil, :from => nil, :to => nil,  :date => nil },
        #:flight4 => { :id => nil, :from => nil, :to => nil,  :date => nil },
        #:flight5 => { :id => nil, :from => nil, :to => nil,  :date => nil },
        #:flight6 => { :id => nil, :from => nil, :to => nil,  :date => nil },
    }

    order_now[:order][:id]      = 1
    order_now[:order][:baby]    = 1
    order_now[:order][:cabins]  = "business"

    order_now[:flight][:id]     = 1
    order_now[:flight][:from]   = "MOW"
    order_now[:flight][:to]     = "LED"
    order_now[:flight][:date]   = "15-06-2013"

    order_now[:flight2][:id]    = 2
    order_now[:flight2][:from]  = "LED"
    order_now[:flight2][:to]    = "MOW"
    order_now[:flight2][:date]  = "25-06-2013"

    url = UrlEncoder.new.encoder(order_now)
    assert_equal url, "eviterra.com/MOW-LED/15-06-2013/LED-MOW/25-06-2013/business/"
  end

  def test_three
    order_now = {
        :order   => { :id => nil, :child => nil,  :adult => nil, :baby => nil   },
        :flight  => { :id => nil, :from => nil, :to => nil,  :date => nil },
        :flight2 => { :id => nil, :from => nil, :to => nil,  :date => nil },
        #:flight3 => { :id => nil, :from => nil, :to => nil,  :date => nil },
        #:flight4 => { :id => nil, :from => nil, :to => nil,  :date => nil },
        #:flight5 => { :id => nil, :from => nil, :to => nil,  :date => nil },
        #:flight6 => { :id => nil, :from => nil, :to => nil,  :date => nil },
    }

    order_now[:order][:id]      = 1
    order_now[:order][:adult]   = "2adults"
    order_now[:order][:baby]    = 1

    order_now[:flight][:id]     = 1
    order_now[:flight][:from]   = "MOW"
    order_now[:flight][:to]     = "LED"
    order_now[:flight][:date]   = "15-06-2013"

    order_now[:flight2][:id]    = 2
    order_now[:flight2][:from]  = "LED"
    order_now[:flight2][:to]    = "MOW"
    order_now[:flight2][:date]  = "25-06-2013"

    url = UrlEncoder.new.encoder(order_now)
    assert_equal url, "eviterra.com/MOW-LED/15-06-2013/LED-MOW/25-06-2013/2adults"
  end

  def test_four
    order_now = {
        :order   => { :id => nil, :child => nil,  :adult => nil, :baby => nil   },
        :flight  => { :id => nil, :from => nil, :to => nil,  :date => nil },
        :flight2 => { :id => nil, :from => nil, :to => nil,  :date => nil },
        #:flight3 => { :id => nil, :from => nil, :to => nil,  :date => nil },
        #:flight4 => { :id => nil, :from => nil, :to => nil,  :date => nil },
        #:flight5 => { :id => nil, :from => nil, :to => nil,  :date => nil },
        #:flight6 => { :id => nil, :from => nil, :to => nil,  :date => nil },
    }

    order_now[:order][:id]      = 1
    order_now[:order][:adult]   = "2adults"
    order_now[:order][:baby]    = 1

    order_now[:flight][:id]     = 1
    order_now[:flight][:from]   = "MOW"
    order_now[:flight][:to]     = "LED"
    order_now[:flight][:date]   = "15-06-2013"

    order_now[:flight2][:id]    = 2
    order_now[:flight2][:from]  = "LED"
    order_now[:flight2][:to]    = "MOW"
    order_now[:flight2][:date]  = "25-06-2013"

    url = UrlEncoder.new.encoder(order_now)
    assert_equal url, "eviterra.com/MOW-LED/15-06-2013/LED-MOW/25-06-2013/2adults"
  end
end