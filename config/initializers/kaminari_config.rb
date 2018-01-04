# frozen_string_literal: true
Kaminari.configure do |config|
  config.default_per_page = 20
  config.max_per_page = nil
  config.window = 4
  config.outer_window = 0
  config.left = 0
  config.right = 0
  config.page_method_name = :page
  config.param_name = :page
  config.params_on_first_page = false
end

[1,2,3,4,5,6,7,8,9,10]
[1,2,3] #`
[1,2,3,4,5,6,7,8,9,10]
[4,5,6] #2