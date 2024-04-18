CREATE MIGRATION m1ica7d7a7cmhyjarnx5vmd7fykehlggw3wdairbvyklee4pexhyxq
    ONTO m1xk56gcyxrs6lfoh3sf37qg5q2mbis7q2wcyiijjsf5f3tcwo5i6q
{
  ALTER TYPE default::BazTask {
      ALTER PROPERTY rand_num {
          RESET OPTIONALITY;
      };
  };
};
