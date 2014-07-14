/***
  This file is part of systemd.

  systemd is free software; you can redistribute it and/or modify it
  under the terms of the GNU Lesser General Public License as published by
  the Free Software Foundation; either version 2.1 of the License, or
  (at your option) any later version.
***/

LIBSYSTEMD_209 {
global:
        /* sd-journal */
        sd_journal_print;
        sd_journal_printv;
        sd_journal_send;
        sd_journal_sendv;
        sd_journal_stream_fd;
        sd_journal_open;
        sd_journal_close;
        sd_journal_previous;
        sd_journal_next;
        sd_journal_previous_skip;
        sd_journal_next_skip;
        sd_journal_get_realtime_usec;
        sd_journal_get_monotonic_usec;
        sd_journal_get_data;
        sd_journal_enumerate_data;
        sd_journal_restart_data;
        sd_journal_add_match;
        sd_journal_flush_matches;
        sd_journal_seek_head;
        sd_journal_seek_tail;
        sd_journal_seek_monotonic_usec;
        sd_journal_seek_realtime_usec;
        sd_journal_seek_cursor;
        sd_journal_get_cursor;
        sd_journal_get_fd;
        sd_journal_process;
        sd_journal_print_with_location;
        sd_journal_printv_with_location;
        sd_journal_send_with_location;
        sd_journal_sendv_with_location;
        sd_journal_get_cutoff_realtime_usec;
        sd_journal_get_cutoff_monotonic_usec;
        sd_journal_wait;
        sd_journal_open_directory;
        sd_journal_add_disjunction;
        sd_journal_perror;
        sd_journal_perror_with_location;
        sd_journal_get_usage;
        sd_journal_test_cursor;
        sd_journal_query_unique;
        sd_journal_enumerate_unique;
        sd_journal_restart_unique;
        sd_journal_get_catalog;
        sd_journal_get_catalog_for_message_id;
        sd_journal_set_data_threshold;
        sd_journal_get_data_threshold;
        sd_journal_reliable_fd;
        sd_journal_get_events;
        sd_journal_get_timeout;
        sd_journal_add_conjunction;
        sd_journal_open_files;
        sd_journal_open_container;

        /* sd-dameon */
        sd_booted;
        sd_is_fifo;
        sd_is_mq;
        sd_is_socket;
        sd_is_socket_inet;
        sd_is_socket_unix;
        sd_is_special;
        sd_listen_fds;
        sd_notify;
        sd_notifyf;
        sd_watchdog_enabled;

        /* sd-id128 */
        sd_id128_to_string;
        sd_id128_from_string;
        sd_id128_randomize;
        sd_id128_get_machine;
        sd_id128_get_boot;

        /* sd-login */
        sd_get_seats;
        sd_get_sessions;
        sd_get_uids;
        sd_login_monitor_flush;
        sd_login_monitor_get_fd;
        sd_login_monitor_new;
        sd_login_monitor_unref;
        sd_pid_get_owner_uid;
        sd_pid_get_session;
        sd_seat_can_multi_session;
        sd_seat_get_active;
        sd_seat_get_sessions;
        sd_session_get_seat;
        sd_session_get_uid;
        sd_session_is_active;
        sd_uid_get_seats;
        sd_uid_get_sessions;
        sd_uid_get_state;
        sd_uid_is_on_seat;
        sd_pid_get_unit;
        sd_session_get_service;
        sd_session_get_type;
        sd_session_get_class;
        sd_session_get_display;
        sd_session_get_state;
        sd_seat_can_tty;
        sd_seat_can_graphical;
        sd_session_get_tty;
        sd_login_monitor_get_events;
        sd_login_monitor_get_timeout;
        sd_pid_get_user_unit;
        sd_pid_get_machine_name;
        sd_get_machine_names;
        sd_pid_get_slice;
        sd_session_get_vt;
        sd_session_is_remote;
        sd_session_get_remote_user;
        sd_session_get_remote_host;
local:
       *;
};

LIBSYSTEMD_211 {
global:
        sd_machine_get_class;
        sd_peer_get_session;
        sd_peer_get_owner_uid;
        sd_peer_get_unit;
        sd_peer_get_user_unit;
        sd_peer_get_machine_name;
        sd_peer_get_slice;
} LIBSYSTEMD_209;

LIBSYSTEMD_213 {
global:
        sd_uid_get_display;
} LIBSYSTEMD_211;

LIBSYSTEMD_214 {
global:
        sd_pid_notify;
        sd_pid_notifyf;
} LIBSYSTEMD_213;

LIBSYSTEMD_216 {
global:
        sd_machine_get_ifindexes;
} LIBSYSTEMD_214;

m4_ifdef(`ENABLE_KDBUS',
LIBSYSTEMD_FUTURE {
global:
        /* sd-bus */
        sd_bus_default;
        sd_bus_default_user;
        sd_bus_default_system;
        sd_bus_open;
        sd_bus_open_user;
        sd_bus_open_system;
        sd_bus_open_system_remote;
        sd_bus_open_system_container;
        sd_bus_new;
        sd_bus_set_address;
        sd_bus_set_fd;
        sd_bus_set_exec;
        sd_bus_set_bus_client;
        sd_bus_set_server;
        sd_bus_set_anonymous;
        sd_bus_set_trusted;
        sd_bus_set_monitor;
        sd_bus_set_name;
        sd_bus_negotiate_fds;
        sd_bus_negotiate_timestamp;
        sd_bus_negotiate_creds;
        sd_bus_start;
        sd_bus_close;
        sd_bus_try_close;
        sd_bus_ref;
        sd_bus_unref;
        sd_bus_is_open;
        sd_bus_can_send;
        sd_bus_get_server_id;
        sd_bus_get_peer_creds;
        sd_bus_get_name;
        sd_bus_send;
        sd_bus_send_to;
        sd_bus_call;
        sd_bus_call_async;
        sd_bus_get_fd;
        sd_bus_get_events;
        sd_bus_get_timeout;
        sd_bus_process;
        sd_bus_process_priority;
        sd_bus_wait;
        sd_bus_flush;
        sd_bus_get_current_message;
        sd_bus_get_current_slot;
        sd_bus_get_tid;
        sd_bus_attach_event;
        sd_bus_detach_event;
        sd_bus_get_event;
        sd_bus_add_filter;
        sd_bus_add_match;
        sd_bus_add_object;
        sd_bus_add_fallback;
        sd_bus_add_object_vtable;
        sd_bus_add_fallback_vtable;
        sd_bus_add_node_enumerator;
        sd_bus_add_object_manager;
        sd_bus_slot_ref;
        sd_bus_slot_unref;
        sd_bus_slot_get_bus;
        sd_bus_slot_get_userdata;
        sd_bus_slot_set_userdata;
        sd_bus_slot_get_current_message;
        sd_bus_message_new_signal;
        sd_bus_message_new_method_call;
        sd_bus_message_new_method_return;
        sd_bus_message_new_method_error;
        sd_bus_message_new_method_errorf;
        sd_bus_message_new_method_errno;
        sd_bus_message_new_method_errnof;
        sd_bus_message_ref;
        sd_bus_message_unref;
        sd_bus_message_get_bus;
        sd_bus_message_get_type;
        sd_bus_message_get_cookie;
        sd_bus_message_get_reply_cookie;
        sd_bus_message_get_expect_reply;
        sd_bus_message_get_auto_start;
        sd_bus_message_get_priority;
        sd_bus_message_get_signature;
        sd_bus_message_get_path;
        sd_bus_message_get_interface;
        sd_bus_message_get_member;
        sd_bus_message_get_destination;
        sd_bus_message_get_sender;
        sd_bus_message_get_error;
        sd_bus_message_get_errno;
        sd_bus_message_get_monotonic_usec;
        sd_bus_message_get_realtime_usec;
        sd_bus_message_get_seqnum;
        sd_bus_message_get_creds;
        sd_bus_message_is_signal;
        sd_bus_message_is_method_call;
        sd_bus_message_is_method_error;
        sd_bus_message_set_expect_reply;
        sd_bus_message_set_auto_start;
        sd_bus_message_set_destination;
        sd_bus_message_set_priority;
        sd_bus_message_append;
        sd_bus_message_append_basic;
        sd_bus_message_append_array;
        sd_bus_message_append_array_space;
        sd_bus_message_append_array_iovec;
        sd_bus_message_append_array_memfd;
        sd_bus_message_append_string_space;
        sd_bus_message_append_string_iovec;
        sd_bus_message_append_string_memfd;
        sd_bus_message_append_strv;
        sd_bus_message_open_container;
        sd_bus_message_close_container;
        sd_bus_message_copy;
        sd_bus_message_read;
        sd_bus_message_read_basic;
        sd_bus_message_read_array;
        sd_bus_message_read_strv;
        sd_bus_message_skip;
        sd_bus_message_enter_container;
        sd_bus_message_exit_container;
        sd_bus_message_peek_type;
        sd_bus_message_verify_type;
        sd_bus_message_at_end;
        sd_bus_message_rewind;
        sd_bus_get_unique_name;
        sd_bus_request_name;
        sd_bus_release_name;
        sd_bus_list_names;
        sd_bus_get_owner;
        sd_bus_get_owner_machine_id;
        sd_bus_call_method;
        sd_bus_get_property;
        sd_bus_get_property_trivial;
        sd_bus_get_property_string;
        sd_bus_get_property_strv;
        sd_bus_set_property;
        sd_bus_reply_method_return;
        sd_bus_reply_method_error;
        sd_bus_reply_method_errorf;
        sd_bus_reply_method_errno;
        sd_bus_reply_method_errnof;
        sd_bus_emit_signal;
        sd_bus_emit_properties_changed_strv;
        sd_bus_emit_properties_changed;
        sd_bus_emit_interfaces_added_strv;
        sd_bus_emit_interfaces_added;
        sd_bus_emit_interfaces_removed_strv;
        sd_bus_emit_interfaces_removed;
        sd_bus_query_sender_creds;
        sd_bus_creds_new_from_pid;
        sd_bus_creds_ref;
        sd_bus_creds_unref;
        sd_bus_creds_get_mask;
        sd_bus_creds_get_uid;
        sd_bus_creds_get_gid;
        sd_bus_creds_get_pid;
        sd_bus_creds_get_pid_starttime;
        sd_bus_creds_get_tid;
        sd_bus_creds_get_comm;
        sd_bus_creds_get_tid_comm;
        sd_bus_creds_get_exe;
        sd_bus_creds_get_cmdline;
        sd_bus_creds_get_cgroup;
        sd_bus_creds_get_unit;
        sd_bus_creds_get_user_unit;
        sd_bus_creds_get_slice;
        sd_bus_creds_get_session;
        sd_bus_creds_get_owner_uid;
        sd_bus_creds_has_effective_cap;
        sd_bus_creds_has_permitted_cap;
        sd_bus_creds_has_inheritable_cap;
        sd_bus_creds_has_bounding_cap;
        sd_bus_creds_get_selinux_context;
        sd_bus_creds_get_audit_session_id;
        sd_bus_creds_get_audit_login_uid;
        sd_bus_creds_get_unique_name;
        sd_bus_creds_get_well_known_names;
        sd_bus_creds_get_connection_name;
        sd_bus_error_free;
        sd_bus_error_set;
        sd_bus_error_setf;
        sd_bus_error_set_const;
        sd_bus_error_set_errno;
        sd_bus_error_set_errnof;
        sd_bus_error_get_errno;
        sd_bus_error_copy;
        sd_bus_error_is_set;
        sd_bus_error_has_name;
        sd_bus_path_encode;
        sd_bus_path_decode;
        sd_bus_track_new;
        sd_bus_track_ref;
        sd_bus_track_unref;
        sd_bus_track_get_bus;
        sd_bus_track_get_userdata;
        sd_bus_track_set_userdata;
        sd_bus_track_add_sender;
        sd_bus_track_remove_sender;
        sd_bus_track_add_name;
        sd_bus_track_remove_name;
        sd_bus_track_count;
        sd_bus_track_contains;
        sd_bus_track_first;
        sd_bus_track_next;

        /* sd-memfd */
        sd_memfd_new;
        sd_memfd_new_and_map;
        sd_memfd_free;
        sd_memfd_get_fd;
        sd_memfd_get_file;
        sd_memfd_dup_fd;
        sd_memfd_map;
        sd_memfd_set_sealed;
        sd_memfd_get_sealed;
        sd_memfd_get_size;
        sd_memfd_set_size;
        sd_memfd_get_name;

        /* sd-event */
        sd_event_default;
        sd_event_new;
        sd_event_ref;
        sd_event_unref;
        sd_event_add_io;
        sd_event_add_time;
        sd_event_add_signal;
        sd_event_add_child;
        sd_event_add_defer;
        sd_event_add_exit;
        sd_event_run;
        sd_event_loop;
        sd_event_exit;
        sd_event_now;
        sd_event_get_state;
        sd_event_get_tid;
        sd_event_get_exit_code;
        sd_event_set_watchdog;
        sd_event_get_watchdog;
        sd_event_source_ref;
        sd_event_source_unref;
        sd_event_source_set_prepare;
        sd_event_source_get_pending;
        sd_event_source_get_priority;
        sd_event_source_set_priority;
        sd_event_source_get_enabled;
        sd_event_source_set_enabled;
        sd_event_source_get_userdata;
        sd_event_source_set_userdata;
        sd_event_source_get_io_fd;
        sd_event_source_set_io_fd;
        sd_event_source_get_io_events;
        sd_event_source_set_io_events;
        sd_event_source_get_io_revents;
        sd_event_source_get_time;
        sd_event_source_set_time;
        sd_event_source_set_time_accuracy;
        sd_event_source_get_time_accuracy;
        sd_event_source_get_time_clock;
        sd_event_source_get_signal;
        sd_event_source_get_child_pid;
        sd_event_source_get_event;

        /* sd-utf8 */
        sd_utf8_is_valid;
        sd_ascii_is_valid;

        /* sd-resolve */
        sd_resolve_default;
        sd_resolve_new;
        sd_resolve_ref;
        sd_resolve_unref;
        sd_resolve_get_fd;
        sd_resolve_get_events;
        sd_resolve_get_timeout;
        sd_resolve_process;
        sd_resolve_wait;
        sd_resolve_get_tid;
        sd_resolve_attach_event;
        sd_resolve_detach_event;
        sd_resolve_get_event;
        sd_resolve_getaddrinfo;
        sd_resolve_getnameinfo;
        sd_resolve_res_query;
        sd_resolve_res_search;
        sd_resolve_query_ref;
        sd_resolve_query_unref;
        sd_resolve_query_is_done;
        sd_resolve_query_get_userdata;
        sd_resolve_query_set_userdata;
        sd_resolve_query_get_resolve;

        /* sd-path */
        sd_path_home;
        sd_path_search;
} LIBSYSTEMD_216;
)
