module default {
    type TaskStatus {
        required created_at: datetime {
            default := datetime_of_statement();
            readonly := true;
        }

        required execute_after: datetime {
            default := datetime_of_statement();
            readonly := true;
        }

        started_at: datetime;
        finished_at: datetime;
    }

    type FooTask {
        required status -> TaskStatus {
            constraint exclusive;
        }
        required given_id: str {
            constraint exclusive;
        }
    }

    type BarTask {
        required status -> TaskStatus {
            constraint exclusive;
        }
        status_code: int32;
    }

    type BazTask {
        required status -> TaskStatus {
            constraint exclusive;
        }
        required rand_num: int32;
    }
}
