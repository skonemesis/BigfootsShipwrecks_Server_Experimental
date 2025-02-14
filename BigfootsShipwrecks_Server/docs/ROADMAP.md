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
