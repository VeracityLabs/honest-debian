# Honest-Debian: Hardened OS for Truth Machines

This is a **fork of pi-gen**, the official Raspberry Pi OS (Raspbian)-based image building tool. Our fork creates a **hardened Raspberry Pi OS distribution** specifically designed for the **Truth Machines** project.

---

## What Is Truth Machines?

The **Truth Machines** project combats data manipulation in research by creating tamper-proof devices that ensure **verifiable, unaltered results** from the moment of collection.

- **Why It Matters**: Academic fraud, such as the infamous case of **Diederik Stapel**, has eroded trust in research. Stapel fabricated results for years, keeping raw data hidden and manipulating findings, resulting in **58 retractions**. Such scandals waste resources and undermine public confidence in science.  
- **How It Works**: Truth Machines use **tamper-proof sensors** to collect data and immediately **cryptographically seal** each reading. This ensures that results are provably real and cannot be maliciously altered after collection.

---

## About This Fork

To support Truth Machines, we’ve modified **pi-gen** to create a **hardened Raspberry Pi OS** with:

- **Enhanced security features** to protect against tampering.  
- **Preconfigured cryptographic tools** for signing sensor outputs.  
- **Support for trusted execution environments (TEE)**, ensuring data authenticity.

This hardened OS serves as the foundation for Truth Machines, enabling tamper-proof data collection at scale.

---

## Dependencies

Our fork inherits the same dependencies as pi-gen. On a Debian-based host system, run:

```bash
apt-get install coreutils quilt parted qemu-user-static debootstrap zerofree zip \
dosfstools libarchive-tools libcap2-bin grep rsync xz-utils file git curl bc \
gpg pigz xxd arch-test
```

For non-Debian distros, Docker builds are available (see below).

---

## Getting Started

### Cloning the Repository

Clone the **Truth Machines fork**:

```bash
git clone https://github.com/VeracityLabs/honest-debian.git
```

> Avoid cloning into a directory with spaces in the path, as this breaks `debootstrap`.

### Configuration

Edit the `config` file to set up your build. Example:

```bash
IMG_NAME='truth-machines-os'
```

Our fork adds **custom scripts** and **stage modifications** tailored for Truth Machines, but the core functionality remains consistent with the original pi-gen.

---

## Building with Docker

For consistency and ease of setup, we recommend using Docker. To build:

1. Edit the `config` file as needed.
2. Run:

   ```bash
   ./build-docker.sh
   ```

3. Find the final image in the `deploy/` directory.

For incremental changes or troubleshooting, refer to the original pi-gen documentation.

---

## Stage Overview

**pi-gen** builds images in stages, adding functionality layer by layer. Key modifications in this fork include:

- **Stage 0 & 1**: Base system setup, with added hardening and secure defaults.  
- **Stage 2**: Installation of TEE drivers and cryptographic tools for Truth Machines.  
- **Stage 3+**: Additional customizations for UI-based environments, if needed.

To build a headless image, skip unnecessary stages by adding a `SKIP` file in their directories.

---

## Original pi-gen Documentation

This fork retains the core functionality of pi-gen. For detailed usage instructions, see the [official pi-gen documentation](https://github.com/RPI-Distro/pi-gen).

---

For questions or support, contact us at: truth-machines@see3.xyz.
