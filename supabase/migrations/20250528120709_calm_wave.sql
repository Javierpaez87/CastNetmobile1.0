/*
  # Create fishing trips table

  1. New Tables
    - `fishing_trips`
      - `id` (uuid, primary key)
      - `user_id` (uuid, references auth.users)
      - `location` (text)
      - `start_date` (date)
      - `end_date` (date)
      - `start_time` (time)
      - `end_time` (time)
      - `activity_type` (text)
      - `activity_other` (text)
      - `available_spots` (integer)
      - `created_at` (timestamptz)

  2. Security
    - Enable RLS on `fishing_trips` table
    - Add policies for:
      - Users can read all trips
      - Users can only create/update/delete their own trips
*/

CREATE TABLE IF NOT EXISTS fishing_trips (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users NOT NULL,
  location text NOT NULL,
  start_date date NOT NULL,
  end_date date NOT NULL,
  start_time time NOT NULL,
  end_time time NOT NULL,
  activity_type text NOT NULL,
  activity_other text,
  available_spots integer NOT NULL DEFAULT 1,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE fishing_trips ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view fishing trips"
  ON fishing_trips
  FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Users can create their own trips"
  ON fishing_trips
  FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own trips"
  ON fishing_trips
  FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete their own trips"
  ON fishing_trips
  FOR DELETE
  TO authenticated
  USING (auth.uid() = user_id);