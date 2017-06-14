require File.dirname(__FILE__) + '/ecpay/helper.rb'
require File.dirname(__FILE__) + '/ecpay/notification.rb'

module OffsitePayments #:nodoc:
  module Integrations #:nodoc:
    module Ecpay
      PAYMENT_CREDIT_CARD = 'Credit'
      PAYMENT_ATM         = 'ATM'
      PAYMENT_CVS         = 'CVS'
      PAYMENT_ALIPAY      = 'Alipay'
      PAYMENT_BARCODE     = 'BARCODE'

      SUBPAYMENT_ATM_TAISHIN      = 'TAISHIN'
      SUBPAYMENT_ATM_ESUN         = 'ESUN'
      SUBPAYMENT_ATM_HUANAN       = 'HUANAN'
      SUBPAYMENT_ATM_BOT          = 'BOT'
      SUBPAYMENT_ATM_FUBON        = 'FUBON'
      SUBPAYMENT_ATM_CHINATRUST   = 'CHINATRUST'
      SUBPAYMENT_ATM_FIRST        = 'FIRST'

      SUBPAYMENT_CVS_CVS    = 'CVS'
      SUBPAYMENT_CVS_OK     = 'OK'
      SUBPAYMENT_CVS_FAMILY = 'FAMILY'
      SUBPAYMENT_CVS_HILIFE = 'HILIFE'
      SUBPAYMENT_CVS_IBON   = 'IBON'

      PAYMENT_TYPE        = 'aio'

      mattr_accessor :service_url
      mattr_accessor :logistics_url
      mattr_accessor :merchant_id
      mattr_accessor :hash_key
      mattr_accessor :hash_iv
      mattr_accessor :logistics_hash_key
      mattr_accessor :logistics_hash_iv
      mattr_accessor :debug

      def self.service_url
        mode = ActiveMerchant::Billing::Base.mode
        case mode
          when :production
            'https://payment.ecpay.com.tw/Cashier/AioCheckOut/V5'
          when :development, :test
            'https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut/V5'
          else
            raise StandardError, "Integration mode set to an invalid value: #{mode}"
        end
      end

      def self.logistics_url
        mode = ActiveMerchant::Billing::Base.mode
        case mode
          when :production
            'https://logistics.ecpay.com.tw/Express/map'
          when :development, :test
            'https://logistics-stage.ecpay.com.tw/Express/map'
          else
            raise StandardError, "Integration mode set to an invalid value: #{mode}"
        end
      end

      def self.notification(post)
        Notification.new(post)
      end

      def self.setup
        yield(self)
      end
    end
  end
end
