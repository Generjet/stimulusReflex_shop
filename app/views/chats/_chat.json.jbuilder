json.extract! chat, :id, :message, :sender, :receiver, :created_at, :updated_at
json.url chat_url(chat, format: :json)
