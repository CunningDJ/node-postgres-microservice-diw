-- USER PROFILE table

CREATE TABLE user_profile (
  id            uuid NOT NULL DEFAULT uuid_generate_v4(),
  display_name  character varying(40) NOT NULL,
  username      character varying(20) NOT NULL,
  dob           timestamp without time zone,

  -- Keys
  -- Primary Key
  CONSTRAINT user_profile_pkey PRIMARY KEY (id),

  -- Unique
  CONSTRAINT user_profile_uname_key UNIQUE (username)
);
