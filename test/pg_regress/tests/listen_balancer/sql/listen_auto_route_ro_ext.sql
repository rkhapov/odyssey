\connect 'host=localhost port=8433 user=rruser dbname=postgres'

-- extended protocol read-only batch must be routed to a standby
select pg_is_in_recovery() \parse ext_ro_stmt
\bind_named ext_ro_stmt
\g

-- the statement parsed in a previous batch is executed
-- by a separate Bind/Execute batch
select pg_is_in_recovery() \parse ext_ro_stmt2
\g

\bind_named ext_ro_stmt2
\g

-- unnamed statement
select pg_is_in_recovery() \bind
\g

-- read-write batches must be routed to the primary
create temporary table auto_ro_ext_baz(i int);
insert into auto_ro_ext_baz values (1) \parse ext_rw_stmt
\bind_named ext_rw_stmt
\g

-- read-only again after the read-write batch
select pg_is_in_recovery() \parse ext_ro_stmt3
\bind_named ext_ro_stmt3
\g
