##
```bash 
selfdrive/car/toyota/values.py: needs update
{"event": "dirty comma branch", "version": "0.8.9", "dirty": true, "origin": "git@github.com:commaai/openpilot.git", "branch": "origin/master", "dirty_files": ":100644 100644 8858227b906a9c8cf3188f023e616732b357cdd0 0000000000000000000000000000000000000000 M\tselfdrive/car/toyota/values.py", "commit": "41934c9a9b5615d8dff6f061a1ca46455839f5e1", "origin_commit": "41934c9a9b5615d8dff6f061a1ca46455839f5e1"}

starting process ui
starting process camerad
starting process clocksd
starting process dmonitoringmodeld
starting process logcatd
starting process loggerd
starting process modeld
starting process proclogd
starting process ubloxd
starting process soundd
starting process locationd

./dmonitoringmodeld: 3: Bad substitution
./modeld: 3: Bad substitution

{"event": "fingerprinted", "car_fingerprint": "TOYOTA RAV4 HYBRID 2019", "source": 0, "fuzzy": false, "fw_count": 5}
```

## Delete params

```bash
$HOME/.comma/params/.tmp
```
p.managed_processes.values()

## 2021 Sept. 7th

- camerad is not starting
    - because sm['deviceState'].started is False
        - is set True by `thermald`  

### Control
```
ipdb> ret
<car.capnp:CarParams builder (
    carName = "toyota", 
    carFingerprint = "TOYOTA RAV4 HYBRID 2019", 
    enableGasInterceptor = false, 
    pcmCruise = true, 
    enableCameraDEPRECATED = false, 
    enableDsu = false, 
    enableApgs = false, 
    minEnableSpeed = -1, 
    minSteerSpeed = 0, 
    safetyModel = toyota, 
    safetyParam = 73, 
    steerMaxBP = [0], 
    steerMaxV = [1], 
    mass = 1762.1273, 
    wheelbase = 2.68986, 
    centerToFront = 1.1835384, 
    steerRatio = 14.3, 
    steerRatioRear = 0, 
    rotationalInertia = 2990.6238, 
    tireStiffnessFront = 171476.47, 
    tireStiffnessRear = 212983.06, 
    longitudinalTuning = (
        kpBP = [0, 5, 20], 
        kpV = [1.3, 1, 0.7], 
        kiBP = [0, 5, 12, 20, 27], 
        kiV = [0.35, 0.23, 0.2, 0.17, 0.1], 
        deadzoneBP = [0, 8.05], 
        deadzoneV = [0, 0.14]), 
    lateralTuning = (pid = (kpBP = [0], kpV = [0.6], kiBP = [0], kiV = [0.1], kf = 7.8185942e-05)),
    steerLimitAlert = false, 
    vEgoStopping = 0, 
    directAccelControl = false, 
    stoppingControl = false, 
    startAccel = 1.2, 
    steerRateCost = 1, 
    steerControlType = torque, 
    radarOffCan = false, 
    steerActuatorDelay = 0.12, 
    openpilotLongitudinalControl = true, 
    isPandaBlackDEPRECATED = false, 
    dashcamOnly = false, 
    safetyModelPassive = silent, 
    transmissionType = unknown, 
    radarTimeStep = 0.05, 
    communityFeature = false, 
    steerLimitTimer = 0.4, 
    fingerprintSource = can, 
    networkLocation = fwdCamera, 
    minSpeedCan = 0.3, 
    stoppingDecelRate = 0.3, 
    startingAccelRate = 6, 
    maxSteeringAngleDeg = 0, 
    fuzzyFingerprint = false, 
    enableBsm = false, 
    hasStockCamera = false)>

```

### Openpilot is not engageable
```
[DEBUG] engageable: False, 
[
    {'softDisable': <selfdrive.controls.lib.events.SoftDisableAlert object at 0x7f51ac05c640>, 'noEntry': <selfdrive.controls.lib.events.NoEntryAlert object at 0x7f51ac05c670>}, 
    
    {'softDisable': <selfdrive.controls.lib.events.SoftDisableAlert object at 0x7f51ac05c490>, 'noEntry': <selfdrive.controls.lib.events.NoEntryAlert object at 0x7f51ac05c4c0>}, 
    
    {'userDisable': <selfdrive.controls.lib.events.EngagementAlert object at 0x7f51ac05c160>, 'noEntry': <function wrong_car_mode_alert at 0x7f51ac055b80>}, {'userDisable': <selfdrive.controls.lib.events.EngagementAlert object at 0x7f51ac047fa0>}, 
    
    {'noEntry': <selfdrive.controls.lib.events.NoEntryAlert object at 0x7f51ac05ca00>}, 
    
    {'softDisable': <selfdrive.controls.lib.events.SoftDisableAlert object at 0x7f51ac05c760>, 'noEntry': <selfdrive.controls.lib.events.NoEntryAlert object at 0x7f51ac05c790>}
]

[DEBUG] engageable: False, 
[
    ('seatbeltNotLatched', {'softDisable': <selfdrive.controls.lib.events.SoftDisableAlert object at 0x7ff9d0536640>, 'noEntry': <selfdrive.controls.lib.events.NoEntryAlert object at 0x7ff9d0536670>}), 
    
    ('wrongGear', {'softDisable': <selfdrive.controls.lib.events.SoftDisableAlert object at 0x7ff9d0536490>, 'noEntry': <selfdrive.controls.lib.events.NoEntryAlert object at 0x7ff9d05364c0>}), 
    
    ('wrongCarMode', {'userDisable': <selfdrive.controls.lib.events.EngagementAlert object at 0x7ff9d0536160>, 'noEntry': <function wrong_car_mode_alert at 0x7ff9d052fb80>}), 
    
    ('pcmDisable', {'userDisable': <selfdrive.controls.lib.events.EngagementAlert object at 0x7ff9d0521fa0>}), 
    
    ('highCpuUsage', {'noEntry': <selfdrive.controls.lib.events.NoEntryAlert object at 0x7ff9d0536a00>}), 
    
    ('commIssue', {'softDisable': <selfdrive.controls.lib.events.SoftDisableAlert object at 0x7ff9d0536760>, 'noEntry': <selfdrive.controls.lib.events.NoEntryAlert object at 0x7ff9d0536790>})]

```
### Panda stuffs
```
ipdb> startup_conditions
{'ignition': False, 'hardware_supported': True, 'time_valid': True, 'up_to_date': True, 'not_uninstalling': True, 'accepted_terms': True, 'fw_version_match': True, 'free_space': True, 'completed_training': True, 'not_driver_view': True, 'not_taking_snapshot': True, 'device_temp_good': True}

ipdb> pandaState.pandaState
<log.capnp:PandaState reader (voltage = 14046, current = 0, ignitionLine = false, controlsAllowed = false, gasInterceptorDetected = false, startedSignalDetectedDEPRECATED = false, hasGps = true, canSendErrs = 0, canFwdErrs = 0, gmlanSendErrs = 0, pandaType = blackPanda, fanSpeedRpm = 0, usbPowerMode = cdp, ignitionCan = false, safetyModel = noOutput, faultStatus = none, powerSaveEnabled = true, uptime = 47, faults = [], canRxErrs = 0, safetyParam = 0, harnessStatus = normal, heartbeatLost = false)>

ipdb> sm['deviceState']
<log.capnp:DeviceState reader (
    cpu0DEPRECATED = 0,
    cpu1DEPRECATED = 0,
    cpu2DEPRECATED = 0,
    cpu3DEPRECATED = 0,
    memDEPRECATED = 0,
    gpuDEPRECATED = 0,
    batDEPRECATED = 0,
    freeSpacePercent = 42.675163,
    batteryPercent = 100,
    batteryStatus = "Charging",
    fanSpeedPercentDesired = 0,
    started = false,
    usbOnline = false,
    startedMonoTime = 0,
    thermalStatus = green,
    batteryCurrent = 0,
    batteryVoltage = 0,
    chargingError = false,
    chargingDisabled = false,
    memoryUsagePercent = 8,
    cpuUsagePercentDEPRECATED = 0,
    pa0DEPRECATED = 0,
    networkType = wifi,
    offroadPowerUsageUwh = 0,
    networkStrength = unknown,
    carBatteryCapacityUwh = 11703847,
    cpuTempC = [0],
    gpuTempC = [0],
    memoryTempC = 0, batteryTempC = 0, ambientTempC = 0, lastAthenaPingTime = 0, gpuUsagePercent = 0, cpuUsagePercent = [2, 0, 0, 11, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 4, 0])>
```