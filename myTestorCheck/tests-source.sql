/*
 * Copyright (c) 2026 Dinh Thoai Tran <zinospetrel@sdf.org>
 * All rights reserved.
 *
 * + Source URL: https://github.com/progorker/pgk_mytestorcheck/
 *
 * + License: GPL-2.0
 */

call mytestorproxy.api_testor_version( @g_token, @g_suite_id, @g_last_version );
call mytestorproxy.api_testor_option( @g_token, @g_suite_id, @g_src_dir, 'src_dir', false );

set @v_name = 'pkg_setup-api';
set @v_data = '/setup-api.sql';
call mytestorproxy.api_testor_option( @g_token, @g_suite_id, @v_data, concat('src:', @v_name), false );

set @v_name = 'pkg_setup-functions';
set @v_data = '/setup-functions.sql';
call mytestorproxy.api_testor_option( @g_token, @g_suite_id, @v_data, concat('src:', @v_name), false );

set @v_name = 'pkg_setup-procedures';
set @v_data = '/setup-procedures.sql';
call mytestorproxy.api_testor_option( @g_token, @g_suite_id, @v_data, concat('src:', @v_name), false );

set @v_name = 'pkg_setup-tables';
set @v_data = '/setup-tables.sql';
call mytestorproxy.api_testor_option( @g_token, @g_suite_id, @v_data, concat('src:', @v_name), false );

set @v_name = 'pkg_setup-tests';
set @v_data = '/setup-tests.sql';
call mytestorproxy.api_testor_option( @g_token, @g_suite_id, @v_data, concat('src:', @v_name), false );

set @v_name = 'pkg_setup';
set @v_data = '/setup.sql';
call mytestorproxy.api_testor_option( @g_token, @g_suite_id, @v_data, concat('src:', @v_name), false );

set @v_name = 'pkg_tests';
set @v_data = '/tests.sql';
call mytestorproxy.api_testor_option( @g_token, @g_suite_id, @v_data, concat('src:', @v_name), false );

set @v_name = 'pkg_tests-config';
set @v_data = '/tests-config.sql';
call mytestorproxy.api_testor_option( @g_token, @g_suite_id, @v_data, concat('src:', @v_name), false );

set @v_name = 'pkg_tests-source';
set @v_data = '/tests-source.sql';
call mytestorproxy.api_testor_option( @g_token, @g_suite_id, @v_data, concat('src:', @v_name), false );


set @v_name = 'test_numbers';
set @v_data = '/tst/procedure_test_numbers.sql';
call mytestorproxy.api_testor_option( @g_token, @g_suite_id, @v_data, concat('src:', @v_name), false );

set @v_name = 'test_strings';
set @v_data = '/tst/procedure_test_strings.sql';
call mytestorproxy.api_testor_option( @g_token, @g_suite_id, @v_data, concat('src:', @v_name), false );

set @v_name = 'test_others';
set @v_data = '/tst/procedure_test_others.sql';
call mytestorproxy.api_testor_option( @g_token, @g_suite_id, @v_data, concat('src:', @v_name), false );

set @v_name = 'test_loads';
set @v_data = '/tst/procedure_test_loads.sql';
call mytestorproxy.api_testor_option( @g_token, @g_suite_id, @v_data, concat('src:', @v_name), false );

set @v_name = 'test_cells';
set @v_data = '/tst/procedure_test_cells.sql';
call mytestorproxy.api_testor_option( @g_token, @g_suite_id, @v_data, concat('src:', @v_name), false );

