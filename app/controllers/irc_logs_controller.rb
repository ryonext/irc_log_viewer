class IrcLogsController < ApplicationController
  def new
    @irc_log = IrcLog.new
  end

  def create
    @irc_log = IrcLog.new(irc_log_params)

    respond_to do |format|
      if @irc_log.save
        format.html { render :new }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def irc_log_params
      params.require(:irc_log).permit(:log_file, :channel_name)
    end
end
