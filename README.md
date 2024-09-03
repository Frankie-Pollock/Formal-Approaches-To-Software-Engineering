# Housing of the Future! - Formal Approaches to Software Engineering

## Overview

This repository contains the coursework for the Formal Approaches to Software Engineering module (SET10112/SET10412). The project involves designing a control system for an energy-efficient house using Ada-SPARK specifications. The system ensures optimal operation of heating, ventilation, and other components to maintain energy efficiency and safety.

## Coursework Components

### 1. Report

The report is structured as follows, adhering to the LNCS template:

- **Introduction:** Overview of the problem and solution.
- **Controller Structure:** High-level view of the control system design.
- **Descriptions of Procedures and Functions:** Detailed descriptions of components.
- **Proof of Consistency:** Formal verification of key components.
- **Safety Plan:** Hazard and risk analysis, mitigations, and failure analysis.
- **Safety Case and Safety Manual:** Goal Structuring Notation (GSN) for safety argumentation.
- **Conclusion:** Discussion of shortcomings and future improvements.

**Report File:** [40618059.pdf](40618059.pdf)

### 2. Code

The Ada-SPARK code for the control system, including specifications and bodies, is included in the repository. 

**Code Files:**
- **Controller Specifications:** `controller_specs.adb`
- **Controller Bodies:** `controller_bodies.adb`
- **SPARK Proofs:** `proofs.ads`, `proofs.adb`

## SPARK Levels Achieved

- **Stone Level:** Basic SPARK validity.
- **Bronze Level:** Correct initialization and data flow.
- **Silver Level:** Absence of runtime errors.
- **Gold Level:** Proof of key integrity properties.
- **Platinum Level:** Full functional proof of requirements.
