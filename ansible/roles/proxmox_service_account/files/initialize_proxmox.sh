#!/bin/sh

PROXMOX_SA_USERNAME="$1"
PROXMOX_SA_PASSWORD="$2"

if [ -z "${PROXMOX_SA_USERNAME}" ]; then
  echo "Error: no username set"
  exit -1
fi

if [ -z "${PROXMOX_SA_PASSWORD}" ]; then
  echo "Error: no password set"
  exit -1
fi


pveum role add RemoteAdmin -privs "Mapping.Audit Mapping.Modify Mapping.Use Permissions.Modify Pool.Allocate Pool.Audit Realm.AllocateUser Realm.Allocate SDN.Allocate SDN.Audit Sys.Audit Sys.Console Sys.Incoming Sys.Modify Sys.AccessNetwork Sys.PowerMgmt Sys.Syslog User.Modify Group.Allocate SDN.Use VM.Allocate VM.Audit VM.Backup VM.Clone VM.Config.CDROM VM.Config.CPU VM.Config.Cloudinit VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Console VM.Migrate VM.Monitor VM.PowerMgmt VM.Snapshot.Rollback VM.Snapshot Datastore.Allocate Datastore.AllocateSpace Datastore.AllocateTemplate Datastore.Audit"
pveum aclmod / -user $PROXMOX_SA_USERNAME@pam -role RemoteAdmin
pveum user token add $PROXMOX_SA_USERNAME@pam