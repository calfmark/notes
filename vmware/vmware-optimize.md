- vmware虚拟机的性能优化，可以参考[这里](https://www.cnblogs.com/MirageFox/p/12806040.html)

- 每次开机会提示`bus 0.1`无法连接，尝试连接提示时，可以在虚拟机的设置里，将`CD\DVD(IDE)`启动时连接关掉, vmware设备编号可以参考[这里](https://docs.vmware.com/en/VMware-vSphere/7.0/com.vmware.vsphere.vm_admin.doc/GUID-5872D173-A076-42FE-8D0B-9DB0EB0E7362.html)
- 手段触发VMware共享目录挂载命令：

  ```
    sudo apt install -y open-vm-tools
    sudo apt install -y open-vm-tools-desktop
    sudo mkdir -p /mnt/hgfs
    sudo vmhgfs-fuse .host:/ /mnt/hgfs/
  ```
