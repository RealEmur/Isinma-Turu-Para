#include <sourcemod>
#include <sdktools>
#pragma semicolon 1
#pragma newdecls required
ConVar g_para = null;
public Plugin myinfo = 
{
	name = "...", 
	author = "phiso", 
	description = "...", 
	version = "1.0", 
	url = "phiso#3331"
};

public void OnPluginStart()
{
	HookEvent("player_spawn", oyuncudogdu);
	g_para = CreateConVar("sm_isinmaturu_para", "16000", "Oyuncu doğduğunda ve silah aldığında kaç para alsın?", FCVAR_NONE, true, 0.0, true, 16000.0);
	AutoExecConfig(true, "IsınmaTuru_Para");
}
public Action oyuncudogdu(Event event, const char[] name, bool dontBroadcast)
{
	int client = GetClientOfUserId(event.GetInt("userid"));
	if (IsWarmup)
	{
		SetEntProp(client, Prop_Send, "m_iAccount", g_para.IntValue);
	}
}
public Action CS_OnBuyCommand(int client, const char[] weapon)
{
	if (IsWarmup)
	{
		SetEntProp(client, Prop_Send, "m_iAccount", g_para.IntValue);
	}
}
stock bool IsWarmup()
{
	return (GameRules_GetProp("m_bWarmupPeriod") == 1);
} 