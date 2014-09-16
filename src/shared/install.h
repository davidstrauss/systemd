/*-*- Mode: C; c-basic-offset: 8; indent-tabs-mode: nil -*-*/

#pragma once

/***
  This file is part of systemd.

  Copyright 2011 Lennart Poettering

  systemd is free software; you can redistribute it and/or modify it
  under the terms of the GNU Lesser General Public License as published by
  the Free Software Foundation; either version 2.1 of the License, or
  (at your option) any later version.

  systemd is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public License
  along with systemd; If not, see <http://www.gnu.org/licenses/>.
***/

#include "hashmap.h"

typedef enum UnitFileScope {
        UNIT_FILE_SYSTEM,
        UNIT_FILE_GLOBAL,
        UNIT_FILE_USER,
        _UNIT_FILE_SCOPE_MAX,
        _UNIT_FILE_SCOPE_INVALID = -1
} UnitFileScope;

typedef enum UnitFileState {
        UNIT_FILE_ENABLED,
        UNIT_FILE_ENABLED_RUNTIME,
        UNIT_FILE_LINKED,
        UNIT_FILE_LINKED_RUNTIME,
        UNIT_FILE_MASKED,
        UNIT_FILE_MASKED_RUNTIME,
        UNIT_FILE_STATIC,
        UNIT_FILE_DISABLED,
        UNIT_FILE_INVALID,
        _UNIT_FILE_STATE_MAX,
        _UNIT_FILE_STATE_INVALID = -1
} UnitFileState;

typedef enum UnitFilePresetMode {
        UNIT_FILE_PRESET_FULL,
        UNIT_FILE_PRESET_ENABLE_ONLY,
        UNIT_FILE_PRESET_DISABLE_ONLY,
        _UNIT_FILE_PRESET_MAX,
        _UNIT_FILE_PRESET_INVALID = -1
} UnitFilePresetMode;

typedef enum UnitFileChangeType {
        UNIT_FILE_SYMLINK,
        UNIT_FILE_UNLINK,
        _UNIT_FILE_CHANGE_TYPE_MAX,
        _UNIT_FILE_CHANGE_TYPE_INVALID = -1
} UnitFileChangeType;

typedef struct UnitFileChange {
        UnitFileChangeType type;
        char *path;
        char *source;
} UnitFileChange;

typedef struct UnitFileList {
        char *path;
        UnitFileState state;
} UnitFileList;

typedef struct {
        char *name;
        char *path;
        char *user;

        char **aliases;
        char **wanted_by;
        char **required_by;

        char *default_instance;
} InstallInfo;

typedef struct {
        Hashmap* config_paths_forward; /* config_path string => symlink name/path => unit_name path */
        Hashmap* config_paths_reverse; /* config_path string => unit_name/path string => symlink path */
} EnabledContext;

int unit_file_enable(UnitFileScope scope, bool runtime, const char *root_dir, char **files, bool force, UnitFileChange **changes, unsigned *n_changes);
int unit_file_disable(UnitFileScope scope, bool runtime, const char *root_dir, char **files, UnitFileChange **changes, unsigned *n_changes);
int unit_file_reenable(UnitFileScope scope, bool runtime, const char *root_dir, char **files, bool force, UnitFileChange **changes, unsigned *n_changes);
int unit_file_link(UnitFileScope scope, bool runtime, const char *root_dir, char **files, bool force, UnitFileChange **changes, unsigned *n_changes);
int unit_file_preset(UnitFileScope scope, bool runtime, const char *root_dir, char **files, UnitFilePresetMode mode, bool force, UnitFileChange **changes, unsigned *n_changes);
int unit_file_preset_all(UnitFileScope scope, bool runtime, const char *root_dir, UnitFilePresetMode mode, bool force, UnitFileChange **changes, unsigned *n_changes);
int unit_file_mask(UnitFileScope scope, bool runtime, const char *root_dir, char **files, bool force, UnitFileChange **changes, unsigned *n_changes);
int unit_file_unmask(UnitFileScope scope, bool runtime, const char *root_dir, char **files, UnitFileChange **changes, unsigned *n_changes);
int unit_file_set_default(UnitFileScope scope, const char *root_dir, const char *file, bool force, UnitFileChange **changes, unsigned *n_changes);
int unit_file_get_default(UnitFileScope scope, const char *root_dir, char **name);

UnitFileState unit_file_get_state(UnitFileScope scope, const char *root_dir, const char *filename, EnabledContext *ec);

int unit_file_get_list(UnitFileScope scope, const char *root_dir, Hashmap *h, EnabledContext *ec);

void unit_file_list_free(Hashmap *h);
void unit_file_changes_free(UnitFileChange *changes, unsigned n_changes);

int unit_file_query_preset(UnitFileScope scope, const char *root_dir, const char *name);

const char *unit_file_state_to_string(UnitFileState s) _const_;
UnitFileState unit_file_state_from_string(const char *s) _pure_;

const char *unit_file_change_type_to_string(UnitFileChangeType s) _const_;
UnitFileChangeType unit_file_change_type_from_string(const char *s) _pure_;

EnabledContext *enabled_context_new(void);
void enabled_context_free(EnabledContext *ec);

DEFINE_TRIVIAL_CLEANUP_FUNC(EnabledContext*, enabled_context_free);

#define _cleanup_enabled_context_ _cleanup_(enabled_context_freep)

const char *unit_file_preset_mode_to_string(UnitFilePresetMode m) _const_;
UnitFilePresetMode unit_file_preset_mode_from_string(const char *s) _pure_;
