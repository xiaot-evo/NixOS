# XiaoT_Evo's NixOS Configuration

这是一个个人的 NixOS 配置仓库，使用 Nix Flakes 架构管理完整的系统和用户环境配置。该配置针对 Acer 笔记本电脑进行了优化，支持 NVIDIA 显卡和 Niri 窗口管理器。

## 🚀 特性

- **现代桌面环境**: 基于 Niri 窗口管理器的 Wayland 桌面环境
- **主题统一**: 使用 Stylix 实现跨应用的主题一致性
- **硬件支持**: 完整的 NVIDIA 显卡支持（包括 PRIME Offload）
- **AMD 平台**: 针对 AMD CPU 和 GPU 的优化配置
- **模块化设计**: 清晰的模块化配置结构，易于维护和扩展

## 📁 项目结构

```
.
├── flake.nix               # 主 flake 配置文件
├── README.md              # 项目说明文档
├── hosts/                 # 主机特定配置
│   └── laptop-acer/       # Acer 笔记本配置
│       ├── default.nix    # 主系统配置
│       ├── hardware.nix   # 硬件配置（自动生成）
│       ├── nvidia.nix     # NVIDIA 显卡配置
│       └── users/         # 用户配置
├── modules/               # 可重用模块
│   ├── home/              # Home Manager 模块
│   ├── stylix/            # Stylix 主题配置
│   └── system/            # 系统级模块
└── overlays/              # Nix 包覆盖
```

## ⚙️ 技术栈

- **NixOS**: 声明式 Linux 发行版
- **Nix Flakes**: 现代化的包管理和构建工具
- **Home Manager**: 用户环境配置管理
- **Niri**: 基于 Wayland 的平铺式窗口管理器
- **Stylix**: 统一主题配置系统
- **NVIDIA Drivers**: 专有显卡驱动支持
- **PipeWire**: 音频服务管理
- **systemd-boot**: 启动加载器

## 🛠️ 安装与使用

### 克隆仓库

```bash
git clone https://github.com/XiaoT_Evo/NixOS-config.git
cd NixOS-config
```

### 切换到新配置

```bash
# 应用系统配置（需要管理员权限）
sudo nixos-rebuild switch --flake .#nixos

# 应用用户配置
home-manager switch --flake .#xiaot_evo
```

### 更新依赖

```bash
# 更新所有 flake 输入
nix flake update
```

## 💻 主要配置详情

### 系统配置 (hosts/laptop-acer/)
- 使用 systemd-boot EFI 启动加载器
- 启用 Plymouth 开机动画
- 静默启动参数优化
- 最新内核支持
- 中国时区设置 (Asia/Shanghai)
- 中文本地化支持

### 硬件配置 (hardware.nix)
- 自动检测的硬件配置
- NVMe SSD 支持
- Btrfs 文件系统（带压缩）
- 交换分区配置

### NVIDIA 显卡配置 (nvidia.nix)
- NVIDIA 和 AMD GPU PRIME Offload 支持
- 开源内核模块支持
- 电源管理优化
- 性能模式配置

### 桌面环境 (modules/system/desktop/niri/)
- Niri 窗口管理器
- PipeWire 音频系统
- 蓝牙支持
- 打印服务

### 主题配置 (modules/home/stylix.nix)
- 全系统主题一致性
- 支持 Niri、GTK、QT、浏览器等应用
- 终端和 Shell 主题

## 🔧 自定义配置

### 添加新程序
在 `modules/programs/` 目录下添加新的程序配置，然后在相应的 `default.nix` 文件中导入。

### 修改用户配置
编辑 `hosts/laptop-acer/users/xiaot_evo.nix` 文件来修改用户特定设置。

### 更改主题
修改 `modules/stylix/` 目录下的主题配置文件。

## 🤝 贡献

欢迎提交 Issue 和 Pull Request 来改进此配置！

## 📄 许可证

MIT License