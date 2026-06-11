/*
 * Copyright (c) 2026 Dinh Thoai Tran <zinospetrel@sdf.org>
 * All rights reserved.
 *
 * + Source URL: https://github.com/progorker/pgk_mytestorcheck/
 *
 * + License: GPL-2.0
 */

drop procedure if exists test_others;
delimiter $$
create procedure test_others( in p_token varchar(36), in p_suite_code varchar(640) )
sql security invoker
begin
  declare v_suite_id int;
  declare v_case_id int;
  declare v_test_id int;
  declare v_error_message text;
  declare v_int_a int;
  declare v_int_b int;

  declare exit handler for sqlexception
  begin
    get diagnostics condition 1 v_error_message = message_text;
    call mytestorproxy.api_testor_suite_case( p_token, v_suite_id, v_case_id, p_suite_code, 'test_others' );
    call mytestorproxy.api_testor_error( p_token, v_test_id, v_suite_id, v_case_id, 'exception', v_error_message );
  end;

  call mytestorproxy.api_testor_suite_case( p_token, v_suite_id, v_case_id, p_suite_code, 'test_others' );

  set v_int_a = 10;
  set v_int_b = 10;
  call mytestorproxy.api_testor_true( p_token, v_test_id, v_suite_id, v_case_id, 'int.equals.1', v_int_a = v_int_b );
  call mytestorproxy.api_testor_not_true( p_token, v_test_id, v_suite_id, v_case_id, 'int.not_equals.1', v_int_a <> v_int_b );
  call mytestorproxy.api_testor_test( p_token, v_test_id, v_suite_id, v_case_id, 'int.equals.2', v_int_a = v_int_b, '[int.equals.2] test is success' );

end;$$
delimiter ;
