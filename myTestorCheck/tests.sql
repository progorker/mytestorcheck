/*
 * Copyright (c) 2026 Dinh Thoai Tran <zinospetrel@sdf.org>
 * All rights reserved.
 *
 * + Source URL: https://github.com/progorker/mytestorcheck/
 *
 * + License: GPL-2.0
 */

source ./tests-config.sql

set @g_token = '_';
set @g_suite_id = -1;

call mytestorproxy.api_testor_login( @g_token, @g_testor_username, @g_testor_password );

call mytestorproxy.api_testor_suite( @g_token, @g_suite_id, @g_suite_code );
call mytestorproxy.api_testor_clean( @g_token, @g_suite_id );

source ./tests-source.sql;

source ./setup.sql
source ./setup-tests.sql


call test_numbers( @g_token, @g_suite_code );
call test_strings( @g_token, @g_suite_code );
call test_others( @g_token, @g_suite_code );
call test_loads( @g_token, @g_suite_code, @g_loads_max_cnt );


call mytestorproxy.api_testor_finish( @g_token, @g_suite_id );
call mytestorproxy.api_testor_source_list( @g_token, @g_suite_id, 1 );
call mytestorproxy.api_testor_failed( @g_token, @g_suite_id, 1 );
call mytestorproxy.api_testor_success( @g_token, @g_suite_id, 1 );
call mytestorproxy.api_testor_result( @g_token, @g_suite_id );
call mytestorproxy.api_testor_logout( @g_token );
