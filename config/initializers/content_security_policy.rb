# frozen_string_literal: true

# CSP desabilitada para desenvolvimento
# Rails.application.config.content_security_policy = nil

Rails.application.configure do
  config.content_security_policy do |policy|
    policy.default_src :self
    policy.font_src :self, :data
    policy.img_src  :self, :data
    policy.object_src :none
    policy.script_src :self, :unsafe_inline
    policy.style_src  :self, :unsafe_inline
    policy.connect_src :self,
                       "http://localhost:3000",
                       "http://127.0.0.1:3000",
                       "ws://localhost:3000",
                       "ws://127.0.0.1:3000"
  end
end
