# Bigfoot's Shipwrecks - Server Mod

## Changelog:
- **8/5/2016 v1.0.0** - Initial release.
- **05/01/2021** - Modified by Ketanna to:
  - Automatically detect the map center.
  - Introduce variables for setting crate spawn depth.
  - Change shipwreck marker to display a blue ship icon.
- **02/13/2025** - Updated by sko & Ghost PGM DEV TEAM:
  - Improved spawn logic for wrecks & crates.
  - Added structured logging and debugging support.
  - Refactored scripts for maintainability & efficiency.

## Author:
- **Bigfoot**

## Credits:
- Earliest known script variation: Darth_Rogue, Chisel, deadeye, and Robio.
- Based on a modified script by Tuna.
- **TaylorSwift** - Mod template support.
- **Second_Coming** - Inspiration from the Occupation mod.

## Summary:
This addon spawns shipwrecks with loot crates and markers in **random ocean locations** on server restart.

- **AI does not spawn at crates (yet)**, but can be added manually.
- **Crates cannot be looted underwater** (Arma restriction).
- Use **R3F, Igiload, or Exile crate mounting** to transport crates to shore.
- Encourages modders to contribute improvements back to the community.

Most settings can be **customized** in `config.sqf`.

## Features:
✅ **Configurable loot crates** – Control loot spawn chances, guaranteed items, poptab rewards, and random item selection.
✅ **Dynamic shipwreck spawns** – Configurable wreck quantity and distance from map center.
✅ **Real-time tracking** – Players within a set radius will trigger:
   - **Marker removal**
   - **Exile toast notification**
   - **Global chat message (optional)**
✅ **Performance Optimizations** – Simulation disabled on crates to reduce lag.
✅ **Structured Logging & Debugging** – Logs critical events in `.RPT` files.

## Roadmap:
🔹 **Add optional AI guarding crates**.
🔹 **Improve spawn distribution logic** (e.g., clustered wreck spawns in designated zones).
🔹 **Adjust loot tables for increased variety & balancing**.

## Installation:
1. **Download & Extract** the mod files.
2. **Compile to `.pbo`** and place in:
   ```
   @ExileServer/addons/BigfootsShipwrecks_Server.pbo
   ```
3. **Customize settings** in `config.sqf`.
4. **Restart server** to apply changes.

## Configuration:
Edit `config.sqf` to adjust settings such as:
- **Number of shipwrecks (`BS_count_shipwrecks`)**.
- **Loot probabilities & item spawn settings**.
- **Marker visibility & notification preferences**.
- **Distance constraints for shipwreck spawns**.

---
## **Technical Overview & File Structure**
### **1. Initialization & Execution Flow**
📌 **Startup Process:**
- `bootstrap/fn_preInit.sqf` → Preloads functions.
- `bootstrap/fn_postInit.sqf` → Calls `ExileServer_BigfootsShipwrecks_initialize.sqf` to start the system.

📌 **Spawning & Setup:**
- `ExileServer_BigfootsShipwrecks_spawnShipwrecksCommand.sqf`
  - Finds valid ocean locations using `BIS_fnc_findSafePos`.
  - Spawns **wreck objects** and **loot crates**.
  - Calls `setupCrateCommand.sqf` to configure crates.
- `ExileServer_BigfootsShipwrecks_setupCrateCommand.sqf`
  - Locks crates and disables physics for performance.
  - Calls:
    - `addItemsToCrateCommand.sqf` (to spawn loot)
    - `addMoneyToCrateCommand.sqf` (to add poptabs)

📌 **Loot & Poptab Distribution:**
- `ExileServer_BigfootsShipwrecks_addItemsToCrateCommand.sqf`
  - Uses weighted probabilities to spawn random loot.
- `ExileServer_BigfootsShipwrecks_addMoneyToCrateCommand.sqf`
  - Adds poptabs (currency) to crates based on weighted distribution.

📌 **Marker & Tracking System:**
- `ExileServer_BigfootsShipwrecks_createShipwreckMarkerCommand.sqf`
  - Places **blue map markers** at shipwreck locations.
  - Uses `ExileServer_BigfootsShipwrecks_getWreckIdForSpawnCountIndexQuery.sqf` to create **unique marker IDs**.
- `ExileServer_BigfootsShipwrecks_maintainShipwrecksCommand.sqf`
  - **Removes markers when players approach**.
  - **Triggers chat notifications** when crates are claimed.
- `ExileServer_BigfootsShipwrecks_sendClientNotificationCommand.sqf`
  - Sends **Exile toast notifications** when crates are discovered.

📌 **Logging & Debugging:**
- `ExileServer_BigfootsShipwrecks_util_logCommand.sqf`
  - Logs **shipwreck spawns, loot assignments, and player interactions**.

---
### **🎯 Final Notes**
✅ **All scripts are aligned and working together**.
✅ **Debugging logs are enabled** for tracking shipwreck events in `.RPT` logs.
✅ **Configurable settings are centralized in `config.sqf`**.

📌 **Next Steps:**
1. **Test the system & verify `.RPT` logs** for correct shipwreck behavior.
2. **Fine-tune loot balance** based on gameplay feedback.
3. **Expand features (optional AI guards, wreck clustering, etc.)**.

---
📢 **For contributors:**
- Please **keep code structured** and **use logging** for easier debugging.
- Report any **bugs or balance issues** to the Ghost PGM DEV TEAM.

🚀 Happy Modding! 🚀

