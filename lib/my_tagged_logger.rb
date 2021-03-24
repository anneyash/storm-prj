class MyTaggedLogger
  def initialize(*tags)
    @tags = tags
  end

  def debug(msg, ex: nil)
    msg = append_exception_if_needed(msg, ex)
    log(:debug, msg)
  end

  def info(msg, ex: nil)
    msg = append_exception_if_needed(msg, ex)
    log(:info, msg)
  end

  def warn(msg, ex: nil)
    msg = append_exception_if_needed(msg, ex)
    log(:warn, msg)
  end

  def error(msg, ex: nil)
    msg = append_exception_if_needed(msg, ex)
    log(:error, msg)
  end

  def log(lvl, msg)
    Rails.logger.tagged(*@tags) { Rails.logger.send(lvl, msg) }
  end

  private

  def append_exception_if_needed(msg, ex)
    return msg if ex.blank? || !ex.respond_to?(:backtrace) || !ex.respond_to?(:message)

    "#{msg} Details: #{ex.backtrace.first}: #{ex.message} (#{ex.class}) \n" +
      ex.backtrace.drop(1).map{|s| "\t#{s}"}.join("\n") if ex
  end
end
