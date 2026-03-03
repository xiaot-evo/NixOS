{
  programs.noctalia-shell.settings = {
    settingsVersion = 0;
    bar = {
      barType = "simple";
      position = "top";
      monitors = [ ];
      density = "default";
      showOutline = false;
      showCapsule = true;
      # capsuleOpacity = 1;
      capsuleColorKey = "none";
      widgetSpacing = 6;
      contentPadding = 2;
      fontScale = 1;
      # backgroundOpacity = 0.93;
      useSeparateOpacity = false;
      floating = false;
      marginVertical = 4;
      marginHorizontal = 4;
      frameThickness = 8;
      frameRadius = 12;
      outerCorners = false;
      exclusive = true;
      hideOnOverview = false;
      displayMode = "always_visible";
      autoHideDelay = 500;
      autoShowDelay = 150;
      showOnWorkspaceSwitch = true;
      widgets = {
        left = [
          {
            id = "ControlCenter";
            useDistroLogo = true;
            colorizeDistroLogo = false;
            enableColorization = true;
            colorizeSystemIcon = "primary";
          }
          { id = "Launcher"; }
          { id = "Workspace"; }
          { id = "ActiveWindow"; }
        ];
        center = [
          {
            id = "Clock";
            formatHorizontal = "HH:mm ddd MMM dd";
            formatVertical = "HH mm - dd MM";
            tooltipFormat = "HH:mm ddd MMM dd";
          }
          { id = "MediaMini"; }
        ];
        right = [
          {
            id = "Tray";
            "drawerEnabled" = false;
          }
          { id = "SystemMonitor"; }
          { id = "NotificationHistory"; }
          { id = "plugin:screen-recorder"; }
          { id = "Volume"; }
          { id = "Brightness"; }
          {
            id = "Battery";
            showPowerProfiles = true;
          }
          {
            id = "SessionMenu";
          }
        ];
      };
      mouseWheelAction = "none";
      reverseScroll = false;
      mouseWheelWrap = true;
      screenOverrides = [ ];
    };
    general = {
      avatarImage = "~/.face";
      dimmerOpacity = 0.2;
      showScreenCorners = false;
      forceBlackScreenCorners = false;
      scaleRatio = 1;
      radiusRatio = 1;
      iRadiusRatio = 1;
      boxRadiusRatio = 1;
      screenRadiusRatio = 1;
      animationSpeed = 1;
      animationDisabled = false;
      compactLockScreen = false;
      lockScreenAnimations = true;
      lockOnSuspend = true;
      showSessionButtonsOnLockScreen = true;
      showHibernateOnLockScreen = false;
      enableLockScreenMediaControls = true;
      enableShadows = true;
      shadowDirection = "center";
      shadowOffsetX = 0;
      shadowOffsetY = 0;
      language = "";
      allowPanelsOnScreenWithoutBar = true;
      showChangelogOnStartup = true;
      telemetryEnabled = false;
      enableLockScreenCountdown = true;
      lockScreenCountdownDuration = 10000;
      autoStartAuth = false;
      allowPasswordWithFprintd = false;
      clockStyle = "custom";
      clockFormat = "hh\nmm";
      passwordChars = false;
      lockScreenMonitors = [ ];
      lockScreenBlur = 0;
      lockScreenTint = 0;
      keybinds = {
        keyUp = [
          "Up"
        ];
        keyDown = [
          "Down"
        ];
        keyLeft = [
          "Left"
        ];
        keyRight = [
          "Right"
        ];
        keyEnter = [
          "Return"
        ];
        keyEscape = [
          "Esc"
        ];
        keyRemove = [
          "Del"
        ];
      };
      reverseScroll = false;
    };
    ui = {
      # fontDefault = "";
      # fontFixed = "";
      fontDefaultScale = 1;
      fontFixedScale = 1;
      tooltipsEnabled = true;
      boxBorderEnabled = false;
      # panelBackgroundOpacity = lib.mkForce 0.6;
      panelsAttachedToBar = true;
      settingsPanelMode = "attached";
      settingsPanelSideBarCardStyle = false;
    };
    location = {
      name = "Baiyin";
      weatherEnabled = true;
      weatherShowEffects = true;
      useFahrenheit = false;
      use12hourFormat = false;
      showWeekNumberInCalendar = false;
      showCalendarEvents = true;
      showCalendarWeather = true;
      analogClockInCalendar = false;
      firstDayOfWeek = -1;
      hideWeatherTimezone = false;
      hideWeatherCityName = false;
    };
    calendar = {
      cards = [
        {
          enabled = true;
          id = "calendar-header-card";
        }
        {
          enabled = true;
          id = "calendar-month-card";
        }
        {
          enabled = true;
          id = "weather-card";
        }
      ];
    };
    wallpaper = {
      enabled = true;
      overviewEnabled = true;
      directory = "";
      monitorDirectories = [ ];
      enableMultiMonitorDirectories = false;
      showHiddenFiles = false;
      viewMode = "single";
      setWallpaperOnAllMonitors = true;
      fillMode = "crop";
      fillColor = "#000000";
      useSolidColor = false;
      solidColor = "#1a1a2e";
      automationEnabled = false;
      wallpaperChangeMode = "random";
      randomIntervalSec = 300;
      transitionDuration = 1500;
      transitionType = "random";
      skipStartupTransition = false;
      transitionEdgeSmoothness = 0.05;
      panelPosition = "follow_bar";
      hideWallpaperFilenames = false;
      overviewBlur = 0.4;
      overviewTint = 0.6;
      useWallhaven = false;
      wallhavenQuery = "";
      wallhavenSorting = "relevance";
      wallhavenOrder = "desc";
      wallhavenCategories = "111";
      wallhavenPurity = "100";
      wallhavenRatios = "";
      wallhavenApiKey = "";
      wallhavenResolutionMode = "atleast";
      wallhavenResolutionWidth = "";
      wallhavenResolutionHeight = "";
      sortOrder = "name";
      favorites = [ ];
    };
    appLauncher = {
      enableClipboardHistory = true;
      autoPasteClipboard = true;
      enableClipPreview = true;
      clipboardWrapText = true;
      clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
      clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
      position = "center";
      pinnedApps = [ ];
      useApp2Unit = false;
      sortByMostUsed = true;
      terminalCommand = "ghostty -e";
      customLaunchPrefixEnabled = false;
      customLaunchPrefix = "";
      viewMode = "list";
      showCategories = true;
      iconMode = "tabler";
      showIconBackground = true;
      enableSettingsSearch = true;
      enableWindowsSearch = true;
      enableSessionSearch = true;
      ignoreMouseInput = false;
      screenshotAnnotationTool = "";
      overviewLayer = false;
      density = "default";
    };
    controlCenter = {
      position = "close_to_bar_button";
      openAtMouseOnBarRightClick = true;
      diskPath = "/";
      shortcuts = {
        left = [
          { id = "Network"; }
          { id = "Bluetooth"; }
          { id = "WallpaperSelector"; }
          { id = "NoctaliaPerformance"; }
        ];
        right = [
          { id = "Notifications"; }
          { id = "PowerProfile"; }
          { id = "KeepAwake"; }
          { id = "NightLight"; }
        ];
      };
      cards = [
        {
          enabled = true;
          id = "profile-card";
        }
        {
          enabled = true;
          id = "shortcuts-card";
        }
        {
          enabled = true;
          id = "audio-card";
        }
        {
          enabled = false;
          id = "brightness-card";
        }
        {
          enabled = true;
          id = "weather-card";
        }
        {
          enabled = true;
          id = "media-sysmon-card";
        }
      ];
    };
    systemMonitor = {
      cpuWarningThreshold = 80;
      cpuCriticalThreshold = 90;
      tempWarningThreshold = 80;
      tempCriticalThreshold = 90;
      gpuWarningThreshold = 80;
      gpuCriticalThreshold = 90;
      memWarningThreshold = 80;
      memCriticalThreshold = 90;
      swapWarningThreshold = 80;
      swapCriticalThreshold = 90;
      diskWarningThreshold = 80;
      diskCriticalThreshold = 90;
      diskAvailWarningThreshold = 20;
      diskAvailCriticalThreshold = 10;
      batteryWarningThreshold = 20;
      batteryCriticalThreshold = 5;
      enableDgpuMonitoring = false;
      useCustomColors = false;
      warningColor = "";
      criticalColor = "";
      externalMonitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
    };
    dock = {
      enabled = false;
      position = "bottom";
      displayMode = "auto_hide";
      dockType = "floating";
      # backgroundOpacity = 1;
      floatingRatio = 1;
      size = 1;
      onlySameOutput = true;
      monitors = [ ];
      pinnedApps = [ ];
      colorizeIcons = false;
      showLauncherIcon = false;
      launcherPosition = "end";
      launcherIconColor = "none";
      pinnedStatic = false;
      inactiveIndicators = false;
      groupApps = false;
      groupContextMenuMode = "extended";
      groupClickAction = "cycle";
      groupIndicatorStyle = "dots";
      deadOpacity = 0.6;
      animationSpeed = 1;
      sitOnFrame = false;
      showFrameIndicator = true;
      indicatorThickness = 3;
      indicatorColor = "primary";
      indicatorOpacity = 0.6;
    };
    network = {
      wifiEnabled = true;
      airplaneModeEnabled = false;
      bluetoothRssiPollingEnabled = false;
      bluetoothRssiPollIntervalMs = 60000;
      networkPanelView = "wifi";
      wifiDetailsViewMode = "grid";
      bluetoothDetailsViewMode = "grid";
      bluetoothHideUnnamedDevices = false;
      disableDiscoverability = false;
    };
    sessionMenu = {
      enableCountdown = true;
      countdownDuration = 10000;
      position = "center";
      showHeader = true;
      showKeybinds = true;
      largeButtonsStyle = true;
      largeButtonsLayout = "single-row";
      powerOptions = [
        {
          action = "lock";
          enabled = true;
          keybind = 1;
        }
        {
          action = "suspend";
          enabled = true;
          keybind = 2;
        }
        {
          action = "hibernate";
          enabled = true;
          keybind = 3;
        }
        {
          action = "reboot";
          enabled = true;
          keybind = 4;
        }
        {
          action = "logout";
          enabled = true;
          keybind = 5;
        }
        {
          action = "shutdown";
          enabled = true;
          keybind = 6;
        }
        {
          action = "rebootToUefi";
          enabled = true;
          keybind = 7;
        }
      ];
    };
    notifications = {
      enabled = true;
      enableMarkdown = false;
      density = "default";
      monitors = [ ];
      location = "top_right";
      overlayLayer = true;
      # backgroundOpacity = 1;
      respectExpireTimeout = false;
      lowUrgencyDuration = 3;
      normalUrgencyDuration = 8;
      criticalUrgencyDuration = 15;
      clearDismissed = true;
      saveToHistory = {
        low = true;
        normal = true;
        critical = true;
      };
      sounds = {
        enabled = false;
        volume = 0.5;
        separateSounds = false;
        criticalSoundFile = "";
        normalSoundFile = "";
        lowSoundFile = "";
        excludedApps = "discord,firefox,chrome,chromium,edge,zen,QQ";
      };
      enableMediaToast = false;
      enableKeyboardLayoutToast = true;
      enableBatteryToast = true;
    };
    osd = {
      enabled = true;
      location = "top_right";
      autoHideMs = 2000;
      overlayLayer = true;
      # backgroundOpacity = 1;
      enabledTypes = [
        0
        1
        2
      ];
      monitors = [ ];
    };
    audio = {
      volumeStep = 5;
      volumeOverdrive = true;
      cavaFrameRate = 30;
      visualizerType = "linear";
      mprisBlacklist = [ ];
      preferredPlayer = "";
      volumeFeedback = true;
      volumeFeedbackSoundFile = "";
    };
    brightness = {
      brightnessStep = 5;
      enforceMinimum = true;
      enableDdcSupport = false;
      backlightDeviceMappings = [ ];
    };
    colorSchemes = {
      useWallpaperColors = false;
      predefinedScheme = "Noctalia (default)";
      darkMode = true;
      schedulingMode = "off";
      manualSunrise = "06:30";
      manualSunset = "18:30";
      generationMethod = "tonal-spot";
      monitorForColors = "";
    };
    templates = {
      activeTemplates = [ ];
      enableUserTheming = false;
    };
    nightLight = {
      enabled = false;
      forced = false;
      autoSchedule = true;
      nightTemp = "4000";
      dayTemp = "6500";
      manualSunrise = "06:30";
      manualSunset = "18:30";
    };
    hooks = {
      enabled = false;
      wallpaperChange = "";
      darkModeChange = "";
      screenLock = "";
      screenUnlock = "";
      performanceModeEnabled = "";
      performanceModeDisabled = "";
      startup = "";
      session = "";
    };
    plugins = {
      autoUpdate = false;
    };
    idle = {
      enabled = true;
      screenOffTimeout = 300;
      lockTimeout = 330;
      suspendTimeout = 600;
      fadeDuration = 5;
      screenOffCommand = "";
      lockCommand = "";
      suspendCommand = "";
      resumeScreenOffCommand = "";
      resumeLockCommand = "";
      resumeSuspendCommand = "";
      customCommands = "[]";
    };
    desktopWidgets = {
      enabled = false;
      overviewEnabled = true;
      gridSnap = false;
      monitorWidgets = [ ];
    };
  };
}
