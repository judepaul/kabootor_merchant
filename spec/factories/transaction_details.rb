FactoryGirl.define do
  factory :transaction_detail do
    tenant nil
    sender_id 1
    sender_email "MyText"
    receiver_id 1
    receiver_email "MyText"
    txn_date "2017-09-13 13:37:52"
  end
end
