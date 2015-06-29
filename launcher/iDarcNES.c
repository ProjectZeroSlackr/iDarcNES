/*
 * Last updated: Oct 12, 2008
 * ~Keripo
 *
 * Copyright (C) 2008 Keripo
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */

#include "browser-ext.h"

static PzModule *module;
static ttk_menu_item browser_extension;
static int sound = 0;
static const char *path, *dir;

// For now, iDarcNES only handles NES roms by default since
// iGameGear has better SMS emulation
static int check_ext(const char *file)
{
	if (check_file_ext(file, ".nes") == 1) {
		sound = 1;
		return 1;
	} else {
		sound = 0;
		return 0;
	}
}
static int check_ext_all(const char *file)
{
	if (check_file_ext(file, ".nes") == 1) {
		sound = 1;
		return 1;
	} else if (check_file_ext(file, ".sms") == 1) {
		sound = 0;
		return 1;
	} else {
		sound = 0;
		return 0;
	}
}

static PzWindow *load_file(const char *file)
{
	if (sound == 1) {
		const char *const cmd[] = {"Launch.sh", file, NULL};
		pz_execv_kill(
			path,
			(char *const *)cmd
		);
	} else {
		const char *const cmd[] = {"Launch.sh", file, "--nosound", NULL};
		pz_execv_kill(
			path,
			(char *const *)cmd
		);
	}
	sound = 0;
	return NULL;
}

static PzWindow *load_file_handler(ttk_menu_item *item)
{
	return load_file(item->data);
}

static PzWindow *browse_roms()
{
	chdir(dir);
	return open_directory_title(dir, "iDarcNES Roms");
}

static PzWindow *fastlaunch()
{
	return load_file(NULL);
}

static PzWindow *readme()
{
	return pz_new_textview_window(
		"/opt/Emulators/iDarcNES/ReadMe from Keripo.txt");
}

static void cleanup()
{
	pz_browser_remove_handler(check_ext);
}

static void init_launch() 
{
	module = pz_register_module("iDarcNES", cleanup);
	path = "/opt/Emulators/iDarcNES/Launch/Launch.sh";
	dir = "/opt/Emulators/iDarcNES/Roms";
	
	pz_menu_add_stub_group("/Emulators/iDarcNES", "Console");
	pz_menu_add_action_group("/Emulators/iDarcNES/#FastLaunch", "#FastLaunch", fastlaunch);
	pz_menu_add_action_group("/Emulators/iDarcNES/~ReadMe", "#FastLaunch", readme);
	pz_menu_add_action_group("/Emulators/iDarcNES/Roms", "Browse", browse_roms);
	pz_menu_sort("/Emulators/iDarcNES");
	
	browser_extension.name = N_("Open with iDarcNES");
	browser_extension.makesub = load_file_handler;
	pz_browser_add_action (check_ext_all, &browser_extension);
	pz_browser_set_handler(check_ext, load_file);
}

PZ_MOD_INIT(init_launch)
