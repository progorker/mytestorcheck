/*
 * Copyright (c) 2026 Dinh Thoai Tran <zinospetrel@sdf.org>
 * All rights reserved.
 *
 * + Source URL: https://github.com/progorker/pgk_mytestorcheck/
 *
 * + License: GPL-2.0
 */

drop procedure if exists test_strings;
delimiter $$
create procedure test_strings( in p_token varchar(36), in p_suite_code varchar(640) )
sql security invoker
begin
  declare v_suite_id int;
  declare v_case_id int;
  declare v_test_id int;
  declare v_error_message text;
  declare v_str_a varchar(8192);
  declare v_str_b varchar(8192);

  declare exit handler for sqlexception
  begin
    get diagnostics condition 1 v_error_message = message_text;
    call mytestorproxy.api_testor_suite_case( p_token, v_suite_id, v_case_id, p_suite_code, 'test_strings' );
    call mytestorproxy.api_testor_error( p_token, v_test_id, v_suite_id, v_case_id, 'exception', v_error_message );
  end;

  call mytestorproxy.api_testor_suite_case( p_token, v_suite_id, v_case_id, p_suite_code, 'test_strings' );

  set v_str_a = 'Hello world!';
  set v_str_b = 'Hello world!';
  call mytestorproxy.api_testor_same( p_token, v_test_id, v_suite_id, v_case_id, 'str.same.1', v_str_a, v_str_b );

  set v_str_a = 'Hello world!';
  set v_str_b = 'hello World!';
  call mytestorproxy.api_testor_same( p_token, v_test_id, v_suite_id, v_case_id, 'str.same.2', v_str_a, v_str_b );

  set v_str_a = 'Hello world!';
  set v_str_b = 'Hello world! I am here.';
  call mytestorproxy.api_testor_not_same( p_token, v_test_id, v_suite_id, v_case_id, 'str.not_same.2', v_str_a, v_str_b );

  set v_str_a = 'Hello world!';
  set v_str_b = 'world';
  call mytestorproxy.api_testor_contains( p_token, v_test_id, v_suite_id, v_case_id, 'str.contains.1', v_str_a, v_str_b );

  set v_str_a = 'Hello world!';
  set v_str_b = 'woNrld';
  call mytestorproxy.api_testor_not_contains( p_token, v_test_id, v_suite_id, v_case_id, 'str.not_contains.1', v_str_a, v_str_b );

  set v_str_a = '{\"n\": 2}';
  set v_str_b = '{\"n\": 2}';
  call mytestorproxy.api_testor_same( p_token, v_test_id, v_suite_id, v_case_id, 'str.same.3', v_str_a, v_str_b );
end;$$
delimiter ;
