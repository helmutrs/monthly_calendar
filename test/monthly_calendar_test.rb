# frozen_string_literal: true

require 'minitest/autorun'
require 'test_helper'

class MonthlyCalendarTest < Minitest::Test
  def test_monthly_calendar_initialization
    calendar = MonthlyCalendar.new(2024, 6)
    assert_equal 2024, calendar.year
    assert_equal 6, calendar.month
  end

  def test_monthly_calendar_days_in_month
    calendar = MonthlyCalendar.new(2024, 2)
    assert_equal 29, calendar.days_in_month # 2024 is a leap year
  end

  def test_monthly_calendar_first_day_of_week
    calendar = HrCrypto::MonthlyCalendar.new(2024, 6)
    assert_equal 6, calendar.first_day_of_week # June 1, 2024 is a Saturday
  end
end
