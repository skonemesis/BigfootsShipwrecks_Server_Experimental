We need to ensure AI spawns work correctly and interact properly before integrating reinforcements and crate mechanics.

Here’s the correct order of steps to follow:
🔹 Phase 1: AI Spawning & Behavior Testing

1️⃣ Test AI Compatibility with A3XAI, DMS, and ZCP

    Before writing custom AI scripts, we need to check if any of the existing AI mods can handle mission-based AI spawns.
    Questions to Answer:
    ✅ Can we spawn AI using A3XAI, DMS, or ZCP at shipwrecks?
    ✅ Do they despawn correctly after missions?
    ✅ Can we set different factions for land and underwater AI?
    ✅ Do they fight only players and not their own AI squads?
    Action:
        Try spawning test AI manually at a shipwreck.
        Observe behavior, faction allegiance, and despawn mechanics.

2️⃣ Create Basic AI Spawn Scripts

    If A3XAI/DMS/ZCP cannot be used, we need to write our own AI spawn script.
    Priority AI Spawns:
        Land AI spawns near the mission gear crate (on land).
        Underwater AI spawns at the wreck site to protect the loot crate.
    Action:
        Create ExileServer_BigfootsShipwrecks_spawnLandAICommand.sqf.
        Create ExileServer_BigfootsShipwrecks_spawnUnderwaterAICommand.sqf.
        Configure faction settings for AI behavior.

3️⃣ Verify AI Behavior & Combat Mechanics

    AI should attack players but not each other.
    Underwater AI should stay in the water and not surface.
    Land AI should patrol the area near the mission gear crate.
    AI should not randomly despawn while active.

🔹 Phase 2: AI Reinforcements & Backup System

4️⃣ Implement AI Reinforcements (Triggered by Land AI Death)

    If all land AI die, reinforcements should arrive after 15 minutes unless the mission is completed.
    Reinforcement AI Arrival Methods:
        Air reinforcements → Paratroopers or helicopters.
        Ground reinforcements → Vehicles deploy AI at mission site.
        Water reinforcements → Boats or submarines deliver backup divers.
    Action:
        Create ExileServer_BigfootsShipwrecks_spawnReinforcementAICommand.sqf.
        Implement spawn delay & mission completion override.

5️⃣ Test Reinforcement AI Behavior

    AI should only reinforce once.
    AI should not reinforce if mission completes before spawn trigger.
    AI should attack players but not their own squads.

🔹 Phase 3: Crate Transport System

6️⃣ Enable Players to Pick Up & Carry Crates

    Players should be able to pick up and run with crates.
    Crates should not clip through terrain or disappear.
    Action:
        Implement ExileServer_BigfootsShipwrecks_transportCrateCommand.sqf.
        Test crate handling in different terrain.

7️⃣ Allow Swimming with Crates

    Players should be able to carry crates in water.
    Crates should not sink immediately.
    Action:
        Modify ExileServer_BigfootsShipwrecks_transportCrateCommand.sqf to allow swimming.

8️⃣ Allow Loading Crates into Vehicles & Boats

    Players should be able to:
        Load crates into boats.
        Load crates into ground vehicles.
        Use Igiload, Advanced Sling Load, and Exile crate mounting.
    Action:
        Test crate loading mechanics.

🔹 Phase 4: Loot & Economy Balancing

9️⃣ Adjust Loot Tables for Mission Gear & Rewards

    Land crates should contain diving gear (rebreathers, masks, wetsuits, etc.).
    Underwater crates should contain valuable loot & poptabs.
    Action:
        Modify config.sqf to adjust loot balance.

🔟 Fine-Tune Poptab Rewards Based on Risk

    High-risk missions should give higher poptab rewards.
    Balance loot spawns to prevent economy-breaking exploits.
    Action:
        Adjust BS_loot_count_poptabs_seed in config.sqf.

💡 Summary:

✔ Phase 1 (AI Spawning & Testing)
✔ Phase 2 (AI Reinforcements & Backup System)
✔ Phase 3 (Crate Transport System - Carry, Swim, Load)
✔ Phase 4 (Loot & Economy Balancing)
