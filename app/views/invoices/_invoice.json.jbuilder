json.extract! invoice, :id, :user_id, :address_id, :identifier, :token, :description, :send_date, :due_date, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
