class Offer < ApplicationRecord
    belongs_to :post

    enum status: {
        "Decline" => "0",
        "Acctept" => "1",
      }
end
