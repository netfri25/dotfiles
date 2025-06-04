#pragma once
#include <X11/XF86keysym.h>

/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int snap      = 12;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 0;        /* 0 means bottom bar */

/*  Display modes of the tab bar: never shown, always shown, shown only in  */
/*  monocle mode in the presence of several windows.                        */
/*  Modes after showtab_nmodes are disabled.                                */
enum showtab_modes { showtab_never, showtab_auto, showtab_nmodes, showtab_always};
static const int showtab			= showtab_auto;        /* Default tab bar show mode */
static const int toptab				= False;               /* False means bottom tab bar */

#define ICONSIZE 16   /* icon size */
#define ICONSPACING 5 /* space between icon and title */
static const char *fonts[]          = { "Iosevka Custom:size=11" };
static const char dmenufont[]       = "Iosevka Custom:size=11";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_black[]       = "#000000";
static const char col_brown[]       = "#696355";
static const char col_cyan[]        = "#005577";
static const char col_dark_cyan[]   = "#224c5d";
static const char *colors[][4]      = {
	/*               fg         bg         border     float */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2, col_dark_cyan },
	[SchemeSel]  = { col_gray4, col_black, col_brown, col_cyan },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "zoom",     NULL,       NULL,       1 << 3,       0,           -1 },
	{ "vesktop",  NULL,       NULL,       1 << 2,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 0; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
// #define MODKEY Mod1Mask
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char* dmenucmd[] = { "rofi", "-show", "drun", NULL };
static const char* termcmd[]  = { "alacritty", NULL };

#define SAVE_SCREENSHOT "tee $HOME/Pictures/Screenshots/$(date +'Screenshot-from-%Y-%m-%d-%H-%M-%S').png | xclip -selection clipboard -t image/png"
#define SCREENSHOT_CMD           "maim -u | "       SAVE_SCREENSHOT
#define SELECTION_SCREENSHOT_CMD "maim -u -s -D | " SAVE_SCREENSHOT

#define BRIUP_CMD   "brightnessctl set 2%+ -n"
#define BRIDOWN_CMD "brightnessctl set 2%- -n"

#define VOL_UPDATE_CMD "; kill -RTMIN+1 $(pidof statux)"
#define VOLUP_CMD   "amixer sset Master 5%+" VOL_UPDATE_CMD
#define VOLDOWN_CMD "amixer sset Master 5%-" VOL_UPDATE_CMD
#define VOLMUTE_CMD "amixer sset Master toggle" VOL_UPDATE_CMD

#define MEDIA_UPDATE_CMD "; sleep 0.05; kill -RTMIN+2 $(pidof statux)"
#define MEDIA_NEXT_CMD   "playerctl next" MEDIA_UPDATE_CMD
#define MEDIA_PREV_CMD   "playerctl previous" MEDIA_UPDATE_CMD
#define MEDIA_TOGGLE_CMD "playerctl play-pause" MEDIA_UPDATE_CMD

#define CONFIG_MON       "$HOME/config-monitor.sh"

static const Key keys[] = {
	/* modifier                     key                       function        argument */
	{ MODKEY,                       XK_s,                     spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return,                spawn,          {.v = termcmd } },
	{ 0,                            XK_Print,                 spawn,          SHCMD(SELECTION_SCREENSHOT_CMD) },
	{ ShiftMask,                    XK_Print,                 spawn,          SHCMD(SCREENSHOT_CMD) },
    { 0,                            XF86XK_AudioRaiseVolume,  spawn,          SHCMD(VOLUP_CMD) },
    { 0,                            XF86XK_AudioLowerVolume,  spawn,          SHCMD(VOLDOWN_CMD) },
    { 0,                            XF86XK_AudioMute,         spawn,          SHCMD(VOLMUTE_CMD) },
    { MODKEY,                       XK_F2,                    spawn,          SHCMD(VOLUP_CMD) },
    { MODKEY,                       XK_F1,                    spawn,          SHCMD(VOLDOWN_CMD) },
    { Mod1Mask,                     XK_F3,                    spawn,          SHCMD(MEDIA_NEXT_CMD) },
    { Mod1Mask,                     XK_F2,                    spawn,          SHCMD(MEDIA_PREV_CMD) },
    { Mod1Mask,                     XK_F1,                    spawn,          SHCMD(MEDIA_TOGGLE_CMD) },
    { 0,                            XF86XK_MonBrightnessUp,   spawn,          SHCMD(BRIUP_CMD) },
    { 0,                            XF86XK_MonBrightnessDown, spawn,          SHCMD(BRIDOWN_CMD) },
    { MODKEY,                       XK_F4,                    spawn,          SHCMD(BRIUP_CMD) },
    { MODKEY,                       XK_F3,                    spawn,          SHCMD(BRIDOWN_CMD) },
    { MODKEY|ShiftMask,             XK_d,                     spawn,          SHCMD(CONFIG_MON) },
	{ MODKEY,                       XK_w,                     tabmode,        {-1} },
	{ MODKEY,                       XK_j,                     focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,                     focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,                     incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,                     incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,                     setmfact,       {.f = -0.025} },
	{ MODKEY,                       XK_l,                     setmfact,       {.f = +0.025} },
	{ MODKEY,                       XK_z,                     zoom,           {0} },
	{ MODKEY,                       XK_Tab,                   view,           {0} },
	{ MODKEY,                       XK_q,                     killclient,     {0} },
	{ MODKEY|ShiftMask,             XK_t,                     setlayout,      {.v = &layouts[0]} },
	{ MODKEY|ShiftMask,             XK_f,                     setlayout,      {.v = &layouts[1]} },
	{ MODKEY|ShiftMask,             XK_m,                     setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_f,                     togglefloating, {0} },
	{ MODKEY,                       XK_0,                     view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,                     tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,                 focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period,                focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,                 tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period,                tagmon,         {.i = +1 } },
    { MODKEY|ShiftMask|ControlMask, XK_q,                     quit,           {0} },
	TAGKEYS(XK_1, 0)
	TAGKEYS(XK_2, 1)
	TAGKEYS(XK_3, 2)
	TAGKEYS(XK_4, 3)
	TAGKEYS(XK_5, 4)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
	{ ClkTabBar,            0,              Button1,        focuswin,       {0} },
};
