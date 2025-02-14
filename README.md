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
  - Fixed poptab reward logic using `randomRoll` method.
  - Standardized config variable names and descriptions.
  - Restored AI spawns for underwater & land-based missions.
  - Integrated reinforcement AI mechanics for land-based missions.
  - Introduced AI vehicle reinforcements (land, air, and water) for dynamic combat scenarios.
  - Added support for carrying, swimming, and transporting crates via land and water.

## Author:
- Bigfoot

## Credits:
- Earliest known script variation: Darth_Rogue, Chisel, deadeye, and Robio.
- Based on a modified script by Tuna.
- TaylorSwift - Mod template support.
- Second_Coming - Inspiration from the Occupation mod.

## Summary:
This addon spawns shipwrecks with loot crates and markers in random ocean locations on server restart.

- AI now spawns to protect loot crates.
- Land AI defends a crate with mission equipment (rebreathers, wetsuits, etc.).
- Underwater AI defends the crate at the shipwreck site.
- Backup AI reinforcement spawns if land AI are wiped out (after 15 minutes, unless mission is completed).
- Backup AI arrives via ground, air, or water vehicles depending on location.
- Crates cannot be looted underwater (Arma restriction).
- Players can now pick up, carry, swim with, and load crates into land and water vehicles.
- Use R3F, Igiload, Advanced Sling Load, or Exile crate mounting to transport crates to shore.
- Encourages modders to contribute improvements back to the community.

Most settings can be customized in `config.sqf`.

## Features:
- Configurable loot crates – Control loot spawn chances, guaranteed items, poptab rewards, and random item selection.
- Dynamic shipwreck spawns – Configurable wreck quantity and distance from map center.
- AI Defenders:
   - Land AI protects the mission crate with diving gear.
   - Underwater AI protects the wreck site.
   - Backup AI spawns if land AI are eliminated (unless mission completes first).
   - Backup AI arrive in air, ground, or water vehicles.
- Crate Transport System:
   - Players can **pick up, carry, swim with, and transport** crates to shore or load them onto vehicles.
   - Integration with **R3F, Igiload, Advanced Sling Load, and Exile crate mounting**.
- Real-time tracking – Players within a set radius will trigger:
   - Marker removal
   - Exile toast notification
   - Global chat message (optional)
- Performance Optimizations – Simulation disabled on crates to reduce lag.
- Structured Logging & Debugging – Logs critical events in `.RPT` files.

## Roadmap:
- Zeus Integration (Optional, if server performance allows).
- Improve spawn distribution logic (e.g., clustered wreck spawns in designated zones).
- Adjust loot tables for increased variety & balancing.

## Installation:
1. Download & Extract the mod files.
2. Compile to `.pbo` and place in:
   ```
   @ExileServer/addons/BigfootsShipwrecks_Server.pbo
   ```
3. Customize settings in `config.sqf`.
4. Restart server to apply changes.

## Configuration:
Edit `config.sqf` to adjust settings such as:
- Number of shipwrecks (`BS_count_shipwrecks`).
- Loot probabilities & item spawn settings.
- Marker visibility & notification preferences.
- Distance constraints for shipwreck spawns.
- AI spawn settings (land AI, underwater AI, reinforcement behavior, vehicle spawns).
- Crate carrying & transport settings.

---
## Technical Overview & File Structure
### 1. Initialization & Execution Flow
**Startup Process:**
- `bootstrap/fn_preInit.sqf` → Preloads functions.
- `bootstrap/fn_postInit.sqf` → Calls `ExileServer_BigfootsShipwrecks_initialize.sqf` to start the system.

**Spawning & Setup:**
- `ExileServer_BigfootsShipwrecks_spawnShipwrecksCommand.sqf`
  - Finds valid ocean locations using `BIS_fnc_findSafePos`.
  - Spawns wreck objects and loot crates.
  - Calls `setupCrateCommand.sqf` to configure crates.
- `ExileServer_BigfootsShipwrecks_setupCrateCommand.sqf`
  - Locks crates and disables physics for performance.
  - Calls:
    - `addItemsToCrateCommand.sqf` (to spawn loot)
    - `addMoneyToCrateCommand.sqf` (to add poptabs)

**AI Spawn System:**
- `ExileServer_BigfootsShipwrecks_spawnLandAICommand.sqf`
  - Spawns land AI at the nearest point to the mission.
  - AI protects the mission gear crate.
  - If all land AI are killed, reinforcement AI spawns after 15 minutes (unless mission is complete).
  - Backup AI arrive via land, air, or water vehicles.
- `ExileServer_BigfootsShipwrecks_spawnUnderwaterAICommand.sqf`
  - Spawns AI divers around the underwater shipwreck.
  - AI protects the wreck’s loot crate.
  - Despawns once mission is completed.

**Crate Transport System:**
- `ExileServer_BigfootsShipwrecks_transportCrateCommand.sqf`
  - Enables players to **carry, swim with, and load crates onto vehicles**.
  - Works with **R3F, Igiload, Advanced Sling Load, and Exile crate mounting**.

---
### Final Notes
- All scripts are aligned and working together.
- AI now properly spawn and defend shipwreck sites.
- Backup AI reinforcements function dynamically.
- Crate transport system allows full mobility and vehicle loading.
- Debugging logs are enabled for tracking shipwreck events in `.RPT` logs.
- Configurable settings are centralized in `config.sqf`.

**Next Steps:**
1. Test AI spawning & verify `.RPT` logs for correct behavior.
2. Fine-tune AI spawn rates & loot balance based on gameplay feedback.
3. Expand features (optional AI guards, wreck clustering, etc.).

**For contributors:**
- Please keep code structured and use logging for easier debugging.
- Report any bugs or balance issues to the Ghost PGM DEV TEAM.

Happy Modding!
