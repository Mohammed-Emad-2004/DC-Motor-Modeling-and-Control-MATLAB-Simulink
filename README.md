# ⚡ DC Motor Modeling & Control Strategies — MATLAB/Simulink

> **Mohammed Emad Said Soliman** | UHCI4H  
> Mechatronics Engineering BSc. — University of Debrecen  
> Faculty of Engineering | Department of Electrical Engineering and Mechatronics  
> *Electrical Machines and Drives — 2025/2026/II. Semester*

---

## 📋 Overview

This project covers the complete **modeling, transfer function derivation, and control design** for a **DC motor**, including single-loop speed control, cascade control, and inverter-based control for both DC and induction motors — implemented in **MATLAB and Simulink**.

---

## ⚙️ Motor Parameters

| Parameter | Symbol | Value |
|-----------|--------|-------|
| Nominal voltage | Vₐₙ | 12 V |
| Armature resistance | Rₐ | 1.27 Ω |
| Armature inductance | Lₐ | 0.136 mH |
| Torque/back-EMF constant | kφ | 0.0213 Vs/rad |
| No-load current | Iₐₙₗ | 0.238 A |
| Rotor inertia | Jₘ | 25×10⁻⁷ kg·m² |
| Viscous friction coefficient | Bₘ | (computed from parameters) |

### Load Torques

| Condition | Torque |
|-----------|--------|
| No-load | 0 N·m |
| Between no-load & nominal | 10 mN·m |
| Nominal | 38.9 mN·m |
| Between nominal & stall | 100 mN·m |
| Stall | 185 mN·m |

---

## 🔧 Transfer Functions

### Speed Output (Ω)
```
          kφ
G(s) = ──────────────────────────────────────
       Jₘ·Lₐ·s² + (Bₘ·Lₐ + Jₘ·Rₐ)·s + (kφ² + Bₘ·Rₐ)
```

### Current Output (I)
```
          Jₘ·s + Bₘ
G_I(s) = ──────────────────────────────────────
          Jₘ·Lₐ·s² + (Bₘ·Lₐ + Jₘ·Rₐ)·s + (kφ² + Bₘ·Rₐ)
```

---

## 🎯 Control Strategies

### 1. Transfer Function Methods
- **Direct derivation** from motor differential equations
- **Feedback command** in MATLAB (`feedback()`)
- **Partial fraction expansion** (`residue()`) for time-domain analysis
- **Model Linearizer** export from Simulink (`linsys`)

### 2. Single-Loop Speed Control
- PI/PID controller for speed regulation
- Step response analysis

### 3. Cascade Control
- Inner current loop + outer speed loop
- Improved disturbance rejection

### 4. Inverter-Based Control
- Modeled inverter switching for variable-frequency drive
- Applied to both DC and induction motor models

---

## 📁 File Structure

```
├── EMD_Task2_UHCI4H.m      — Main MATLAB script: TF derivation, residues, feedback
├── UHCI4H_Simulink.slx     — Simulink model: DC motor + control loops
├── Final Report.pdf        — Full assignment report (PDF)
└── Final Report.docx       — Full assignment report (Word)
```

---

## 🚀 How to Run

1. Open MATLAB
2. Run `EMD_Task2_UHCI4H.m` to compute transfer functions and partial fractions
3. Open `UHCI4H_Simulink.slx` to simulate motor response with control loops

### Requirements
- MATLAB with Control System Toolbox
- Simulink

---

*Mechatronics Engineering BSc. — University of Debrecen, 2026*
