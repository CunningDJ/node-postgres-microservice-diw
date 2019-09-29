-- Seeds mock data for user_profile

INSERT INTO user_profile
  (username, display_name, dob)
  VALUES
  ('sampleUser1', 'Mr. User One', TIMESTAMP '2000-01-01 13:00:00');

INSERT INTO user_profile
  (username, display_name, dob)
  VALUES
  ('sampleUser2', 'Ms. User Two', TIMESTAMP '2000-02-02 14:00:00');
