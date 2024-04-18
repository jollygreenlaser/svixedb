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
        index on (.execute_after);

        started_at: datetime;
        index on (exists .started_at);
        finished_at: datetime;
    }

    abstract type HasStatus {
        required status -> TaskStatus {
            on target delete delete source;
            constraint exclusive;
        }
    }

    type FooTask extending HasStatus {
        required given_id: str {
            constraint exclusive;
        }
    }

    type BarTask extending HasStatus {
        status_code: int32;
    }

    type BazTask extending HasStatus {
        rand_num: int32;
    }
}
