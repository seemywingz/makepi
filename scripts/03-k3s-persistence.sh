#!/bin/bash

# kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml

cat <<EOF | kubectl apply -f -
---
apiVersion: v1
kind: PersistentVolume
metadata:
  name: "ssd-movies"
spec:
  persistentVolumeReclaimPolicy: Retain
  storageClassName: "ssd-movies"
  capacity:
    storage: "900Gi"
  accessModes:
    - ReadWriteMany
  hostPath:
    path: "/mnt/ssd/movies"
EOF

cat <<EOF | kubectl apply -f -
---
apiVersion: v1
kind: PersistentVolume
metadata:
  name: "ssd-series"
spec:
  persistentVolumeReclaimPolicy: Retain
  storageClassName: "ssd-series"
  capacity:
    storage: "900Gi"
  accessModes:
    - ReadWriteMany
  hostPath:
    path: "/mnt/ssd/series"
EOF

# Create Media PV
cat <<EOF | kubectl apply -f -
---
apiVersion: v1
kind: PersistentVolume
metadata:
  name: "ssd-pny250-1"
spec:
  persistentVolumeReclaimPolicy: Retain
  storageClassName: "ssd-pny250-1"
  capacity:
    storage: "1Gi"
  accessModes:
    - ReadWriteMany
  hostPath:
    path: "/mnt/ssd/pny250"
EOF
