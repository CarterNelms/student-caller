Fabricator(:student) do
  first_name "User"
  last_name sequence(:last_name){|i| "Number#{i}"}
end
