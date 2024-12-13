-- All staff members from a specific department
SELECT * FROM staff
WHERE department = 'Поликлиника';

-- All staff members with a specific position
SELECT * FROM staff
WHERE position = 'Хирург';

-- Staff with no contact info
SELECT * FROM patient
WHERE email IS NULL AND phone_number IS NULL;

-- All appointments for a certain patient for today
SELECT * FROM schedule
WHERE patient_id = 1 
    AND date_time >= CURRENT_DATE 
    AND date_time < CURRENT_DATE + INTERVAL '1 day'
ORDER BY date_time;

-- All appointments for a certain staff member for today
SELECT * FROM schedule
WHERE staff_id = 1 
    AND date_time >= CURRENT_DATE 
    AND date_time < CURRENT_DATE + INTERVAL '1 day'
ORDER BY date_time;

-- Postponed appointments
SELECT * FROM schedule
WHERE abscent = True;

-- Unpaid operations
SELECT * FROM purchase
LEFT JOIN patient
ON patient.id = purchase.patient_id
WHERE purchase.paid = False;

-- Total of the provided services over the last month
SELECT SUM(total) FROM purchase
WHERE date_time > CURRENT_DATE - INTERVAL '1 month'
    AND date_time < CURRENT_DATE + INTERVAL '1 day';

-- Number of patients in each room
SELECT room.number, COUNT(patient.id) FROM room
LEFT JOIN patient
ON patient.room_id = room.id
GROUP BY room.id;
