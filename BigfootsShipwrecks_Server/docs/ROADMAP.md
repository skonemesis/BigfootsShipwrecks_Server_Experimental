# Bigfoot's Shipwrecks - Development Roadmap

## Sprint 1: AI & Crate Transport System
### AI Spawn System for Missions
- [ ] Spawn **land AI** at the nearest land position to the wreck site.
- [ ] Spawn **underwater AI** at the wreck site to guard the underwater loot crate.
- [ ] AI should attack **all players** but **not other AI in the mission**.
- [ ] Ensure **land AI has standard loadouts** and **underwater AI has diving gear**.

### AI Reinforcement System
- [ ] **Trigger AI reinforcements** if land AI are wiped out.
- [ ] Reinforcement AI arrives **via air, land, or water**.
- [ ] **Underwater backup AI** arrives using **boats or underwater vehicles**.
- [ ] Reinforcements should **not spawn if the mission is completed first**.
- [ ] AI should **despawn after mission completion**.

### Crate Transport System
- [ ] Allow **players to pick up and carry crates**.
- [ ] Enable **swimming with crates** to get them to shore.
- [ ] Ensure **crates can be loaded onto vehicles, boats, and helicopters**.
- [ ] Compatibility with **R3F, Igiload, and Advanced Sling Load**.

### Loot & Economy Balancing
- [ ] **Land crates contain diving gear** (rebreathers, wetsuits, masks, etc.).
- [ ] Adjust **poptab rewards** for better risk-reward balance.
- [ ] Modify **loot spawn rates** in `config.sqf` to prevent excessive high-tier gear.

---
## Future Features (Pending Feasibility)
- [ ] **Zeus Integration** (if it doesn't impact server-side scripts).
- [ ] **Clustered wreck spawns in designated zones**.
- [ ] **Custom AI behavior scripting for improved mission variety**.

Prioritization of Features Based on Feasibility & Impact

We'll group features into three categories:
✅ High Feasibility & High Impact (Quick wins, minimal performance impact)
🟡 Medium Feasibility & Medium Impact (Requires balancing, some scripting complexity)
🔴 Low Feasibility & High Complexity (Heavy scripting, possible performance concerns)
✅ Phase 1: High Feasibility & High Impact (Quick Wins)
1. AI Behavior & Mission Scaling

    ✅ Tiered Mission Difficulty – Spawn stronger AI & better loot based on a wreck’s difficulty level.
    ✅ Stealth Mechanics for Underwater AI – Reduce AI detection range for swimming/diving players.
    ✅ AI Divers Loot Dead Players – AI can steal a portion of player loot and store it in crates.
    ✅ Player-Triggered Wreck Events – Players activate sonar scans to detect hidden wrecks.

2. Crate & Loot Upgrades

    ✅ Booby-Trapped Crates – Some crates explode or release gas if not disarmed.
    ✅ Legendary Wrecks (Rare Spawns) – Ultra-rare shipwrecks appear with high-tier loot.

3. AI Interactions

    ✅ Reinforcement AI Tied to Player Proximity – Instead of fixed timers, backup AI only spawns if players stay near the land crate.
    ✅ Patrolling AI Boats & Submarines – AI patrols around wrecks in boats, mini-subs, or SDVs.
    ✅ Land AI Protects Mission Gear & Calls Backup – If AI on land are killed, reinforcements arrive by air, land, or sea.

4. Player Features

    ✅ Persistent Wrecks – Wreck remains visible on the map until looted.
    ✅ Crate Carry & Swim Functionality – Players can carry, swim with, and load crates into vehicles.

🟡 Phase 2: Medium Feasibility & Medium Impact (Requires Balancing)
1. AI Enhancements

    🟡 Faction-Based AI – Friendly & enemy AI fight each other at randomly generated wreck sites.
    🟡 AI Traders at Shipwrecks – Neutral AI divers sell rare gear near wrecks.
    🟡 Backup AI Can Loot Mission Crates – AI reinforcements steal mission items and extract.

2. Mission Variations

    🟡 Escort & Extraction Missions – Example: Rescue an AI diver carrying valuable intel.
    🟡 Underwater Puzzle Mechanics – Wrecks contain locked crates requiring players to find hidden keys.

3. Crate & Loot Upgrades

    🟡 Player-Owned Salvage Companies – Allow clans to claim & defend wreck sites.
    🟡 Loot Scaling Based on Wreck Location – Deeper wrecks = better loot, but harder AI.

🔴 Phase 3: Low Feasibility & High Complexity (Heavy Scripting, Performance Risks)
1. AI Reinforcement Complexity

    🔴 Dynamic AI Response Based on Players Online – AI spawns in different strengths depending on active player count.
    🔴 AI May Have Their Own Mission Objectives – AI tries to retrieve valuable items before players do.

2. Advanced AI Support

    🔴 Zeus Integration – Allows admins to manually spawn AI at wreck sites.
    🔴 AI Air Drops for Backup – AI paratroopers deploy from helicopters.

3. World Events & Persistent Features

    🔴 Towing Large Shipwrecks to Shore – Salvage missions where players tow entire shipwrecks to a processing yard.
    🔴 Underwater Bases or Hideouts – Some wrecks hide secret underwater bunkers with supplies.

Next Steps: Phase 1 Implementation
✅ Start with the fastest wins that will create the biggest impact:

    AI Scaling & Smart Reinforcements (Land + Water AI reacting dynamically)
    Stealth Mechanics for Underwater AI (Adjust AI perception for divers)
    Crate Pickup & Swimming System (Players can transport crates across water)
    Patrolling AI Boats & Mini-Subs (AI using SDVs and small boats for recon)
    Legendary Wrecks & Loot Scaling (Rare wrecks with ultra-valuable loot)
    Booby-Trapped Crates (Players must check for traps before looting)

## Roadmap & Future Development
For upcoming features, planned enhancements, and work-in-progress ideas, see the **[ROADMAP.md](ROADMAP.md)** file.
