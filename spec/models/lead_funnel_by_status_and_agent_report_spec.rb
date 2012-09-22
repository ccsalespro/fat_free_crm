require 'spec_helper'

describe 'LeadFunnelByStatusAndAgentReport' do
  it 'passes smoke test' do
    LeadFunnelByStatusAndAgentReport.new(Date.yesterday, Date.today)
  end
end
