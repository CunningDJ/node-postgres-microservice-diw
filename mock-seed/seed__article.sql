-- Seeds mock data for article.  Need to seed user_profile first.
DO $$
DECLARE
  author1_id uuid := (SELECT id FROM user_profile WHERE username = 'sampleUser1');
  author2_id uuid := (SELECT id FROM user_profile WHERE username = 'sampleUser2');
BEGIN
  -- Inserting three articles for sampleUser1
  INSERT INTO article
    (author_id, title, content)
    VALUES
    (author1_id, 'Article Title 1-1', 'This is the body text of Article 1-1.  The author is sampleUser1.');

  INSERT INTO article
    (author_id, title, content)
    VALUES
    (author1_id, 'Article Title 1-2', 'This is the body text of Article 1-2. The author is sampleUser1.');

  INSERT INTO article
    (author_id, title, content)
    VALUES
    (author1_id, 'Article Title 1-3', 'This is the body text of Article 1-3. The author is sampleUser1.');

  -- Inserting two articles for sampleUser2
  INSERT INTO article
    (author_id, title, content)
    VALUES
    (author2_id, 'Article Title 2-1', 'This is the body text of Article 2-1. The author is sampleUser2.');

  INSERT INTO article
    (author_id, title, content)
    VALUES
    (author2_id, 'Article Title 2-2', 'This is the body text of Article 2-2. The author is sampleUser2.');
END $$;
