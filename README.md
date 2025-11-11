<img width="842" height="640" alt="image" src="https://github.com/user-attachments/assets/592c10f9-da9a-4916-bf59-8d409bba3ddc" />
<img width="1443" height="195" alt="image" src="https://github.com/user-attachments/assets/5d342e81-5977-4f7b-b58c-1eb69ea3a65e" />

# CipherText

**Encrypts texts using Rijndael (AES-256) and RHC algorithms.**  
Supports block-level encryption and decryption, file export, and secure pseudo-random password generation.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

---

## Project Information

| Field | Details |
|-------|---------|
| **Name** | CipherText |
| **Version** | 1.0 |
| **Release Date** | 13/11/2025 |
| **Author** | Kennidy L. Guimarães |
| **License** | MIT |
| **Repository** | [github.com/Kennidy-L-Guimaraes/Rijndael-256-Bit-Cryptography-System](https://github.com/Kennidy-L-Guimaraes/Rijndael-256-Bit-Cryptography-System) |

---

## Description

CipherText is a desktop application developed in **Lazarus (Object Pascal)** that implements **Rijndael (AES-256)** symmetric encryption combined with a custom **RHC (Random Hash Cascading)** mechanism for key derivation and salt generation.

Key features:
- Text encryption and decryption using AES-256
- Integration with SHA-2 (256-bit) for key expansion
- Salt derivation via RHC + user-provided Secret Word
- Base64 encoding of ciphertext for portability
- Export of encrypted data to timestamped `.txt` files
- Built-in pseudo-random password generator (Mersenne Twister)

---

## Technologies

- **Lazarus IDE** with **Object Pascal**
- **TCPCrypt** (cryptographic primitives)
- **RHC** – Custom cascading random hash
- **Mersenne Twister** – High-quality PRNG

---

## Dependencies

- `TCPCrypt`
- `MersenneTwister` unit
- `RHC` unit

> All dependencies are included in the project structure.

---
## VirusTotal Scan

**Clean result (0/70 detections)**  
Executable verified on VirusTotal.

- **SHA-256 Hash**:  
  `4bd925ed46d8d8780ccce838cfbab1ee7c8f1188bcd16efdfdf704194de8cd0b`  
- **Scan Date**: November 13, 2025  
- **Result**: [View Report](https://www.virustotal.com/gui/file/4bd925ed46d8d8780ccce838cfbab1ee7c8f1188bcd16efdfdf704194de8cd0b)

---

## Build & Run

1. Install [Lazarus IDE](https://www.lazarus-ide.org/)
2. Clone the repository:
   ```bash
   git clone https://github.com/Kennidy-L-Guimaraes/Rijndael-256-Bit-Cryptography-System.git
