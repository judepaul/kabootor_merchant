FactoryGirl.define do
  factory :resource_info do
    tenant nil
    customer nil
    storage_provider nil
    resource_type "MyText"
    availability_status "MyText"
    resource_uri "MyText"
    resource_size 1
    resource_length 1
  end
end
