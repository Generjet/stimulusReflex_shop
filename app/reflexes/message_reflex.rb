# frozen_string_literal: true

class MessageReflex < ApplicationReflex

      # to catch parameter contents on terminal
    # binding.pry
    # @incomeData = params[:chat]
    # @msg = Chat.new
    # @msg.sender = @incomeData["sender"]
    # @msg.message = @incomeData["message"]
    # @msg.receiver = @incomeData["receiver"]
    # @msg.save
    # morph "#new_sms", render(partial: "message_part", locals: {new_message: @incomeData})
  def create
    @chat = Chat.new(chat_params)
    @chat.save

    # yankee = "ROCKET UP!"
    # morph "#foo", render(partial: "foo", locals: {message: yankee})
  end

  def save_message
    @message = element.dataset[:message]
    @sender = element.dataset[:sender]
    @chat = Chat.new
    @chat.message = @message
    @chat.sender = @sender
  end
  # Add Reflex methods in this file.
  #
  # All Reflex instances include CableReady::Broadcaster and expose the following properties:
  #
  #   - connection  - the ActionCable connection
  #   - channel     - the ActionCable channel
  #   - request     - an ActionDispatch::Request proxy for the socket connection
  #   - session     - the ActionDispatch::Session store for the current visitor
  #   - flash       - the ActionDispatch::Flash::FlashHash for the current request
  #   - url         - the URL of the page that triggered the reflex
  #   - params      - parameters from the element's closest form (if any)
  #   - element     - a Hash like object that represents the HTML element that triggered the reflex
  #     - signed    - use a signed Global ID to map dataset attribute to a model eg. element.signed[:foo]
  #     - unsigned  - use an unsigned Global ID to map dataset attribute to a model  eg. element.unsigned[:foo]
  #   - cable_ready - a special cable_ready that can broadcast to the current visitor (no brackets needed)
  #   - reflex_id   - a UUIDv4 that uniquely identies each Reflex
  #
  # Example:
  #
  #   before_reflex do
  #     # throw :abort # this will prevent the Reflex from continuing
  #     # learn more about callbacks at https://docs.stimulusreflex.com/lifecycle
  #   end
  #
  #   def example(argument=true)
  #     # Your logic here...
  #     # Any declared instance variables will be made available to the Rails controller and view.
  #   end
  #
  # Learn more at: https://docs.stimulusreflex.com/reflexes#reflex-classes
  private  
  # Only allow a list of trusted parameters through.
    def chat_params
      params.require(:chat).permit(:message, :sender, :receiver)
    end

end
