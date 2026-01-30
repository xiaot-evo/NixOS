# NixOS 配置（flake）

这是个人的 NixOS 配置仓库，基于 Nix flakes 组织。用于管理系统配置、用户配置（home-manager）以及可复用的模块与程序设置。

**项目结构概览**
- `hosts/`: 主机特定配置（例如 laptop-acer）
- `modules/`: 可复用的系统与用户模块（programs、home、system 等）
- `overlays/`: Nix 包覆盖
- `flake.nix`, `devenv.nix`, `devenv.yaml`: flakes 与开发环境配置

**快速开始（先决条件）**
- 已安装 Nix，并启用 flakes 支持（Nix >= 2.4 推荐）
- 了解基础的 NixOS 与 flakes 使用方法

**常用命令**

更新 flakes 依赖：

```bash
nix flake update
```

将某个主机切换到本仓库配置（以 `laptop-acer` 为例）：

```bash
sudo nixos-rebuild switch --flake .#laptop-acer
```

如果使用独立的 home-manager：

```bash
home-manager switch --flake .#<username>
```

或通过 NixOS 的 integration：

```bash
sudo nixos-rebuild switch --flake .#<host>
```

**如何定制**
- 修改主机配置：编辑 `hosts/<host>/default.nix`（例如 `hosts/laptop-acer/default.nix`）。
- 修改或添加模块：在 `modules/` 下新增或修改对应的模块（例如 `modules/home/` 或 `modules/system/`）。
- 更新或添加程序设置：查看 `modules/programs/` 目录并按照已有样式添加配置。

**贡献指南**
- 提交 issue 说明要改进或遇到的问题。
- 提交 PR 时，请在提交说明里写明变更的目的与影响范围。

**许可证**
此仓库采用 MIT 许可证（如果需要其他许可，请根据需求修改）。
