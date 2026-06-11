/*
 * Copyright (c) 2026 Dinh Thoai Tran <zinospetrel@sdf.org>
 * All rights reserved.
 *
 * + Source URL: https://github.com/progorker/pgk_mytestorcheck/
 *
 * + License: GPL-2.0
 */

drop procedure if exists test_cells;
delimiter $$
create procedure test_cells( in p_token varchar(36), in p_suite_code varchar(640), in p_tested_db varchar(640) )
sql security invoker
begin
  declare v_suite_id int;
  declare v_case_id int;
  declare v_test_id int;
  declare v_error_message text;
  declare v_str_a varchar(8192);
  declare v_str_b varchar(8192);
  declare v_num_a double;
  declare v_num_b double;
  declare v_table varchar(256);
  declare v_field varchar(256);
  declare v_where varchar(256);
  declare v_order varchar(256);
  declare v_limit varchar(256);
  declare v_idx bigint;
  declare v_sql longtext;

  declare exit handler for sqlexception
  begin
    get diagnostics condition 1 v_error_message = message_text;
    call mytestorproxy.api_testor_suite_case( p_token, v_suite_id, v_case_id, p_suite_code, 'test_cells' );
    call mytestorproxy.api_testor_error( p_token, v_test_id, v_suite_id, v_case_id, 'exception', v_error_message );
  end;

  call mytestorproxy.api_testor_suite_case( p_token, v_suite_id, v_case_id, p_suite_code, 'test_cells' );

  set v_sql = concat( 'drop temporary table if exists `', trim(p_tested_db), '`.`temp_vars`;' );
  set @v_sql_testor_test_cells = v_sql;
  prepare stmt_testor_test_cells from @v_sql_testor_test_cells;
  execute stmt_testor_test_cells;
  deallocate prepare stmt_testor_test_cells;

  set v_sql = concat( 'create temporary table `', trim(p_tested_db), '`.`temp_vars` (`id` bigint not null auto_increment primary key, `str_val` varchar(8192) not null default '''', `num_val` double not null default 0);' );
  set @v_sql_testor_test_cells = v_sql;
  prepare stmt_testor_test_cells from @v_sql_testor_test_cells;
  execute stmt_testor_test_cells;
  deallocate prepare stmt_testor_test_cells;

  set v_idx = -1;

  set v_table = concat( '`', trim(p_tested_db), '`.`temp_vars`' );
  set v_field = '`str_val`';
  set v_where = '';
  set v_order = 'order by `id` asc';

  set v_idx = v_idx + 1;
  set v_str_a = 'Hello world!';
  set v_str_b = 'Hello world!';
  set v_limit = concat( 'limit ', v_idx, ', 1' );
  set v_sql = concat( 'insert into `', trim(p_tested_db), '`.`temp_vars` ( `str_val` ) values ( mytestorproxy.api_testor_unescape(''', mytestorproxy.api_testor_escape( v_str_a ), ''') );' );
  set @v_sql_testor_test_cells = v_sql;
  prepare stmt_testor_test_cells from @v_sql_testor_test_cells;
  execute stmt_testor_test_cells;
  deallocate prepare stmt_testor_test_cells;
  call mytestorproxy.api_testor_cell_same( p_token, v_test_id, v_suite_id, v_case_id, 'str.same.1', v_table, v_field, v_where, v_order, v_limit, v_str_b );

  set v_idx = v_idx + 1;
  set v_str_a = 'Hello world!';
  set v_str_b = 'Hello community!';
  set v_limit = concat( 'limit ', v_idx, ', 1' );
  set v_sql = concat( 'insert into `', trim(p_tested_db), '`.`temp_vars` ( `str_val` ) values ( mytestorproxy.api_testor_unescape(''', mytestorproxy.api_testor_escape( v_str_a ), ''') );' );
  set @v_sql_testor_test_cells = v_sql;
  prepare stmt_testor_test_cells from @v_sql_testor_test_cells;
  execute stmt_testor_test_cells;
  deallocate prepare stmt_testor_test_cells;
  call mytestorproxy.api_testor_cell_not_same( p_token, v_test_id, v_suite_id, v_case_id, 'str.not_same.1', v_table, v_field, v_where, v_order, v_limit, v_str_b );

  set v_idx = v_idx + 1;
  set v_str_a = 'Hello world! Welcome to our community!';
  set v_str_b = 'Welcome';
  set v_limit = concat( 'limit ', v_idx, ', 1' );
  set v_sql = concat( 'insert into `', trim(p_tested_db), '`.`temp_vars` ( `str_val` ) values ( mytestorproxy.api_testor_unescape(''', mytestorproxy.api_testor_escape( v_str_a ), ''') );' );
  set @v_sql_testor_test_cells = v_sql;
  prepare stmt_testor_test_cells from @v_sql_testor_test_cells;
  execute stmt_testor_test_cells;
  deallocate prepare stmt_testor_test_cells;
  call mytestorproxy.api_testor_cell_contains( p_token, v_test_id, v_suite_id, v_case_id, 'str.contains.1', v_table, v_field, v_where, v_order, v_limit, v_str_b );

  set v_idx = v_idx + 1;
  set v_str_a = 'Hello world! Welcome to our community!';
  set v_str_b = 'Greeting';
  set v_limit = concat( 'limit ', v_idx, ', 1' );
  set v_sql = concat( 'insert into `', trim(p_tested_db), '`.`temp_vars` ( `str_val` ) values ( mytestorproxy.api_testor_unescape(''', mytestorproxy.api_testor_escape( v_str_a ), ''') );' );
  set @v_sql_testor_test_cells = v_sql;
  prepare stmt_testor_test_cells from @v_sql_testor_test_cells;
  execute stmt_testor_test_cells;
  deallocate prepare stmt_testor_test_cells;
  call mytestorproxy.api_testor_cell_not_contains( p_token, v_test_id, v_suite_id, v_case_id, 'str.not_contains.1', v_table, v_field, v_where, v_order, v_limit, v_str_b );

  -- ---------- --

  set v_table = concat( '`', trim(p_tested_db), '`.`temp_vars`' );
  set v_field = '`num_val`';
  set v_where = '';
  set v_order = 'order by `id` asc';

  set v_idx = v_idx + 1;
  set v_num_a = 20.5;
  set v_num_b = 20.5;
  set v_limit = concat( 'limit ', v_idx, ', 1' );
  set v_sql = concat( 'insert into `', trim(p_tested_db), '`.`temp_vars` ( `num_val` ) values ( ', v_num_a, ' );' );
  set @v_sql_testor_test_cells = v_sql;
  prepare stmt_testor_test_cells from @v_sql_testor_test_cells;
  execute stmt_testor_test_cells;
  deallocate prepare stmt_testor_test_cells;
  call mytestorproxy.api_testor_cell_equals( p_token, v_test_id, v_suite_id, v_case_id, 'num.equals.1', v_table, v_field, v_where, v_order, v_limit, v_num_b );

  set v_idx = v_idx + 1;
  set v_num_a = 20.5;
  set v_num_b = 21.5;
  set v_limit = concat( 'limit ', v_idx, ', 1' );
  set v_sql = concat( 'insert into `', trim(p_tested_db), '`.`temp_vars` ( `num_val` ) values ( ', v_num_a, ' );' );
  set @v_sql_testor_test_cells = v_sql;
  prepare stmt_testor_test_cells from @v_sql_testor_test_cells;
  execute stmt_testor_test_cells;
  deallocate prepare stmt_testor_test_cells;
  call mytestorproxy.api_testor_cell_not_equals( p_token, v_test_id, v_suite_id, v_case_id, 'num.not_equals.1', v_table, v_field, v_where, v_order, v_limit, v_num_b );

  set v_idx = v_idx + 1;
  set v_num_a = 25.8;
  set v_num_b = 20.5;
  set v_limit = concat( 'limit ', v_idx, ', 1' );
  set v_sql = concat( 'insert into `', trim(p_tested_db), '`.`temp_vars` ( `num_val` ) values ( ', v_num_a, ' );' );
  set @v_sql_testor_test_cells = v_sql;
  prepare stmt_testor_test_cells from @v_sql_testor_test_cells;
  execute stmt_testor_test_cells;
  deallocate prepare stmt_testor_test_cells;
  call mytestorproxy.api_testor_cell_greater_than( p_token, v_test_id, v_suite_id, v_case_id, 'num.greater_than.1', v_table, v_field, v_where, v_order, v_limit, v_num_b );

  set v_idx = v_idx + 1;
  set v_num_a = 25.8;
  set v_num_b = 30.5;
  set v_limit = concat( 'limit ', v_idx, ', 1' );
  set v_sql = concat( 'insert into `', trim(p_tested_db), '`.`temp_vars` ( `num_val` ) values ( ', v_num_a, ' );' );
  set @v_sql_testor_test_cells = v_sql;
  prepare stmt_testor_test_cells from @v_sql_testor_test_cells;
  execute stmt_testor_test_cells;
  deallocate prepare stmt_testor_test_cells;
  call mytestorproxy.api_testor_cell_not_greater_than( p_token, v_test_id, v_suite_id, v_case_id, 'num.not_greater_than.1', v_table, v_field, v_where, v_order, v_limit, v_num_b );

  set v_idx = v_idx + 1;
  set v_num_a = 25.8;
  set v_num_b = 30.5;
  set v_limit = concat( 'limit ', v_idx, ', 1' );
  set v_sql = concat( 'insert into `', trim(p_tested_db), '`.`temp_vars` ( `num_val` ) values ( ', v_num_a, ' );' );
  set @v_sql_testor_test_cells = v_sql;
  prepare stmt_testor_test_cells from @v_sql_testor_test_cells;
  execute stmt_testor_test_cells;
  deallocate prepare stmt_testor_test_cells;
  call mytestorproxy.api_testor_cell_less_than( p_token, v_test_id, v_suite_id, v_case_id, 'num.less_than.1', v_table, v_field, v_where, v_order, v_limit, v_num_b );

  set v_idx = v_idx + 1;
  set v_num_a = 25.8;
  set v_num_b = 20.5;
  set v_limit = concat( 'limit ', v_idx, ', 1' );
  set v_sql = concat( 'insert into `', trim(p_tested_db), '`.`temp_vars` ( `num_val` ) values ( ', v_num_a, ' );' );
  set @v_sql_testor_test_cells = v_sql;
  prepare stmt_testor_test_cells from @v_sql_testor_test_cells;
  execute stmt_testor_test_cells;
  deallocate prepare stmt_testor_test_cells;
  call mytestorproxy.api_testor_cell_not_less_than( p_token, v_test_id, v_suite_id, v_case_id, 'num.not_less_than.1', v_table, v_field, v_where, v_order, v_limit, v_num_b );

  set v_sql = concat( 'drop temporary table if exists `', trim(p_tested_db), '`.`temp_vars`;' );
  set @v_sql_testor_test_cells = v_sql;
  prepare stmt_testor_test_cells from @v_sql_testor_test_cells;
  execute stmt_testor_test_cells;
  deallocate prepare stmt_testor_test_cells;
end;$$
delimiter ;
