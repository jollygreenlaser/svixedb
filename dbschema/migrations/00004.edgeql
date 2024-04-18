CREATE MIGRATION m1r5iwovzti2eq3x6lhlgpa7bqnccho7dl5wrvwntcllj5xuj3rhka
    ONTO m177d4ug43qrypkpzpekxio4d73tpwrq6qdly4kfv5h42x5hy2usra
{
  ALTER TYPE default::TaskStatus {
      CREATE INDEX ON (.execute_after);
      CREATE INDEX ON (EXISTS (.started_at));
  };
};
