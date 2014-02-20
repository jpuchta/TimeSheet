json.array!(@work_cards) do |work_card|
  json.extract! work_card, :id, :start_at, :end_at, :pause
  json.url work_card_url(work_card, format: :json)
end
