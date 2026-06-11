/*
 * Copyright (c) 2026 Dinh Thoai Tran <zinospetrel@sdf.org>
 * All rights reserved.
 *
 * + Source URL: https://github.com/progorker/pgk_mytestorcheck/
 *
 * + License: GPL-2.0
 */

drop procedure if exists test_loads;
delimiter $$
create procedure test_loads( in p_token varchar(36), in p_suite_code varchar(640), in p_max_cnt bigint )
sql security invoker
begin
  declare v_suite_id int;
  declare v_case_id int;
  declare v_test_id int;
  declare v_error_message text;
  declare v_int_a int;
  declare v_int_b int;
  declare v_cnt bigint default 0;
  declare v_no bigint default 1;

  declare exit handler for sqlexception
  begin
    get diagnostics condition 1 v_error_message = message_text;
    call mytestorproxy.api_testor_suite_case( p_token, v_suite_id, v_case_id, p_suite_code, 'test_loads' );
    call mytestorproxy.api_testor_error( p_token, v_test_id, v_suite_id, v_case_id, 'exception', v_error_message );
  end;

  call mytestorproxy.api_testor_suite_case( p_token, v_suite_id, v_case_id, p_suite_code, 'test_loads' );

  while v_cnt < p_max_cnt do
    set v_no = v_no + 1;
    set v_int_a = 10;
    set v_int_b = 10;
    call mytestorproxy.api_testor_equals( p_token, v_test_id, v_suite_id, v_case_id, concat('load.equals.', v_no), v_int_a, v_int_b );

    set v_no = v_no + 1;
    set v_int_a = 10;
    set v_int_b = 15;
    call mytestorproxy.api_testor_not_equals( p_token, v_test_id, v_suite_id, v_case_id, concat('load.not_equals.', v_no), v_int_a, v_int_b );

    set v_no = v_no + 1;
    set v_int_a = 18;
    set v_int_b = 12;
    call mytestorproxy.api_testor_greater_than( p_token, v_test_id, v_suite_id, v_case_id, concat('load.greater_than.', v_no), v_int_a, v_int_b );

    set v_no = v_no + 1;
    set v_int_a = 12;
    set v_int_b = 12;
    call mytestorproxy.api_testor_not_greater_than( p_token, v_test_id, v_suite_id, v_case_id, concat('load.not_greater_than.', v_no), v_int_a, v_int_b );

    set v_no = v_no + 1;
    set v_int_a = 8;
    set v_int_b = 12;
    call mytestorproxy.api_testor_not_greater_than( p_token, v_test_id, v_suite_id, v_case_id, concat('load.not_greater_than.', v_no), v_int_a, v_int_b );

    set v_no = v_no + 1;
    set v_int_a = 15;
    set v_int_b = 21;
    call mytestorproxy.api_testor_less_than( p_token, v_test_id, v_suite_id, v_case_id, concat('load.less_than.', v_no), v_int_a, v_int_b );

    set v_no = v_no + 1;
    set v_int_a = 15;
    set v_int_b = 15;
    call mytestorproxy.api_testor_not_less_than( p_token, v_test_id, v_suite_id, v_case_id, concat('load.not_less_than.', v_no), v_int_a, v_int_b );

    set v_no = v_no + 1;
    set v_int_a = 21;
    set v_int_b = 15;
    call mytestorproxy.api_testor_not_less_than( p_token, v_test_id, v_suite_id, v_case_id, concat('load.not_less_than.', v_no), v_int_a, v_int_b );

    set v_cnt = v_cnt + 1;
  end while;
end;$$
delimiter ;
