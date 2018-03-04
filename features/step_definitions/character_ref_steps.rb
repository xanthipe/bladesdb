# Action steps

When(/^the character ref approves the character point adjustment$/) do
  DashboardPage.new.visit_page(approvals_path).and.approve_approval("character point adjustment")
end

When(/^the character ref rejects the character point adjustment$/) do
  DashboardPage.new.visit_page(approvals_path).and.reject_approval("character point adjustment")
end
