CREATE MIGRATION m177d4ug43qrypkpzpekxio4d73tpwrq6qdly4kfv5h42x5hy2usra
    ONTO m1ica7d7a7cmhyjarnx5vmd7fykehlggw3wdairbvyklee4pexhyxq
{
  ALTER TYPE default::BarTask {
      DROP LINK status;
  };
  ALTER TYPE default::BazTask {
      DROP LINK status;
  };
  ALTER TYPE default::FooTask {
      DROP LINK status;
  };
  CREATE ABSTRACT TYPE default::HasStatus {
      CREATE REQUIRED LINK status: default::TaskStatus {
          ON TARGET DELETE DELETE SOURCE;
          CREATE CONSTRAINT std::exclusive;
      };
  };
  ALTER TYPE default::BarTask {
      CREATE LINK status: default::TaskStatus {
          ON TARGET DELETE DELETE SOURCE;
          SET REQUIRED USING (<default::TaskStatus>{});
      };
      EXTENDING default::HasStatus LAST;
  };
  ALTER TYPE default::BarTask {
      ALTER LINK status {
          RESET OPTIONALITY;
          DROP OWNED;
          RESET TYPE;
      };
  };
  ALTER TYPE default::BazTask {
      CREATE LINK status: default::TaskStatus {
          ON TARGET DELETE DELETE SOURCE;
          SET REQUIRED USING (<default::TaskStatus>{});
      };
      EXTENDING default::HasStatus LAST;
  };
  ALTER TYPE default::BazTask {
      ALTER LINK status {
          RESET OPTIONALITY;
          DROP OWNED;
          RESET TYPE;
      };
  };
  ALTER TYPE default::FooTask {
      CREATE LINK status: default::TaskStatus {
          ON TARGET DELETE DELETE SOURCE;
          SET REQUIRED USING (<default::TaskStatus>{});
      };
      EXTENDING default::HasStatus LAST;
  };
  ALTER TYPE default::FooTask {
      ALTER LINK status {
          RESET OPTIONALITY;
          DROP OWNED;
          RESET TYPE;
      };
  };
};
