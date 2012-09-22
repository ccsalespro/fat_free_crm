class CreateLeadStatusChanges < ActiveRecord::Migration
  def up
    execute <<-END_SQL
      CREATE TABLE lead_status_changes(
        id serial PRIMARY KEY,
        lead_id integer NOT NULL REFERENCES leads,
        assigned_to integer REFERENCES users,
        status varchar NOT NULL,
        created_at timestamp NOT NULL
      );
    END_SQL
  end
  
  def down
    execute <<-END_SQL
      DROP TABLE lead_status_changes;
    END_SQL
  end
end
