CREATE MIGRATION m1xk56gcyxrs6lfoh3sf37qg5q2mbis7q2wcyiijjsf5f3tcwo5i6q
    ONTO initial
{
  CREATE TYPE default::TaskStatus {
      CREATE REQUIRED PROPERTY created_at: std::datetime {
          SET default := (std::datetime_of_statement());
          SET readonly := true;
      };
      CREATE REQUIRED PROPERTY execute_after: std::datetime {
          SET default := (std::datetime_of_statement());
          SET readonly := true;
      };
      CREATE PROPERTY finished_at: std::datetime;
      CREATE PROPERTY started_at: std::datetime;
  };
  CREATE TYPE default::BarTask {
      CREATE REQUIRED LINK status: default::TaskStatus {
          CREATE CONSTRAINT std::exclusive;
      };
      CREATE PROPERTY status_code: std::int32;
  };
  CREATE TYPE default::BazTask {
      CREATE REQUIRED LINK status: default::TaskStatus {
          CREATE CONSTRAINT std::exclusive;
      };
      CREATE REQUIRED PROPERTY rand_num: std::int32;
  };
  CREATE TYPE default::FooTask {
      CREATE REQUIRED LINK status: default::TaskStatus {
          CREATE CONSTRAINT std::exclusive;
      };
      CREATE REQUIRED PROPERTY given_id: std::str {
          CREATE CONSTRAINT std::exclusive;
      };
  };
};
