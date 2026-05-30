/*
 * Copyright (c) 2026 Dinh Thoai Tran <zinospetrel@sdf.org>
 * All rights reserved.
 *
 * + Source URL: https://github.com/progorker/mytestorcheck/
 *
 * + License: GPL-2.0
 */

drop procedure if exists test_numbers;
delimiter $$
create procedure test_numbers( in p_token varchar(36), in p_suite_code varchar(640) )
sql security invoker
begin
  declare v_suite_id int;
  declare v_case_id int;
  declare v_test_id int;
  declare v_error_message text;
  declare v_int_a int;
  declare v_int_b int;
  declare v_dbl_a int;
  declare v_dbl_b int;

  declare exit handler for sqlexception
  begin
    get diagnostics condition 1 v_error_message = message_text;
    call mytestorproxy.api_testor_suite_case( p_token, v_suite_id, v_case_id, p_suite_code, 'test_numbers' );
    call mytestorproxy.api_testor_error( p_token, v_test_id, v_suite_id, v_case_id, 'exception', v_error_message );
  end;

  call mytestorproxy.api_testor_suite_case( p_token, v_suite_id, v_case_id, p_suite_code, 'test_numbers' );

  set v_int_a = 10;
  set v_int_b = 10;
  call mytestorproxy.api_testor_equals( p_token, v_test_id, v_suite_id, v_case_id, 'int.equals.1', v_int_a, v_int_b );

  set v_int_a = 10;
  set v_int_b = 15;
  call mytestorproxy.api_testor_not_equals( p_token, v_test_id, v_suite_id, v_case_id, 'int.not_equals.1', v_int_a, v_int_b );

  set v_int_a = 18;
  set v_int_b = 12;
  call mytestorproxy.api_testor_greater_than( p_token, v_test_id, v_suite_id, v_case_id, 'int.greater_than.1', v_int_a, v_int_b );

  set v_int_a = 12;
  set v_int_b = 12;
  call mytestorproxy.api_testor_not_greater_than( p_token, v_test_id, v_suite_id, v_case_id, 'int.not_greater_than.1', v_int_a, v_int_b );

  set v_int_a = 8;
  set v_int_b = 12;
  call mytestorproxy.api_testor_not_greater_than( p_token, v_test_id, v_suite_id, v_case_id, 'int.not_greater_than.2', v_int_a, v_int_b );

  set v_int_a = 15;
  set v_int_b = 21;
  call mytestorproxy.api_testor_less_than( p_token, v_test_id, v_suite_id, v_case_id, 'int.less_than.1', v_int_a, v_int_b );

  set v_int_a = 15;
  set v_int_b = 15;
  call mytestorproxy.api_testor_not_less_than( p_token, v_test_id, v_suite_id, v_case_id, 'int.not_less_than.1', v_int_a, v_int_b );

  set v_int_a = 21;
  set v_int_b = 15;
  call mytestorproxy.api_testor_not_less_than( p_token, v_test_id, v_suite_id, v_case_id, 'int.not_less_than.2', v_int_a, v_int_b );

  /* ------------------------------------------------------- */

  set v_dbl_a = 10.25;
  set v_dbl_b = 10.25;
  call mytestorproxy.api_testor_equals( p_token, v_test_id, v_suite_id, v_case_id, 'dbl.equals.1', v_dbl_a, v_dbl_b );

  set v_dbl_a = 10.31;
  set v_dbl_b = 15.22;
  call mytestorproxy.api_testor_not_equals( p_token, v_test_id, v_suite_id, v_case_id, 'dbl.not_equals.1', v_dbl_a, v_dbl_b );

  set v_dbl_a = 18.36;
  set v_dbl_b = 12.72;
  call mytestorproxy.api_testor_greater_than( p_token, v_test_id, v_suite_id, v_case_id, 'dbl.greater_than.1', v_dbl_a, v_dbl_b );

  set v_dbl_a = 12.73;
  set v_dbl_b = 12.73;
  call mytestorproxy.api_testor_not_greater_than( p_token, v_test_id, v_suite_id, v_case_id, 'dbl.not_greater_than.1', v_dbl_a, v_dbl_b );

  set v_dbl_a = 8.11;
  set v_dbl_b = 12.32;
  call mytestorproxy.api_testor_not_greater_than( p_token, v_test_id, v_suite_id, v_case_id, 'dbl.not_greater_than.2', v_dbl_a, v_dbl_b );

  set v_dbl_a = 15.55;
  set v_dbl_b = 21.24;
  call mytestorproxy.api_testor_less_than( p_token, v_test_id, v_suite_id, v_case_id, 'dbl.less_than.1', v_dbl_a, v_dbl_b );

  set v_dbl_a = 15.47;
  set v_dbl_b = 15.47;
  call mytestorproxy.api_testor_not_less_than( p_token, v_test_id, v_suite_id, v_case_id, 'dbl.not_less_than.1', v_dbl_a, v_dbl_b );

  set v_dbl_a = 21.68;
  set v_dbl_b = 15.29;
  call mytestorproxy.api_testor_not_less_than( p_token, v_test_id, v_suite_id, v_case_id, 'dbl.not_less_than.2', v_dbl_a, v_dbl_b );

end;$$
delimiter ;
