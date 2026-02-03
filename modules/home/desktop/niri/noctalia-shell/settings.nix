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
      # New features
      displayMode = "always_visible";
      autoHideDelay = 500;
      autoShowDelay = 150;
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
          { id = "Clock"; }
          { id = "MediaMini"; }
        ];
        right = [
          {
            id = "Tray";
            "drawerEnabled" = false;
          }
          { id = "SystemMonitor"; }
          { id = "ScreenRecorder"; }
          { id = "NotificationHistory"; }
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
      lockOnSuspend = true;
      showSessionButtonsOnLockScreen = true;
      showHibernateOnLockScreen = false;
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
    };
    ui = {
      # fontDefault = "";
      # fontFixed = "";
      fontDefaultScale = 1;
      fontFixedScale = 1;
      tooltipsEnabled = true;
      # panelBackgroundOpacity = lib.mkForce 0.6;
      panelsAttachedToBar = true;
      settingsPanelMode = "attached";
      wifiDetailsViewMode = "grid";
      bluetoothDetailsViewMode = "grid";
      networkPanelView = "wifi";
      bluetoothHideUnnamedDevices = false;
      boxBorderEnabled = false;
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
      randomEnabled = false;
      # New features
      automationEnabled = false;
      wallpaperChangeMode = "random";
      randomIntervalSec = 300;
      transitionDuration = 1500;
      transitionType = "random";
      transitionEdgeSmoothness = 5.0e-2;
      panelPosition = "follow_bar";
      hideWallpaperFilenames = false;
      # New features
      sortOrder = "name";
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
      # New feature
      enableWindowsSearch = true;
      ignoreMouseInput = false;
      screenshotAnnotationTool = "";
    };
    controlCenter = {
      position = "close_to_bar_button";
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
      # New features
      diskAvailWarningThreshold = 20;
      diskAvailCriticalThreshold = 10;
      cpuPollingInterval = 3000;
      tempPollingInterval = 3000;
      gpuPollingInterval = 3000;
      enableDgpuMonitoring = false;
      memPollingInterval = 3000;
      diskPollingInterval = 3000;
      networkPollingInterval = 3000;
      loadAvgPollingInterval = 3000;
      useCustomColors = false;
      warningColor = "";
      criticalColor = "";
      externalMonitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
    };
    dock = {
      enabled = false;
      # New feature
      position = "bottom";
      displayMode = "auto_hide";
      # backgroundOpacity = 1;
      floatingRatio = 1;
      size = 1;
      onlySameOutput = true;
      monitors = [ ];
      pinnedApps = [ ];
      colorizeIcons = false;
      pinnedStatic = false;
      inactiveIndicators = false;
      deadOpacity = 0.6;
      animationSpeed = 1;
    };
    network = {
      wifiEnabled = true;
      bluetoothRssiPollingEnabled = false;
      bluetoothRssiPollIntervalMs = 10000;
      wifiDetailsViewMode = "grid";
      bluetoothDetailsViewMode = "grid";
      bluetoothHideUnnamedDevices = false;
    };
    sessionMenu = {
      enableCountdown = true;
      countdownDuration = 10000;
      position = "center";
      showHeader = true;
      largeButtonsStyle = false;
      largeButtonsLayout = "grid";
      showNumberLabels = true;
      powerOptions = [
        {
          action = "lock";
          enabled = true;
        }
        {
          action = "suspend";
          enabled = true;
        }
        {
          action = "hibernate";
          enabled = true;
        }
        {
          action = "reboot";
          enabled = true;
        }
        {
          action = "logout";
          enabled = true;
        }
        {
          action = "shutdown";
          enabled = true;
        }
      ];
    };
    notifications = {
      enabled = true;
      monitors = [ ];
      location = "top_right";
      overlayLayer = true;
      # backgroundOpacity = 1;
      respectExpireTimeout = false;
      lowUrgencyDuration = 3;
      normalUrgencyDuration = 8;
      criticalUrgencyDuration = 15;
      enableKeyboardLayoutToast = true;
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
      # New feature
      volumeFeedback = true;
      externalMixer = "pwvucontrol || pavucontrol";
    };
    brightness = {
      brightnessStep = 5;
      enforceMinimum = true;
      enableDdcSupport = false;
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
    desktopWidgets = {
      enabled = false;
      gridSnap = false;
      monitorWidgets = [ ];
    };
  };
}
