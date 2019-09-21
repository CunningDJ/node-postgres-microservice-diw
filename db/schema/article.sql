-- table: ARTICLE

CREATE TABLE article (
  id            uuid NOT NULL DEFAULT uuid_generate_v4(),
  author_id     uuid NOT NULL,
  
  title         character varying(100),
  description   character varying(250),
  content       text,

  created_at    timestamp without time zone DEFAULT timezone('utc'::text, now()),

  -- Keys
  -- Primary Key
  CONSTRAINT article_pkey PRIMARY KEY (id),

  -- Foreign
  CONSTRAINT article__user_profile__fkey FOREIGN KEY (author_id)
    REFERENCES user_profile (id) MATCH SIMPLE
    ON DELETE CASCADE ON UPDATE CASCADE
);
