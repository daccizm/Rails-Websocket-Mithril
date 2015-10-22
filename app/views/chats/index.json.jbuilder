json.array!(@chats) do |chat|
  json.id chat.id
  json.message chat.message
end
