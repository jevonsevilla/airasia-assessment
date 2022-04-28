with date_diff as (
    select BookingCustomerEmailAddress, BookingID, PassengerID, Datediff(day, BookingDate, TravelDate) as days
    from airline_bookings
    where RevenueType like "BaseFare"
    )

select BookingCustomerEmailAddress, AVG(days) as AverageDays
from date_diff
group by BookingCustomerEmailAddress