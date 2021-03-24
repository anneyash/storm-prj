require 'my_tagged_logger'

module Api
  class BaseApiController < ApplicationController
    Unauthorised = Class.new StandardError

    rescue_from StandardError do |ex|
      api_logger.error 'rescue_from StandardError', ex: ex

      render json: { status: 'err_500' }
    end

    rescue_from ActiveRecord::RecordNotFound do |_ex|
      api_logger.warn 'rescue_from ActiveRecord::RecordNotFound, returning use code: err_404_not_found'

      render json: { status: 'err_404_not_found' }
    end

    rescue_from Unauthorised do |_ex|
      api_logger.warn 'rescue_from Unauthorised'

      render json: { status: 'err_401_unauthorized' }
    end

    rescue_from ActiveRecord::RecordInvalid do |ex|
      unless ex.record
        msg = 'rescue_from ActiveRecord::RecordInvalid - tried to intercept validation error, but ex.record is blank'
        api_logger.error msg, ex: ex

        break render json: { status: 'err_500' }
      end

      render json: { status: 'err_validation', ex.record.class.to_s => ex.record.errors.messages }
    end

    # поскольку мы наследюуемся от ActionController::API , нам respond_to не нужен
    # см. https://stackoverflow.com/a/35985101/7093796
    # respond_to :json

    def api_logger(*tags)
      @api_logger ||= MyTaggedLogger.new *['Api::V1', "#{controller_name}##{action_name}", tags].flatten
    end
  end
end

