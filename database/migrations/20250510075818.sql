-- Create "users" table
CREATE TABLE "users" (
  "id" uuid NOT NULL,
  "name" character varying(255) NOT NULL,
  "email" character varying(255) NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
  PRIMARY KEY ("id")
);
-- Create "recipes" table
CREATE TABLE "recipes" (
  "id" uuid NOT NULL,
  "user_id" uuid NOT NULL,
  "title" character varying(255) NOT NULL,
  "instructions" character varying(255) NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "user_id" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);
-- Create "ingredients" table
CREATE TABLE "ingredients" (
  "id" uuid NOT NULL,
  "recipe_id" uuid NOT NULL,
  "name" character varying(255) NOT NULL,
  "quantity" character varying(255) NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "recipe_id" FOREIGN KEY ("recipe_id") REFERENCES "recipes" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);
